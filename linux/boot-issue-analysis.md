# Boot Issue Analysis & Troubleshooting

> How to analyze Linux boot problems, identify root causes, and diagnose
> common errors from kernel logs (dmesg) and systemd journal.
> Tested on Ubuntu 24.04 (kernel 7.0.0-28-generic, TUXEDO laptop).

## 1. Log Sources

Linux stores boot information in several places. Know which to check first.

| Source                         | Command                                 | Contains                    |
| ------------------------------ | --------------------------------------- | --------------------------- |
| Current kernel ring buffer     | `dmesg`                                 | Kernel messages since boot  |
| Kernel journal (current boot)  | `journalctl -k` or `journalctl -k -b 0` | Kernel messages, structured |
| Kernel journal (previous boot) | `journalctl -k -b -1`                   | Last boot's kernel messages |
| All journal (current boot)     | `journalctl -b`                         | Kernel + systemd + apps     |
| Persistent log files           | `/var/log/dmesg`, `/var/log/kern.log`   | Same as above, on disk      |
| Boot splash log                | `/var/log/boot.log`                     | Plymouth / console messages |

> If `dmesg` returns "Operation not permitted", use `journalctl -k` instead.
> You may need to be in the `adm` group: `sudo usermod -aG adm $USER`.

## 2. List All Boots

To see boot history and identify abnormal boots (crashes, power loss):

```bash
journalctl --list-boots
```

Output example:

```text
IDX   BOOT ID                          FIRST ENTRY                LAST ENTRY
-3    37740c71... Thu 2026-08-13 13:16 Fri 2026-08-14 05:39
-2    7f6ede17... Fri 2026-08-14 12:44 Fri 2026-08-14 12:49   # very short = crash
-1    801153ea... Fri 2026-08-14 18:44 Sat 2026-08-15 10:45
 0    9fe2b9a2... Sat 2026-08-15 10:46 Sat 2026-08-15 10:53
```

> A boot with a very short duration (e.g. 5 minutes) often indicates a crash
> or forced power-off. Investigate that boot with `journalctl -b -2`.

## 3. Find Failed Services

```bash
# Currently failed units
systemctl --failed --no-pager

# Why a specific unit failed
systemctl status <unit-name> --no-pager -l
journalctl -u <unit-name> -b --no-pager
```

## 4. Filter Errors from Kernel Log

```bash
# All errors/warnings in current boot
journalctl -k -b | grep -iE "error|fail|warn|critical|panic|oops|bug|denied|timeout|not found|unable|refused|missing|corrupt"

# Exclude noisy drivers (e.g. GPU) to focus on real issues
journalctl -k -b | grep -iE "error|fail|warn" | grep -viE "i915|drm|gpu"
```

## 5. Common Boot Errors & Root Causes

### 5.1 Kernel Module Build Failure (DKMS)

**Symptom:**

```text
vboxdrv.service: Control process exited, code=exited, status=1/FAILURE
fatal error: VBox/cdefs.h: No such file or directory
```

**Root cause:** A DKMS-managed kernel module (VirtualBox, NVIDIA, TUXEDO drivers)
cannot compile against the currently running kernel. Usually because:

- The module source package is outdated and incompatible with the new kernel.
- Kernel headers are missing: `sudo apt install linux-headers-$(uname -r)`.
- Two conflicting versions of the same module are installed (e.g. virtualbox-7.0
  and virtualbox-7.1 together).

**Fix:**

```bash
# Check the build log
cat /var/log/vbox-setup.log    # for VirtualBox
dkms status                    # for any DKMS module

# Reinstall the module against current kernel
sudo dkms install <module>/<version> -k $(uname -r)

# Or remove the module entirely if unused
sudo apt-get purge -y virtualbox-7.0 virtualbox-7.1
```

### 5.2 Snap Mount Failure

**Symptom:**

```text
snap-snap\x2dstore-1270.mount: failed
```

**Root cause:** A snap revision is broken or partially downloaded. The snap
system generates a `.mount` unit for each revision; if the revision is broken,
the mount unit fails at boot.

**Diagnosis:**

```bash
snap list <name> --all
# Look for "disabled,broken" in the Notes column
```

**Fix:**

```bash
# Remove only the broken revision (keep the working one)
sudo snap remove <name> --revision=<broken-rev>

# Clear the failed state from systemd
sudo systemctl reset-failed
```

### 5.3 Journal Corruption (Unclean Shutdown)

**Symptom:**

```text
systemd-journald: File /var/log/journal/.../system.journal corrupted or uncleanly shut down, renaming and replacing.
```

**Root cause:** The system was not shut down cleanly — power loss, forced reset,
or kernel panic. The journal file was not properly closed.

**Impact:** Usually harmless. systemd renames the corrupt file and creates a new
one. Historical logs from that session may be partially lost.

**Fix / Prevention:**

```bash
# Clean up old/corrupt journals (keeps last 2 weeks)
sudo journalctl --vacuum-time=2weeks

# Always shut down cleanly
sudo shutdown -h now
# Avoid holding the power button unless the system is frozen
```

### 5.4 Kernel Taint Warnings

**Symptom:**

```text
Tainted: [P]=PROPRIETARY_MODULE, [U]=USER, [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
nvidia: module verification failed: signature and/or required key missing - tainting kernel
```

**Root cause:** Proprietary or out-of-tree kernel modules (NVIDIA, VirtualBox)
are loaded without a cryptographic signature. This is expected on most desktop
systems and is **not harmful**.

**Meaning of taint flags:**

| Flag | Meaning                   |
| ---- | ------------------------- |
| P    | Proprietary module loaded |
| O    | Out-of-tree module loaded |
| E    | Unsigned module loaded    |
| U    | User-requested taint      |
| W    | Warning has been issued   |

> These flags tell kernel developers "don't trust bug reports from this system"
> because non-standard code is running. They do not affect daily use.

### 5.5 AppArmor DENIED Messages

**Symptom:**

```text
audit: apparmor="DENIED" operation="open" profile="firefox" name="/proc/.../oom_score_adj"
```

**Root cause:** AppArmor security profiles block certain operations by
applications (Firefox, containers, etc.). This is **by design** — the security
framework is doing its job.

**Action:** Usually no action needed. If an application is broken because of
AppArmor, you can investigate the profile:

```bash
# Check AppArmor status
sudo aa-status

# Complain mode (logs but allows) for a profile
sudo aa-complain /etc/apparmor.d/usr.bin.firefox

# Never disable AppArmor entirely unless you understand the risk
```

### 5.6 Intel / Hardware-Specific Warnings

**Symptoms:**

```text
unchecked MSR access error: WRMSR to 0xd10
intel-hid: failed to enable HID power button
proc_thermal_pci: error: proc_thermal_add, will continue
asus_wmi: ASUS Management GUID not found
```

**Root cause:** These are hardware/firmware quirks. The kernel tries to access
MSRs or WMI interfaces that the specific hardware does not support.

**Impact:** Almost always harmless. The driver logs an error and continues.

**Action:** No action needed unless the specific functionality is broken (e.g.
power button not working). In that case, update BIOS firmware from the
manufacturer's website.

### 5.7 Crash Report Accumulation in /var/crash

**Symptom:**

```text
apport-autoreport.service runs for 13-15 seconds during/after boot
whoopsie-upload-all: Collecting info for /var/crash/_opt_kingsoft_wps-office_...crash
```

**Root cause:** When applications crash (Firefox, WPS Office, etc.), Apport
writes a `.crash` file to `/var/crash/`. The `apport-autoreport.path` unit
monitors this directory and triggers `apport-autoreport.service` whenever a new
file appears. The service then tries to upload each report via `whoopsie`,
waiting up to 20 seconds per file.

Over time, `/var/crash/` can accumulate hundreds of MB of stale crash reports
that trigger the service on every boot.

**Diagnosis:**

```bash
# Check if apport-autoreport is being triggered
systemctl status apport-autoreport.service --no-pager
journalctl -u apport-autoreport.service -b --no-pager | tail -20

# Check both trigger mechanisms
systemctl is-enabled apport-autoreport.timer apport-autoreport.path

# Check crash report accumulation
ls -la /var/crash/
du -sh /var/crash/
```

**Fix:**

```bash
# Disable both triggers (timer = time-based, path = file-based)
sudo systemctl disable --now apport-autoreport.timer
sudo systemctl disable --now apport-autoreport.path

# Clean up accumulated crash reports
sudo rm -f /var/crash/*.crash /var/crash/*.upload /var/crash/*.uploaded

# Verify
systemctl is-enabled apport-autoreport.timer apport-autoreport.path
# Both should say: disabled
```

> If you only disable `.timer`, the `.path` unit will still fire whenever a new
> crash file appears. Always disable **both** triggers.

### 5.8 Hybrid-Sleep / Hibernation Crash (System Won't Wake Up)

**Symptom:**

The system goes to sleep fine the first time (manual `systemctl suspend`), but
on the second sleep (often triggered by GNOME idle timeout) the system freezes
and cannot be woken up — requires a forced power-off (holding power button 5+ seconds).

Journal shows the system entering `hybrid-sleep` instead of `suspend`, then
freezing during hibernation:

```text
systemd-logind: The system will enter hybrid sleep now!
systemd-hybrid-sleep.service - System Hybrid Suspend+Hibernate...
PM: Image not found (code -16)
PM: hibernation: hibernation entry
Filesystems sync: 0.011 seconds
  ← NO MORE LOGS — system frozen
```

**Root cause:** `hybrid-sleep` tries to do both suspend (RAM) and hibernate
(disk) simultaneously. Hibernation requires swap space **at least as large as
RAM**. When swap < RAM, the hibernation image cannot be written and the system
freezes.

Common on laptops with large RAM and small swap:

```text
RAM:   32 GB
Swap:   8 GB   ← too small for hibernation
```

systemd-logind may auto-upgrade a `suspend` request to `hybrid-sleep` when on
AC power, if `AllowHybridSleep=yes` (the default). This means even
`systemctl suspend` can trigger hybrid-sleep without the user knowing.

> Note: `systemctl suspend -i` (the `-i` / `--check-inhibitors=no` flag) does
> NOT cause this. `-i` only skips inhibitor checks from applications. The
> sleep mode (suspend vs hybrid-sleep) is determined by systemd-logind, not
> by the `-i` flag.

**Diagnosis:**

```bash
# Check RAM vs Swap sizes
free -h
swapon --show

# Hibernation requires swap >= RAM. If swap < RAM, hibernation will fail.

# Check what sleep states the kernel supports
cat /sys/power/state
# "freeze mem disk" — "disk" means hibernation is supported by the kernel

# Check if hybrid-sleep was triggered instead of suspend
journalctl -b <boot-id> --no-pager | grep -iE "suspend|hybrid|hibernate" | \
  grep -iE "Performing|Starting|enter"

# Look for: "Performing sleep operation 'hybrid-sleep'" (bad)
# vs:       "Performing sleep operation 'suspend'" (good)

# Check GNOME idle sleep settings (auto-sleep after inactivity)
gsettings list-recursively org.gnome.settings-daemon.plugins.power | \
  grep -iE "sleep-inactive|lid-close"
```

**Fix — Disable hibernation and hybrid-sleep entirely:**

```bash
# 1) Create systemd sleep config drop-in
sudo mkdir -p /etc/systemd/sleep.conf.d
sudo tee /etc/systemd/sleep.conf.d/disable-hibernate.conf > /dev/null << 'EOF'
[Sleep]
AllowHibernation=no
AllowHybridSleep=no
AllowSuspendThenHibernate=no
EOF

# 2) Mask the hibernation and hybrid-sleep services (they can never start)
sudo systemctl mask \
  systemd-hybrid-sleep.service \
  systemd-hibernate.service \
  systemd-suspend-then-hibernate.service

# 3) Reload systemd
sudo systemctl daemon-reload

# 4) Verify
cat /etc/systemd/sleep.conf.d/disable-hibernate.conf
systemctl is-enabled \
  systemd-hybrid-sleep.service \
  systemd-hibernate.service \
  systemd-suspend-then-hibernate.service
# All three should say: masked
```

After this fix, both manual `systemctl suspend` and GNOME auto-sleep will use
regular `suspend` (RAM-only), which works reliably regardless of swap size.

> If you actually need hibernation (e.g. battery drain during sleep is a
> concern), increase swap to at least match RAM:
>
> ```bash
> sudo swapoff /swap.img
> sudo fallocate -l 36G /swap.img   # RAM size + a few GB buffer
> sudo chmod 600 /swap.img
> sudo mkswap /swap.img
> sudo swapon /swap.img
> ```
>
> But hibernation on NVIDIA systems can still be unreliable — test thoroughly
> before relying on it.

### 5.9 Suspend Mode: s2idle vs S3 Deep Sleep (Platform Won't Wake from S3)

**Symptom:**

After disabling hybrid-sleep (section 5.8), the system still won't wake from
suspend. Journal shows `PM: suspend entry (deep)` as the last log — no
`suspend exit`, no resume, system completely frozen.

```text
systemd-suspend.service - System Suspend...
Performing sleep operation 'suspend'...
PM: suspend entry (deep)
  ← NO MORE LOGS — system frozen, requires forced power-off
```

**Root cause:** Modern Intel/AMD platforms support two suspend modes:

| Mode   | Kernel name         | Description                                                             |
| ------ | ------------------- | ----------------------------------------------------------------------- |
| s2idle | Modern Standby      | CPU enters low-power idle, devices stay partially powered. Faster wake. |
| deep   | S3 (Suspend-to-RAM) | Full power-off of most components. Slower wake, more power savings.     |

Some platforms (especially Alder Lake-P laptops with NVIDIA PRIME) **do not
properly support S3 deep sleep** — the firmware/BIOS claims to support it, but
the system cannot resume. This is increasingly common on modern laptops where
the manufacturer only tests s2idle (Modern Standby).

**Diagnosis:**

```bash
# Check available suspend modes (bracket = currently selected)
cat /sys/power/mem_sleep
# Output: [s2idle] deep    ← s2idle is default
# Output: s2idle [deep]    ← deep is default (may cause wake failure)

# Check which mode was used in a failed suspend
journalctl -b <boot-id> --no-pager | grep "PM: suspend entry"
# "PM: suspend entry (s2idle)"  ← Modern Standby (usually works)
# "PM: suspend entry (deep)"    ← S3 (may not wake on some platforms)

# Check if the system woke up at all
journalctl -b <boot-id> --no-pager | grep -iE "suspend exit|returned from sleep"
# If empty — the system never resumed (frozen in sleep)
```

**Fix — Force s2idle (Modern Standby):**

```bash
# 1) Set s2idle as default in GRUB
#    Add mem_sleep_default=s2idle to GRUB_CMDLINE_LINUX_DEFAULT
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/GRUB_CMDLINE_LINUX_DEFAULT="mem_sleep_default=s2idle /' \
  /etc/default/grub

# Or if you previously set mem_sleep_default=deep, remove it:
sudo sed -i 's/ mem_sleep_default=deep//' /etc/default/grub

# 2) Rebuild GRUB config
sudo update-grub

# 3) Reboot and verify
sudo reboot
# After reboot:
cat /sys/power/mem_sleep
# Expected: [s2idle] deep
```

> Do NOT set `mem_sleep_default=deep` on platforms that don't support S3 properly.
> The kernel will enter deep sleep but the firmware cannot resume — the system
> appears dead and requires a forced power-off.

**Testing suspend reliability:**

```bash
# Suspend and check if it wakes
systemctl suspend

# After waking, verify
journalctl -b 0 --no-pager | grep -iE "suspend entry|suspend exit|returned from"
# Should show both entry AND exit
```

### 5.10 i915 Type-C PHY Warnings on Resume (Harmless)

**Symptom:**

After waking from s2idle suspend, the kernel log shows repeated i915 Type-C
PHY warnings:

```text
i915 0000:00:02.0: [drm] *ERROR* Port D/TC#1: timeout waiting for PHY ready
i915 0000:00:02.0: [drm] drm_WARN_ON(tc->mode == TC_PORT_LEGACY)
WARNING: drivers/gpu/drm/i915/display/intel_tc.c:934 at adlp_tc_phy_connect
GPU process exited unexpectedly: exit_code=8704
```

These may also appear during **every boot**, not just after resume.

**Root cause:** On Alder Lake-P (adlp) platforms with NVIDIA PRIME (NVIDIA
drives the internal display, Intel i915 is idle), the i915 driver still probes
Type-C PHY ports during boot and resume. Since no display is connected to the
Intel GPU, the PHY probe times out.

This is a **known i915 driver bug** on adlp platforms and is **harmless** when
NVIDIA PRIME is the active GPU. The warnings are noise — they do not affect
display output (which is handled by NVIDIA) or system stability.

**Diagnosis:**

```bash
# Check which GPU drives the display
prime-select query
# "nvidia" — NVIDIA drives display, i915 is idle

# Check Intel GPU connectors (all should be disconnected)
for c in /sys/class/drm/card0-*/status; do
  connector=$(echo $c | sed 's|/status||')
  echo "$connector: $(cat $c)"
done
# card0-eDP-2: disconnected
# card0-HDMI-A-1: disconnected

# Check NVIDIA GPU connectors (eDP should be connected)
for c in /sys/class/drm/card1-*/status; do
  connector=$(echo $c | sed 's|/status||')
  echo "$connector: $(cat $c)"
done
# card1-eDP-1: connected    ← NVIDIA drives the internal display
```

**Action:** No action needed. These warnings are cosmetic noise from the i915
driver probing unused Type-C PHY ports. They do not cause wake failures or
display problems when NVIDIA PRIME is active.

> **Warning:** Do NOT use `i915.disable_display=1` to suppress these warnings
> on NVIDIA PRIME laptops. On some platforms, the Intel i915 GPU handles the
> display during early boot (before the NVIDIA driver loads). Disabling i915
> display output can result in a **black screen on boot** — the system boots
> but nothing is visible until the NVIDIA driver takes over, which may not
> happen without a working display handshake.
>
> If you must suppress the warnings, use `i915.enable_dc=0 i915.enable_psr=0`
> instead (these disable display power-saving features that trigger PHY probe,
> without disabling the display entirely). But in most cases, simply ignoring
> the warnings is the correct approach.

## 6. Analyzing a Specific Boot

Step-by-step workflow to diagnose a problematic boot:

```bash
# Step 1: Identify which boot had the problem
journalctl --list-boots

# Step 2: Check if that boot ended abnormally (no clean shutdown message)
journalctl -b -1 | grep -iE "shutdown|power|halt|panic|oops|segfault"

# Step 3: Look at the last 50 lines before the boot ended
journalctl -b -1 --no-pager | tail -50

# Step 4: Check for kernel panics or oopses
journalctl -k -b -1 | grep -iE "panic|oops|bug|trace|segfault"

# Step 5: Check for failed services in that boot
systemctl --failed --boot=-1

# Step 6: Check hardware errors (MCE, EDAC)
journalctl -k -b -1 | grep -iE "mce|edac|hardware error|machine check"
```

## 7. Check for Hardware Issues

```bash
# Memory errors (ECC RAM)
journalctl -k | grep -i "edac"

# CPU machine check exceptions
journalctl -k | grep -i "mce"

# Disk / filesystem errors
journalctl -k | grep -iE "ata|sata|nvme|ext4|i/o error|read error"

# Thermal throttling
journalctl -k | grep -i "throttl"

# Full dmesg with timestamps for context
dmesg -T | less
```

## 8. Useful One-Liners

```bash
# Boot time for last 5 boots
for b in 0 -1 -2 -3 -4; do
  echo -n "Boot $b: "
  journalctl -b $b | grep -m1 "Startup finished"
done

# Top 10 slowest services in current boot
systemd-analyze blame | head -10

# Critical chain (what blocks graphical.target)
systemd-analyze critical-chain

# Check if system was cleanly shut down last time
journalctl -b -1 | grep -i "Reached target.*Shutdown" || echo "UNCLEAN SHUTDOWN"

# Find all units that took more than 2 seconds
systemd-analyze blame | awk '$1 ~ /[2-9]\.[0-9]+s/ || $1 ~ /[0-9]{2,}/'
```

## 9. Red Flags — Investigate Immediately

| Log entry                                 | Possible cause                     |
| ----------------------------------------- | ---------------------------------- |
| `kernel panic`                            | Fatal kernel error, system halted  |
| `BUG: unable to handle kernel`            | Null pointer dereference in kernel |
| `Call Trace:`                             | Kernel oops, driver bug            |
| `segfault at`                             | Application or library crash       |
| `MCE: The hardware reports a fatal error` | CPU or RAM hardware failure        |
| `I/O error, dev`                          | Disk failure or bad cable          |
| `EXT4-fs error`                           | Filesystem corruption              |
| `OOM-killer`                              | Out of memory, process killed      |
| `drm: GPU HANG`                           | Graphics driver/hardware hang      |

## 10. Safe Troubleshooting Practices

1. **Always investigate before fixing.** Understanding the root cause prevents
   you from "fixing" the symptom and breaking something else.
2. **Never delete journal files manually.** Use `journalctl --vacuum-*` commands.
3. **Backup config files before editing:**

   ```bash
   sudo cp /etc/default/grub /etc/default/grub.bak
   ```

4. **Keep a live USB handy** in case the system becomes unbootable.
5. **Test one change at a time** — if you change 5 things and the system breaks,
   you won't know which one caused it.
6. **Document what you changed** so you can revert if needed.
7. **Do not disable critical services:** `systemd-journald`, `dbus`, `udev`,
   `gdm`/`display-manager`, `NetworkManager` (the service itself, not the
   wait-online variant).
