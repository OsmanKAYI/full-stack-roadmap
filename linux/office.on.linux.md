# 32bit Office 2010 Installation

**This will cause "settings" to be deleted in 64 bit PC!!!**

```BASH
# check whether you have wine installed on your system or not.
wine

# if it exists, delete it
sudo apt purge wine
```

- Using **Transmission** program which is already installed on Ubuntu 22.04, dowload the preferred version of office from [1337x.to](https://1337x.to/)
- In my case I've used [MS Office 2010](https://1337x.to/search/Microsoft+Office+Enterprise+2010+Corporate+Final+no+activation+required+Bellatrix/1/)

```BASH
# install GD Graphics Library
sudo apt install libgd3:i386
# The following packages will be REMOVED:
# colord gnome-control-center gvfs-backends hplip libc-devtools libgd3
# libgphoto2-6 libsane1 libwine php7.4-gd php8.1-gd sane-utils shotwell
# simple-scan ubuntu-desktop ubuntu-desktop-minimal wine64

# install winbind and wine32
sudo apt install winbind wine32 -y

# autoremove unnecessary packages
sudo apt autoremove -y

# delete folder of wine
rm -rf ~/.wine/

# dive into the path which includes Office2010 setup.exe 'Ex: cd Downloads/Microsoft\ Office\ Enterprise\ 2010\ Corporate\ Final\ \(no\ activation\ required\)\[Bellatrix\]'
cd /path/to/Office2010/

# install Office2010 with wine
wine setup.exe
```

**NOTE:** At the end, Office2010 will be installed on '**~/.wine/drive_c/Program\ Files/Microsoft\ Office/**'

## How To Backup the First Stage

```BASH
# uninstall wine32, 32bit Office 2010
sudo apt purge wine winbind wine32 libgd3:i386 -y
sudo apt autoremove -y
rm -rf ~/.wine

# install uninstalled packages which were removed when insalling libgd3:i386
sudo apt install colord gnome-control-center gvfs-backends hplip libc-devtools libgd3 libgphoto2-6 libsane1 libwine php7.4-gd php8.1-gd sane-utils shotwell simple-scan ubuntu-desktop ubuntu-desktop-minimal wine64 -y
```

## Uninstall Programs

```BASH
# for wine32
wine uninstaller
# for wine64
wine64 uninstaller

# remove app grid icons
cd /home/$user/.local/share/applications/wine/Programs
rm -rf /folder/to/remove

cd /usr/share/applications
rm -rf /folder/to/remove
```
