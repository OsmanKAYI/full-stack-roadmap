# Complete Guide to VirtualBox Installation and USB Configuration on Ubuntu

## 1. Installing Oracle VirtualBox

### 1.1 Add Oracle VirtualBox Repository

```bash
# Add Oracle VirtualBox GPG key
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
# Add the repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
```

### 1.2 Install VirtualBox

```bash
# Update package list
sudo apt update
# Install VirtualBox
sudo apt install virtualbox-7.0
```

## 2. Prerequisites Check

```bash
# Verify user groups
groups $USER
# Add user to vboxusers group
sudo adduser $USER vboxusers
```

## 3. Install VirtualBox Extension Pack

```bash
# Update package list
sudo apt update
# Install Extension Pack
sudo apt install virtualbox-ext-pack
```

## 4. Troubleshooting Installation Issues

### 4.1 Complete Reinstallation Process

```bash
# Kill VirtualBox processes
sudo killall VirtualBox
sudo killall VBoxSVC

# Remove existing installation
sudo apt remove --purge virtualbox* virtualbox-*
sudo apt autoremove

# Clean configuration files
sudo rm -rf ~/.config/VirtualBox/
sudo rm -rf /etc/vbox/

# Fresh installation
sudo apt update
sudo apt install virtualbox virtualbox-ext-pack

# Rebuild kernel modules
sudo /sbin/vboxconfig
```

## 5. USB Configuration in VirtualBox

### 5.1 GUI Configuration

1. Open VirtualBox
2. Select your virtual machine
3. Go to Settings > USB
4. Enable USB Controller
5. Select USB 2.0 (EHCI) or USB 3.0 (xHCI) Controller

### 5.2 Connecting USB Devices

1. Start your virtual machine
2. Click the USB icon at the bottom of VirtualBox window
3. Select your USB device from the list

## 6. Verification and Testing

```bash
# Check USB devices in host system
lsusb
# Verify VirtualBox installation
virtualbox --help
```

## Common Issues and Solutions

### Error: VirtualBox is Currently Running

```bash
# Stop VirtualBox processes
sudo killall VirtualBox
sudo killall VBoxSVC
```

### Error: Kernel Modules Not Loaded

```bash
# Rebuild kernel modules
sudo /sbin/vboxconfig
```

## Important Notes

- Always backup your data before major system changes
- Ensure system is up-to-date before installation
- If using EFI Secure Boot, kernel modules may need signing
- Restart system after installation for changes to take effect

## System Requirements

- Ubuntu OS (LTS version recommended)
- At least 4GB RAM
- Virtualization support enabled in BIOS/UEFI
- Sufficient disk space (minimum 20GB recommended)
