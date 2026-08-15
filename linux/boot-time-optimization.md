# Boot Time Optimization

> Practical techniques to reduce Linux boot time without breaking the system.
> Tested on Ubuntu 24.04 (kernel 7.0.0-28-generic, TUXEDO laptop).

## 1. Measure First

You cannot optimize what you cannot measure. Always start by quantifying the current boot time and identifying the slowest units.

```bash
# Total boot time breakdown (firmware + loader + kernel + userspace)
systemd-analyze

# Slowest units, sorted by time
systemd-analyze blame | head -20

# Critical chain (which units block graphical.target)
systemd-analyze critical-chain
```

Example output before optimization:

```text
Startup finished in 6.753s (firmware) + 3.442s (loader) + 10.364s (kernel) + 15.581s (userspace) = 36.141s
```

The four phases:

| Phase     | What it covers             | Can we optimize?          |
| --------- | -------------------------- | ------------------------- |
| Firmware  | BIOS/UEFI POST             | Yes (BIOS settings)       |
| Loader    | GRUB                       | Yes (timeout, splash)     |
| Kernel    | Kernel init + driver probe | Partially (kernel params) |
| Userspace | systemd units              | Yes (biggest win)         |

## 2. Identify Failed Units

Failed units can silently delay boot because systemd may wait or retry.

```bash
systemctl --failed --no-pager
```

Fix or disable any failed unit. A failed unit that is no longer installed can be cleared with:

```bash
sudo systemctl reset-failed
```

## 3. Disable Unnecessary Wait Services

These are the most common boot-time killers on desktop Ubuntu.

### 3.1 NetworkManager-wait-online.service

Waits until the network is fully connected. Rarely needed on a laptop with WiFi (you log in before WiFi connects anyway).

```bash
sudo systemctl disable NetworkManager-wait-online.service
```

> Note: This does NOT disable NetworkManager itself. WiFi still connects after login. It only removes the "block boot until online" requirement.

### 3.2 apport-autoreport.timer

Uploads crash reports to Ubuntu servers during boot. Can wait up to 20 seconds for the upload daemon.

```bash
sudo systemctl disable --now apport-autoreport.timer
```

### 3.3 plymouth-quit-wait.service

Plymouth (the boot splash screen) blocks `graphical.target` until it finishes. Removing `splash` from GRUB eliminates this wait entirely.

```bash
# Edit /etc/default/grub
# Change: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ..."
# To:     GRUB_CMDLINE_LINUX_DEFAULT="quiet ..."
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash/GRUB_CMDLINE_LINUX_DEFAULT="quiet/' /etc/default/grub
sudo update-grub
```

> Trade-off: You will see boot text messages instead of a splash logo. This is actually useful for diagnosing boot issues.

## 4. Reduce GRUB Timeout

If `GRUB_TIMEOUT` is set to 5 or 10, that is pure wasted time on every boot.

```bash
# In /etc/default/grub
GRUB_TIMEOUT=0          # skip menu entirely (default OS boots)
GRUB_TIMEOUT_STYLE=hidden
sudo update-grub
```

> To access the GRUB menu when needed: hold **Shift** during boot (BIOS) or press **Esc** repeatedly (UEFI).

## 5. Firmware / BIOS Optimizations

These are done in the BIOS/UEFI setup (press F2/Del during POST):

- **Disable Fast Boot cautiously** — can skip USB/keyboard init. Test first.
- **Enable Wake-on-LAN only if needed** — it keeps the NIC powered.
- **Disable unused boot devices** — e.g. network boot (PXE), CD/DVD.
- **Reduce POST checks** — some BIOSes have a "quick POST" option.
- **Update BIOS firmware** — newer versions often have faster POST.

## 6. Kernel Parameter Tuning

Add these to `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub` if applicable:

| Parameter           | Effect                                          |
| ------------------- | ----------------------------------------------- |
| `quiet`             | Suppress most kernel messages (already default) |
| `loglevel=3`        | Only show warnings/errors                       |
| `raid=noautodetect` | Skip RAID scan if you have no RAID              |
| `nodmraid`          | Disable dmraid device scanning                  |
| `ipv6.disable=1`    | Disable IPv6 if unused (saves module init time) |

After any change:

```bash
sudo update-grub
```

## 7. Remove Unused Kernels

Old kernels occupy disk and slow down GRUB generation. Keep only the current one and one fallback.

```bash
# List installed kernels
dpkg -l | grep linux-image | awk '{print $2}'

# Remove old ones (do NOT remove the running kernel!)
sudo apt-get purge -y linux-image-6.8.0-45-generic  # example
sudo apt-get autoremove --purge -y
```

> The running kernel is shown by `uname -r`. Never purge that version.

## 8. Disable Unused Services

Audit which services start at boot and disable what you do not need:

```bash
# List enabled services
systemctl list-unit-files --state=enabled --no-pager

# Disable examples (only if you know you don't need them)
sudo systemctl disable cups.service          # printing
sudo systemctl disable bluetooth.service     # if no BT hardware
sudo systemctl disable modem-manager.service # if no mobile broadband
```

> Caution: Only disable services you fully understand. Disabling the wrong one can make the system unbootable or lose functionality.

## 9. Verify After Reboot

```bash
systemd-analyze
systemd-analyze blame | head -10
systemctl --failed --no-pager
```

Compare with the "before" numbers. A typical optimization result:

```text
Before: 36.1s total (userspace 15.6s)
After:  ~20s total (userspace ~3-4s)
```

## 10. Golden Rules

1. **Never disable a service you don't understand.** Research it first.
2. **Always run `sudo update-grub` after editing `/etc/default/grub`.**
3. **Keep at least one fallback kernel** in case the current one breaks.
4. **Test after every change** — reboot and verify the system comes up.
5. **Do not disable display manager (gdm/display-manager.service)** or the system will boot to a black screen.
6. **Do not disable systemd-journald, dbus, or udev** — these are critical.
7. **Backup `/etc/default/grub` before editing:**

   ```bash
   sudo cp /etc/default/grub /etc/default/grub.bak
   ```
