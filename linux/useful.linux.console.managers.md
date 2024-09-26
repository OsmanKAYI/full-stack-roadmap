# 11 Best Linux Console File Managers

_TLDR: Discover 11 powerful Linux console file managers that enhance productivity by simplifying file management through a command-line interface._

## 1. GNU Midnight Commander (mc)

GNU Midnight Commander, or `mc`, is a versatile file manager offering features like file/folder operations, permissions management, archive browsing, and FTP client capabilities.

![Gnu Midnight Commander](https://www.tecmint.com/wp-content/uploads/2019/02/Gnu-Midnight-Commander.png)

**Installation:**

```bash
sudo apt install mc         # Debian, Ubuntu, Mint
sudo yum install mc         # RHEL, CentOS, Fedora, Rocky, AlmaLinux
sudo emerge -a sys-apps/mc  # Gentoo Linux
sudo apk add mc             # Alpine Linux
sudo pacman -S mc           # Arch Linux
sudo zypper install mc      # OpenSUSE
```

[Full Review of Midnight Commander](https://www.tecmint.com/midnight-commander-a-console-based-file-manager-for-linux/)

## 2. Ranger

Ranger features a Vim-like interface with previews, bookmarks, mouse support, and tabbed views, making it a favorite among users who prefer keyboard navigation.

![Ranger - Console File Manager](https://www.tecmint.com/wp-content/uploads/2019/02/Ranger-Console-File-Manager.png)

**Installation:**

```bash
sudo apt install ranger         # Debian, Ubuntu, Mint
sudo yum install ranger         # RHEL, CentOS, Fedora, Rocky, AlmaLinux
sudo emerge -a sys-apps/ranger  # Gentoo Linux
sudo apk add ranger             # Alpine Linux
sudo pacman -S ranger           # Arch Linux
sudo zypper install ranger      # OpenSUSE
```

[Full Review of Ranger](https://www.tecmint.com/ranger-console-file-manager-with-vi-key-bindings/)

## 3. Cfiles

Cfiles is a fast terminal file manager written in C, using ncurses with Vim keybindings. Lightweight, but requires manual installation.

![Cfiles - Terminal File Manager](https://www.tecmint.com/wp-content/uploads/2019/02/Cfiles-Terminal-File-Manager.png)

**Installation:**

```bash
sudo apt-get install build-essential    # Install dev tools on Debian/Ubuntu
sudo yum groupinstall 'Development Tools' # Install dev tools on CentOS/RHEL

git clone https://github.com/mananapr/cfiles.git
cd cfiles
gcc cf.c -lncurses -o cf
sudo cp cf /usr/bin/  # Copy to $PATH
```

[Full Review of Cfiles](https://www.tecmint.com/cfiles-terminal-file-manager-for-linux/)

## 4. Vifm

Vifm mimics the Vim interface and keybindings, offering a curses-based dual-pane file manager with powerful file tree comparisons and remote command execution.

![Vifm - Console File Manager](https://www.tecmint.com/wp-content/uploads/2019/02/Vifm-Console-File-Manager.png)

**Installation:**

```bash
sudo apt install vifm         # Debian, Ubuntu, Mint
sudo yum install vifm         # RHEL, CentOS, Fedora, Rocky, AlmaLinux
sudo emerge -a sys-apps/vifm  # Gentoo Linux
sudo apk add vifm             # Alpine Linux
sudo pacman -S vifm           # Arch Linux
sudo zypper install vifm      # OpenSUSE
```

[Full Review of Vifm](https://www.tecmint.com/vifm-commandline-based-file-manager-for-linux/)

## 5. Nnn

Nnn is a minimalist, lightning-fast file manager that closely resembles a desktop file manager while being extremely lightweight and easy to use.

![Nnn - Terminal File Browser](https://www.tecmint.com/wp-content/uploads/2019/02/Nnn-Terminal-File-Browser.png)

**Installation:**

```bash
sudo apt install nnn         # Debian, Ubuntu, Mint
sudo yum install nnn         # RHEL, CentOS, Fedora, Rocky, AlmaLinux
sudo emerge -a sys-apps/nnn  # Gentoo Linux
sudo apk add nnn             # Alpine Linux
sudo pacman -S nnn           # Arch Linux
sudo zypper install nnn      # OpenSUSE
```

[Full Review of Nnn](https://www.fossmint.com/nnn-linux-terminal-file-browser/)

## 6. Lfm (Last File Manager)

Lfm is a Python-based file manager with features like bookmarks, VFS for compressed files, tree view, and integration with utilities like `find` and `grep`.

![Lfm - Last File Manager](https://www.tecmint.com/wp-content/uploads/2019/02/Lfm-Last-File-Manager.png)

**Installation:**

```bash
sudo apt install lfm         # Debian, Ubuntu, Mint
sudo yum install lfm         # RHEL, CentOS, Fedora, Rocky, AlmaLinux
sudo emerge -a sys-apps/lfm  # Gentoo Linux
sudo apk add lfm             # Alpine Linux
sudo pacman -S lfm           # Arch Linux
sudo zypper install lfm      # OpenSUSE

sudo pip install lfm         # Install via pip
```

## 7. lf (List Files)

Lf is a cross-platform file manager written in Go, inspired by Ranger. It’s highly customizable and operates with a low memory footprint.

![lf - List Files](https://www.tecmint.com/wp-content/uploads/2019/02/lf-List-files.png)

**Installation:**

Download the binary for your OS from the [lf releases](https://github.com/gokcehan/lf/releases) page.

## 8. WCM Commander

WCM Commander mimics Far Manager and includes features like a built-in terminal, text editor, and viewer, with a fast user interface and mouse support.

![WCM Commander](https://www.tecmint.com/wp-content/uploads/2019/02/WCM-Commander.png)

**Installation:**

Packages for various OSes can be found on the [WCM download](http://wcm.linderdaum.com/downloads/) page.

## 9. Walk

Walk is a terminal navigator that replaces traditional `ls` and `cd` commands, offering fuzzy search and direct Vim integration.

![Walk Terminal File Manager](https://www.tecmint.com/wp-content/uploads/2019/02/Walk-Terminal-File-Manager.png)

[Walk on GitHub](https://github.com/antonmedv/walk)

## 10. Superfile

Superfile is a modern terminal-based file manager with features like customizable key bindings, tabbed browsing, and multiple panels, designed for efficient navigation and file management.

![Superfile - Terminal-Based File Manager](https://www.tecmint.com/wp-content/uploads/2023/09/Superfile-Terminal-Based-File-Manager.webp)

[Superfile Website](https://superfile.netlify.app/)

## 11. Clifm

Clifm is a fast command-line file manager that operates like a shell, allowing direct command input for file operations, making it ideal for command-line enthusiasts.

![Clifm Terminal File Manager](https://www.tecmint.com/wp-content/uploads/2024/08/Clifm-Terminal-File-Manager.png)

[Clifm on GitHub](https://github.com/leo-arch/clifm/)

These Linux console file managers offer a range of features, from minimalist interfaces to fully-featured systems, catering to different needs and preferences.

**Ref:** [Marin Todorov - Tecmint](https://www.tecmint.com/linux-terminal-file-managers/)
