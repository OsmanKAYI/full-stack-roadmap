# Lutris Wine Troubleshooting Guide

## Problem

Winetricks fails with error: `wine cmd.exe /c echo '%AppData%' returned empty string`  
Wineboot fails with: `Wine cannot find the FreeType font library` and `could not load kernel32.dll`

## Root Cause

Missing 32-bit (i386) libraries required by Wine.

## Solution

### 1. Enable 32-bit Architecture

```bash
sudo dpkg --add-architecture i386
sudo apt update
```

### 2. Install Required Libraries

```bash
sudo apt install -y \
    libfreetype6:i386 libgnutls30t64:i386 libpng16-16t64:i386 \
    libxrandr2:i386 libxinerama1:i386 libxcursor1:i386 \
    libxi6:i386 libxcomposite1:i386 libxext6:i386 \
    libxfixes3:i386 libxrender1:i386 libasound2t64:i386 \
    libopenal1:i386 libvulkan1:i386 mesa-vulkan-drivers:i386
```

> **Note:** Ubuntu 24.04+ uses `libasound2t64` instead of `libasound2`

### 3. Recreate Wine Prefix

```bash
rm -rf /path/to/wineprefix
WINEPREFIX="/path/to/wineprefix" /path/to/wine/bin/wineboot -u
```

### 4. Install Corefonts

```bash
WINEPREFIX="/path/to/wineprefix" \
WINE="/path/to/wine/bin/wine" \
/path/to/winetricks --unattended corefonts
```

## Lutris-Specific Paths

- **Wine:** `~/.local/share/lutris/runners/wine/<version>/bin/wine`
- **Winetricks:** `~/.local/share/lutris/runtime/winetricks/winetricks`

## Ignorable Warnings

- `xrandr14_get_adapters Failed` - Display adapter detection, harmless
- `udev_bus_init UDEV monitor creation failed` - HID device detection, harmless
- `wine-staging is a testing version` - Just an informational message
