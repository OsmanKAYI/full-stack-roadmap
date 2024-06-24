# fswatch – Track File and Directory Changes in Linux

**fswatch** is a cross-platform, file change monitor that gets notification alerts when the contents of the specified files or directories are altered or modified.

It executes four types of monitors on [different operating systems](https://www.tecmint.com/top-most-popular-linux-distributions/ "Popular Linux Distributions") such as:

- A monitor built on the File System Events API of Apple OS X.
- A monitor based on **kqueue**, a notification interface present in FreeBSD 4.1 also supported on many \*BSD systems, OS X inclusive.
- A monitor based on File Events Notification API of the Solaris kernel plus its spin-offs.
- A monitor based on inotify, a kernel subsystem that shows file system modifications to apps.
- A monitor based on ReadDirectoryChangesW, a Windows API that records alters to a directory.
- A monitor that regularly checks the status of the file system, keeps file modification times in memory and manually determines file system changes (which works anywhere, where stat can be used).

## Features of fswatch

- Supports several OS-specific APIs
- Allows recursive directory monitoring
- Performs path filtering using including and excluding regular expressions
- Supports customizable record format
- Additionally, it supports periodic idle events

## How To Install fswatch in Linux Systems

To install **fswatch** on Linux, use the following appropriate command for your specific Linux distribution.

```bash
sudo apt install fswatch         [On Debian, Ubuntu and Mint]
sudo yum install fswatch         [On RHEL/CentOS/Fedora and Rocky/AlmaLinux]
sudo emerge -a sys-apps/fswatch  [On Gentoo Linux]
sudo apk add fswatch             [On Alpine Linux]
sudo pacman -S fswatch           [On Arch Linux]
sudo zypper install fswatch      [On OpenSUSE]    
sudo pkg install fswatch         [On FreeBSD]
```

If **fswatch** is not available to install from the default system repositories, you can build from the source as shown in the following installation instructions.

First, clone the latest **fswatch** git repository using the following [git command](https://www.tecmint.com/git-basics/ "Learn the Basics of Git") and install it as shown:

```bash
git clone https://github.com/emcrisostomo/fswatch.git
cd fswatch
./autogen.sh
./configure
make
sudo make install
```

**Important**: Make sure you’ve GNU GCC (C and C++ Compiler) and Development Tools (**build-essential** on **Debian/Ubuntu**) installed on the system, before you compile fswatch from source.

If not, install it using the following command on your respective Linux distributions.

```bash
sudo dnf group install 'Development Tools'    [On <strong>RHEL/CentOS/Fedora</strong> and <strong>Rocky/AlmaLinux</strong>]
sudo apt-get install build-essential          [On <strong>Debian, Ubuntu and Mint</strong>]
```

On **Debian/Ubuntu** distributions, you might get the following error while executing **fswatch** command.

```text
fswatch: error while loading shared libraries: libfswatch.so.13: cannot open shared object file: No such file or directory
```

To fix it, you need to execute the command below, this will help refresh the links and cache to the dynamic libraries before you can start using fswatch.

```bash
sudo ldconfig
```

## How to Use fswatch to Monitor File Changes on Linux

The general syntax for running **fswatch** is:

```bash
fswatch [option] [path]
```

On **Linux**, it is recommended that you use the default **inotify** monitor, you can list available monitors by employing the `-M` or `- list-monitors` option:

```bash
fswatch -M
fswatch --list-monitors
```

![fswatch - List Monitors](https://www.tecmint.com/wp-content/uploads/2016/10/fswatch-list-monitors.png)

fswatch – List Monitors

The command below enables you to watch the changes in the current directory (`/home/tecmint`), with events being delivered to standard output every **4** seconds.

The `-l` or –`-latency` option allows you to set the latency in seconds, the default being **1** second.

```bash
fswatch -l 4 . 
```

![fswatch - Monitor Home Directory Changes](https://www.tecmint.com/wp-content/uploads/2016/10/fswatch-Monitor-Home-Directory-Changes.gif)

The next command monitors changes to the **/var/log/auth.log** file every **5** seconds:

```bash
fswatch -l 5 /var/log/auth.log
```

Using `-t` or `--timestamp` option prints the time stamp for every event, to print the time in **UTC** format, employ `-u` or `--utf-time` option. You can also format time using `-f` or `--format-time` format option:

```bash
fswatch --timestamp /var/log/auth.log
```

Next, `-x` or `--event-flags` tells **fswatch** to print the event flags alongside the event path. You can use the **–event-field-seperator** option to print events using the particular separator.

```bash
fswatch --events-flags ~ /var/log/auth.log
```

To print the numeric value of an event indicating changes in your **home** directory and **/var/log/auth.log** file, use `-n` or `--numeric` option as below:

```bash
fswatch --numeric ~ /var/log/auth.log 
```

Perhaps you can look through the **fswatch** man page for detailed usage options and information:

```bash
man fswatch
```

**Ref:** [fswatch - Tecmint](https://www.tecmint.com/fswatch-monitor-file-changes-linux/)
