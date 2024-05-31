# Basic Commands and Command Line Shortcuts That Every Linux Users Should Know

Here are the commands that can be used through command line windows such as [Terminal](https://wiki.ubuntu-tr.net/index.php?title=U%C3%A7birim), [Console](https://tr.wikipedia.org/wiki/Konsole), or any terminal program under X-windows (x-term, rxvt, aterm, etc.).

Note that some of these key commands are specific to command line windows and may behave differently depending on your window manager under X.

**Terminal**, also known as **GNOME Terminal**, is the command line tool of the [GNOME](http://tr.wikipedia.org/wiki/GNOME) desktop environment.

Software such as GNOME Terminal, which connects to the command line through a window manager, is generally referred to as "terminal." These are also termed "console, shell, terminal emulator."

**Console** is a classical terminal emulator developed as part of the [KDE](https://tr.wikipedia.org/wiki/KDE) project. Konsole is distinguished from other terminals by being almost completely rewritten (not based on xterm or rxvt).

## Komut Satırı Kısayol Tuşları

| Komut            | Description                                                                                                                                  |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Ctrl + Alt + F1  | Switch to the next terminal.                                                                                                                 |
| Ctrl + Alt + T   | Open a terminal window.                                                                                                                      |
| Ctrl + Shift + W | Close the terminal window.                                                                                                                   |
| Ctrl + A         | Move the cursor to the beginning of the command line without erasing text.                                                                   |
| Ctrl + E         | Move the cursor to the end of the command line without erasing text.                                                                         |
| Alt + F          | Move the cursor to the end of the word.                                                                                                      |
| Alt + B          | Move the cursor to the beginning of the word.                                                                                                |
| Ctrl + F         | Move the cursor forward by one character.                                                                                                    |
| Ctrl + B         | Move the cursor backward by one character.                                                                                                   |
| Ctrl + U         | Cut text from the cursor position to the beginning of the line (add to clipboard).                                                           |
| Ctrl + Y         | Paste the last cut text at the cursor position.                                                                                              |
| Ctrl + W         | Delete text before the cursor up to the beginning of the word, without affecting other words.                                                |
| Ctrl + K         | Cut text from the cursor position to the end of the line (add to clipboard).                                                                 |
| Alt + T          | Swap the two words before the cursor if the cursor is on a space, or the word under the cursor with the word before it.                      |
| Alt + L          | Convert all characters after the cursor to lowercase.                                                                                        |
| Alt + U          | Convert all characters after the cursor to uppercase.                                                                                        |
| Alt + C          | Capitalize the letter under the cursor and move the cursor to the end of the word.                                                           |
| Alt + D          | Cut text from the cursor position to the end of the word.                                                                                    |
| Alt + .          | Insert the last word of the previous command.                                                                                                |
| Ctrl + T         | Swap the two characters before the cursor.                                                                                                   |
| Ctrl + R         | Search for previously used commands.                                                                                                         |
| Ctrl + G         | Exit search mode without selecting a command.                                                                                                |
| Ctrl + J         | Copy a command found with Ctrl + R without executing it, allowing modifications.                                                             |
| Alt + R          | Undo changes to a command found with Ctrl + R; pressing again will redo the changes.                                                         |
| Ctrl + P         | Recall previous commands in the command history (same as the up arrow key).                                                                  |
| Ctrl + N         | Move forward in the command history (same as the down arrow key).                                                                            |
| Ctrl + L         | Clear the screen (same as the clear command).                                                                                                |
| Ctrl + Alt + F7  | Return to the X session previously exited with Ctrl + Alt + F1.                                                                              |
| Ctrl + Alt + Del | Reboot the system (like the shutdown command). Use this instead of the reset button.                                                         |
| Ctrl + C         | Terminate the current command (usually for simple commands).                                                                                 |
| Ctrl + D         | Send EOF (end-of-file) if a command is accepting input; logout if at the prompt. Do not press twice (logs out of the current shell session). |
| Ctrl + S         | Stop the output of a long-running command (command continues to run).                                                                        |
| Ctrl + Q         | Resume output after stopping it with Ctrl + S.                                                                                               |
| Ctrl + Z         | Suspend the current command; it can be resumed in the background with bg or in the foreground with fg. Use jobs to view suspended programs.  |
| Shift + Insert   | Paste text from the clipboard.                                                                                                               |

## Basic Linux Commands

Important and essential Linux commands to remember.

### System Commands

- **uname -u:** System information (kernel version, date, and architecture)
- **uname -r:** Kernel version information
- **uptime:** Show how long the system has been running and the load
- **hostname:** Show the system name
- **last reboot:** List of recent reboots including changes in run levels
- **date:** Display the current date and time
- **cal:** Show the calendar
- **w:** Show who is logged on and what they are doing
- **whoami:** Show the current user name
- **finger user:** Show information about the user
- **echo "user" | chpasswd:** Change a password in one line

### Hardware Commands

- **dmesg:** Print kernel messages
- **cat /proc/cpuinfo:** Show CPU information
- **cat /proc/meminfo:** Show memory (RAM) information
- **cat /proc/interrupts:** Show the interrupt usage of the CPU
- **lshw:** List hardware configuration information
- **lsblk:** List block devices
- **free -m:** Show memory usage
- **lspci -tv:** List PCI devices
- **lsusb -tv:** List USB devices
- **dmidecode:** Show BIOS hardware information
- **hdparm -i /dev/sda:** Show information about a disk
- **hdparm -tT /dev/sda:** Run a read speed test on a disk
- **badblocks -s /dev/sda:** Check for bad blocks on a disk

### Users

- **cat /etc/passwd:** List all users
- **id:** Show user ID information
- **last:** Show the list of users who last logged in
- **who:** Show who is currently logged in
- **groupadd:** Create a new group
- **useradd user:** Add a new user named "user"
- **userdel user:** Delete the user named "user"
- **usermod:** Modify user permissions

### File Commands

- **ls -la:** List files (a for all files, l for long format)
- **pwd:** Show the current directory
- **mkdir:** Create a directory
- **rm:** Delete a file
- **rm -r:** Delete a directory and its contents
- **rm -f:** Force delete without confirmation
- **rm -rf:** Force delete a directory and its contents without confirmation
- **cp:** Copy a file
- **cp -r home1 home2:** Copy the directory home1 to home2
- **mv:** Move files
- **ln -s "/home/user/app" /usr/local/bin:** Create a shortcut to an application
- **touch:** Create a file
- **cat:** Read the contents of a file
- **more:** Paginate the contents of a file
- **head:** Show the first 10 lines of a file
- **tail:** Show the last 10 lines of a file
- **tail -f:** Continuously display the last 10 lines of a file

### Process Commands

- **ps:** Show running processes
- **ps aux | grep app:** Show processes related to the specified application
- **pmap -x PID:** Show the memory map of a process
- **top:** Show the system status, including memory/CPU usage of running processes
- **kill:** Terminate a process
- **killall:** Terminate all processes with the specified name
- **pkill -f telnet:** Terminate processes matching the specified pattern
- **bg:** Resume a suspended job in the background
- **fg:** Bring a background job to the foreground

### Permissions

- **chattr +i filename:** Make a file immutable (cannot be deleted)
- **chattr -i filename:** Remove immutability from a file
- **chattr +a filename:** Allow appending to a file only
- **lsattr filename:** Check attributes set by chattr
- **chmod 777:** Make a file readable, writable, and executable by everyone
- **chmod 644:** Make a file readable by everyone, writable by the owner
- **chmod 755:** Make a file readable and executable by everyone, writable by the owner
- **chown owner-user:** Change the owner of a file
- **chown owner-user:owner-group** Change the owner and group of a file
- **chown -R user:directory/file:** Give the user access to the file/directory

### Network Commands

- **ip addr show:** Lists all network interfaces and shows their ip addresses
- **ip address add 192.168.0.2 dev enp4so:** Adds ip address to the specified interfaces
- **ip link set <interface> up:** Activates the network interface.
- **ip link set <interface> down:** Disables the network interface.
- **ethool enp4s0:** Gives information about the Ethernet status.
- **ping 192.168.0.2:** Sends an echo request to the specified ip address.
- **dig example.com:** Returns DNS information about the domain name.
- **dig -x:** Backwards search operation.
- **host example.com:** Gets the hostname and looks up the machine name.
- **hostname -i:** Shows the local ip address.
- **wget:** Downloads a file from the specified address.
- **netstat -tulpn:** Lists the ports that are actively listening.
- **ip a:** Lists the interfaces on the computer.
- **echo ‘1’ > /proc/sys/net/ipv4/ip_forward:** Activates IP Forwarding, turns the system into a router
- **echo ‘1.1.1.1.1’ > /etc/resolv.onf:** The system uses Cloudflare DNS.

### Archiving Commands

- **tar -cf homebackup.tar home:** Creates an archive file named homebackup.tar
- **tar -xf homebackup.tar:** Parses the archive named homebackup.tar
- **tar -czf homebackup.tar.gz home:** Creates archive using gzip compression
- **gzip home:** Creates an archive file as home.gz
- **unzip abc.zip:** Extracts the zip file.
- **zipgrep *.txt abcd.zip:** Searches for txt files in Zipp
- **tar xjf archive.tar.bz2:** Extract tar.bz2 file
- **tar ztvf home.tar.gz | grep abc:** Searches tar.gz
- **gzip -d home.gz:** Extracts the gzip file
- **zgrep ‘abc’ /var/log/maillog*.gz:** Allows you to search the log file without extracting it

### Installation (Debian)

- **apt-get install package_name:** Installs the package on Debian-based systems
- **apt-get purge package-name:** Unpacks Debian-based systems

### Compilation Commands

- **./configure
- **make
- **make install

Basically all compilation operations are done through these commands.

### Search Commands

- **find -name ‘yakup*’:** Finds all files with yakup in the name
- **find . -type f -size +100k:** Searches for files larger than 100k
- **find . -type f -size +100k -a -size -110k:** Searches for files between 100k and 110k
- **sed:** Stream editor and text manipulation
- **grep expression file:** Searches for the expression in the file
- **grep -r expression file:** Recursively searches for the specified expression
- **locate file:** Searches for the specified file.

### SSH

- **ssh user@host:** Connects to the specified machine
- **ssh user@host -p port:** Connects to the specified machine with the specified port
- **telnet host:** Connects to the machine via telnet port

### File Transfer

- **scp kullanıcı@host:aktarılıcakdosya.txt /home/yakup:** Transfers files to the specified machine
- **rsync -a /home/mertcan /backups:** Provides synchronisation between source and destination

### Disc Usage

- **du -ah:** Shows the space used by directories legibly
- **du -sh:** Shows the aggregate space used by the array
- **df -h:** Shows the latest status of the discs
- **df -i:** Empty inode status is displayed
- **findmnt:** Shows all connected directories in the file system in detail
- **mount /dev/sda/ /mnt:** Mount disc to /mnt

### Index Commands

- **cd:** Navigates to the first level directory
- **cd -:** Returns to the previous directory
- **cd ~:** Switches to your home directory
- **cd ...:** Navigates to the next directory
- **cd directory:** Navigates to the specified directory

### Bonus

- **history -c:** Clears command line history
- **clamscan -r -z - remove - verbose /home:** Virus scanning and deletion
- **du -h - max-depth=1 | sort -hr:** Shows the total size of the directories
- **find /home/mertcan/ -type -f -exec grep -H ‘yazi’ {} ; Searches for yazi in the directory
- **dd if=debain.iso of=/dev/sdb:** Burn iso to USB or DVD
- **shred -verbose -random-source=/dev/zero -iterations=5 /dev/sda:** Ultra-secure disc erase
- **find -type f -exec chmod 644 {} ; Sets all file permissions to 644.
- **openvpn - config client.ovpn:** Provides connection to the VPN server
- **sensors:** Returns the temperatures of hardware components.
- **gcc -o output input.c:** Compiles C code
- **rdesktop x.x.x.x.x:** Provides RDP connection
- **ssh root@x.x.x.x | cat /dev/null > ~/.bash_history:** Clears the bash history.

These commands are just a sample of what can be done via the command line in a Linux environment. For further details, consult the man pages of each command.

**Ref:** [Yakup Şeker - Medium](https://yakupseker.medium.com/her-linux-kullan%C4%B1c%C4%B1s%C4%B1n%C4%B1n-bilmesi-gereken-temel-komutlar-ve-tu%C5%9F-k%C4%B1sayollar%C4%B1-125-komut-1552423cf7db)
