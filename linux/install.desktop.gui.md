# How to Install a Desktop (GUI) on an Ubuntu Server

## Introduction

Ubuntu Server is a variant of the Ubuntu OS that does not include a graphical user interface (GUI) by default. GUI applications consume system resources needed for server-oriented tasks, so Linux server distributions usually avoid a GUI in favor of the command-line terminal.

Some tools, however, perform better and are easier to manage with a GUI. If you use a tool with a GUI, installing a desktop environment may improve the experience of working with the server.

This guide will show you how to install a desktop (GUI) graphical interface on your Ubuntu server.

#### Prerequisites

- A server running Ubuntu Linux Server
- A user account with sudo or root privileges
- The apt package manager, included by default

## Update Repositories and Packages

Start by ensuring the software on the server is up to date.

Refresh the repository and package lists, and perform the necessary upgrades with the following command:

```bash
sudo apt update && sudo apt upgrade -y
```

## Install and Set Up Display Manager

A display manager is an application that starts the display server, launches the desktop, and manages user authentication. The default GDM3 is a resource-intensive display manager. To conserve system resources, consider a lighter tool, such as SLiM or LightDM.

This guide uses SLiM to illustrate the rest of the GUI installation process.

To install SLiM, type:

```bash
sudo apt install slim -y
```

**NOTE:** If you prefer to install the LightDM display manager instead, type:

```bash
sudo apt install lightdm -y
```

## Install GUI on Ubuntu Server

With a display manager installed, proceed to install a GUI. The sections below contain instructions for the most common Linux desktop environments.

#### Ubuntu Desktop

The default **Ubuntu Desktop** is a modified version of the GNOME desktop environment.

```bash
# install ubuntu desktop
# if asked, confirm slim as the default desktop manager
sudo apt install ubuntu-desktop
# reboot the system when the installation finishes
sudo reboot
```

**NOTE:** For the vanilla GNOME experience, install the following packages:

```bash
sudo apt install vanilla-gnome-desktop vanilla-gnome-default-settings
```

#### KDE Plasma

**KDE Plasma** is a flexible and customizable desktop environment that provides visual consistency and style while remaining fast and responsive.

```bash
# install KDE Plasma
sudo apt install kde-plasma-desktop -y
# reboot the system when the installation finishes
sudo reboot
```

#### XFCE

The **XFCE** desktop environment is designed to be lightweight and user-friendly. The main package, `xfce4-session`, provides a bare-bone environment. If you want the full experience, install the `xfce4-goodies` package as well.

```bash
# install XFCE
sudo apt-get install xfce4-session xfce4-goodies -y
# reboot the system when the installation finishes
sudo reboot
```

#### MATE

**MATE** is a fork of GNOME 2 and a popular graphical interface designed to be light on resource consumption.

```bash
# install XFCE
sudo apt install ubuntu-mate-desktop -y
# reboot the system when the installation finishes
sudo reboot
```

#### LXDE

**LXDE** is a desktop environment with a very lightweight GUI. Use LXDE if you need a graphical interface but want to minimize the impact on system memory and CPU.

```bash
# install XFCE
sudo apt install lxde -y
# reboot the system when the installation finishes
sudo reboot
```

#### Switching between GUI

If you install more than one desktop environment, you can switch between different GUIs from your display manager screen. SLiM, for example, lets you cycle through the installed environments by pressing <kbd>F1</kbd> repeatedly. The name of the currently toggled environment is visible at the bottom of the screen.

#### Removing the GUI and Display Manager

To revert to the command line interface and remove the packages related to the display manager and the desktop environments:

- Open the terminal, and enter:

```bash
sudo apt remove [display-manager] [desktop-environment]
```

- For example, to remove `SLiM` and `LXDE`, type:

```bash
# remove SLiM and LXDE
sudo apt remove slim lxde
# reboot the system
sudo reboot
# finish by removing orphaned or unnecessary dependencies with autoremove
sudo apt autoremove
```

## Conclusion

If you’ve worked extensively with conventional operating systems, it can be challenging to have to work in a command-line interface. Fortunately, Ubuntu - like many Linux systems - is open-source, so there are many available GUIs to install.

**Ref:** [phoenixnap.com](https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu)