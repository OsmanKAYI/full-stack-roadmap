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
