# WiFi Connection Problem Solved on Ubuntu with NetworkManager

## Common Network Issues

If you're experiencing network connectivity issues on Linux, especially with WiFi, these commands can help resolve common NetworkManager problems.

## Basic NetworkManager Commands

### 1. Enable NetworkManager at Boot

```bash
sudo systemctl enable NetworkManager
```

- Ensures NetworkManager starts automatically on system boot
- Creates necessary symlinks for systemd

### 2. Start NetworkManager Service

```bash
sudo systemctl start NetworkManager
```

- Immediately starts the NetworkManager service
- Use this if NetworkManager is not running

### 3. Edit NetworkManager Configuration

```bash
sudo vi /etc/NetworkManager/NetworkManager.conf
```

- Opens the NetworkManager configuration file in vi editor
- Common settings to check:
  - `[ifupdown] managed=true` - Ensures NetworkManager manages network interfaces
  - `[device] wifi.scan-rand-mac-address=no` - Disables MAC address randomization

### 4. Restart NetworkManager

```bash
sudo systemctl restart NetworkManager
```

- Applies any configuration changes
- Restarts the NetworkManager service

## Troubleshooting

To check NetworkManager status:

```bash
systemctl status NetworkManager
```

To view NetworkManager logs:

```bash
journalctl -u NetworkManager -b
```

## Common Issues Resolved

1. **WiFi not showing up**
2. **NetworkManager not starting on boot**
3. **Connection issues after system update**
4. **Interface management conflicts**

Remember to test your network connection after applying these changes. If issues persist, check system logs for specific error messages.
