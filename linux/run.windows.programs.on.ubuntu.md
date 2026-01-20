# How to Execute Windows Programs on Ubuntu 22.04 using Lutris

Wine is as a kind of tool to execute .exe programs on ubuntu.

```bash
#install dependencies for wine32
sudo apt install libgd3:i386 -y
#install wine32
sudo apt install wine32 -y
# create a 32-bit Wine Prefix:
WINEARCH=win32 WINEPREFIX=~/.wine32 winecfg
# run the Installer in the 32-bit Prefix:
WINEARCH=win32 WINEPREFIX=~/.wine32 wine program2execute.exe
```

**NOTE:** If you have wine64 installed on your system, the below packages will be remowed when you install wine32.

```txt
Removing ubuntu-desktop (1.481.1)
Removing ubuntu-desktop-minimal (1.481.1)
Removing gnome-control-center (1:41.7-0ubuntu0.22.04.7)
Removing colord (1.4.6-1)
Removing gimp (2.10.30-1build1)
Removing graphviz (2.42.2-6)
Removing gvfs-backends (1.48.2-0ubuntu1)
Removing hplip (3.21.12+dfsg0-1)
Removing libc-devtools (2.35-0ubuntu3.4)
Removing php7.4-gd (1:7.4.33-8+ubuntu22.04.1+deb.sury.org+1)
Removing wine (6.0.3~repack-1)
Removing wine64 (6.0.3~repack-1)
Removing libwine:amd64 (6.0.3~repack-1)
Removing libgvc6 (2.42.2-6)
Removing simple-scan (42.0-1)
Removing sane-utils (1.1.1-5)
Removing libsane1:amd64 (1.1.1-5)
Removing shotwell (0.30.14-1ubuntu6)
Removing libgphoto2-6:amd64 (2.5.27-1build2)
Removing libgd3:amd64 (2.3.3-9+ubuntu22.04.1+deb.sury.org+1)
```

**NOTE 2:** To remove wine32 and install wine64 again with all packages, use the following

```bash
sudo apt purge wine*
sudo apt install ubuntu-desktop ubuntu-desktop-minimal gnome-control-center colord gimp graphviz gvfs-backends hplip libc-devtools php7.4-gd wine wine64 libwine:amd64 libgvc6 simple-scan sane-utils libsane1:amd64 shotwell libgphoto2-6:amd64 libgd3:amd64 -y
```
