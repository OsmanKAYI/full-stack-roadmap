kv# Terminal Usage

| Command                                            | Description                                                                                                                                                                                                                                                                                                                               |
| -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-`                                                | File                                                                                                                                                                                                                                                                                                                                      |
| `/etc`                                             | Setting files of all programs in the system is in this file                                                                                                                                                                                                                                                                               |
| `cat *.php/wc`                                     | Word counts                                                                                                                                                                                                                                                                                                                               |
| `cat /etc/passwd`                                  | Lists all the users                                                                                                                                                                                                                                                                                                                       |
| `cat /etc/hosts`                                   | Lists the hosting names and their IP numbers                                                                                                                                                                                                                                                                                              |
| `cd ..`                                            | Goes to the parent file                                                                                                                                                                                                                                                                                                                   |
| `cd -`                                             | Enables us to go to the previous file directory                                                                                                                                                                                                                                                                                           |
| `cd ~`                                             | "cd /home/osman" has the same logic                                                                                                                                                                                                                                                                                                       |
| `cd /home/osman`                                   | It is actually "root"/"where the users are"/"user"                                                                                                                                                                                                                                                                                        |
| `cd /var/www/html`                                 | Enables us to create user,group and to add/delete member                                                                                                                                                                                                                                                                                  |
| `chown -R g-w /resimler`                           | Makes the group unable to write                                                                                                                                                                                                                                                                                                           |
| `chown -R $USER:AILE /resimler`                    | Makes "resimler" folder a part of a group called "AILE"                                                                                                                                                                                                                                                                                   |
| `code .`                                           | Opens up the files in the VSCode                                                                                                                                                                                                                                                                                                          |
| `cp -r "filename" "target folder name"`            | Copies the file as recursive (-r) to the "target folder name"                                                                                                                                                                                                                                                                             |
| `[Ctrl] + [C]`                                     | Stops the working command if you have                                                                                                                                                                                                                                                                                                     |
| `[Ctrl] + [D]`                                     | Log out terminal (Saves history)                                                                                                                                                                                                                                                                                                          |
| `[Ctrl] + [L]`                                     | Clears the terminal screen without closing                                                                                                                                                                                                                                                                                                |
| `[Ctrl] + [R]`                                     | Reverse-i-search                                                                                                                                                                                                                                                                                                                          |
| `d`                                                | Directory                                                                                                                                                                                                                                                                                                                                 |
| `du -s -h "folder name"`                           | Enables us to see the disk usage of any file as summary (-s) and like human (-h)                                                                                                                                                                                                                                                          |
| `fallocate -l 1G test.img`                         | Creating a 1GB random file being called as "test.img"                                                                                                                                                                                                                                                                                     |
| `find "folder name"`                               | Enables us to figure out the content of any file                                                                                                                                                                                                                                                                                          |
| `git clone SSH Key`                                | Clones the repository for given SSH Key                                                                                                                                                                                                                                                                                                   |
| `history`+`pipe`+`grep`+`"reference word"`         | Making a search on the history with some reference words                                                                                                                                                                                                                                                                                  |
| `l`                                                | Link                                                                                                                                                                                                                                                                                                                                      |
| `less test.img`                                    | Enables us to navigate in the file (shows file content). To quit, use q                                                                                                                                                                                                                                                                   |
| `ll`                                               | List long                                                                                                                                                                                                                                                                                                                                 |
| `ln -s /var/www/html`                              | Adds a shortcut                                                                                                                                                                                                                                                                                                                           |
| `lsblk`                                            | System specifications                                                                                                                                                                                                                                                                                                                     |
| `lsusb`                                            | Shows the usb devices                                                                                                                                                                                                                                                                                                                     |
| `man "commandname"`                                | Shows the manual for any command                                                                                                                                                                                                                                                                                                          |
| `mkdir /resimler`                                  | Creates a new folder calles as "resimler" in a predetermined place                                                                                                                                                                                                                                                                        |
| `nautilus`                                         | File manager, designed for the GNOME 3 desktop.                                                                                                                                                                                                                                                                                           |
| `update`                                           | Lists recent versions of the programs in the repository                                                                                                                                                                                                                                                                                   |
| `upgrade`                                          | Updates our programs being in the "update list"                                                                                                                                                                                                                                                                                           |
| `ping "yarinlar.com"`                              | It is used in TERMINAL. If terminal gives us some logical answers, it means that the website, which is in this case "yarinlar.com", is working                                                                                                                                                                                            |
| `pv`                                               | It is like `cat` command but it has a feature of showing the process level of the current task.                                                                                                                                                                                                                                           |
| `pwd`                                              | Where I am                                                                                                                                                                                                                                                                                                                                |
| `rm ?.php`                                         | Deletes the .php files which have only one character in the name                                                                                                                                                                                                                                                                          |
| `rsync -ravz --delete /source/path/ /target/path/` | Deletes the files which are not currently available in the source but available in the target                                                                                                                                                                                                                                             |
| `rsync -ravz /source/path/ /target/path/`          | Synchronizes the files like scp but it just takes the files which are not currently being in the target. And to make the process fast, -ravz command is used which has the components of                                                                                                                                                  |
|                                                    | <table> <thead> <tr> <th>Command</th> <th>Description</th> </tr> </thead> <tbody> <tr> <td><code>rsync r</code></td> <td>recursive</td> </tr> <tr> <td><code>rsync a</code></td> <td>archive</td> </tr> <tr> <td><code>rsync v</code></td> <td>verbose</td> </tr> <tr> <td><code>rsync z</code></td> <td>zip</td> </tr> </tbody> </table> |
| `scp -r /source/path/* /target/path/`              | Coppies the files being in the source to the target file. `/*` means all of the files                                                                                                                                                                                                                                                     |
| `shutdown -h now`                                  | Close the machine and halt now                                                                                                                                                                                                                                                                                                            |
| `shutdown -r now`                                  | Close the machine and restart now                                                                                                                                                                                                                                                                                                         |
| `ssh root@$serverip`                               | To connect an ip address                                                                                                                                                                                                                                                                                                                  |
| `sudo mount /dev/sdb2 /media/"user"`               | Mounts the HDD to the user                                                                                                                                                                                                                                                                                                                |
| `sudo umount /media/"user"/"flash memory name"/`   | Savely removes the flash memory from computer                                                                                                                                                                                                                                                                                             |
| `time "command"`                                   | Shows the time necessary to process any command                                                                                                                                                                                                                                                                                           |
| `touch test.php`                                   | Creates an empty file called "test.php"                                                                                                                                                                                                                                                                                                   |
| `top -i`                                           | Display dynamic real-time information about running processes. Option `-i` lets you to hide the idle process and only show the active ones.                                                                                                                                                                                               |
| `unzip teklif.zip`                                 | To unzip the "teklif.zip"                                                                                                                                                                                                                                                                                                                 |
| `uptime`                                           | Shows the time of continuous work for PC                                                                                                                                                                                                                                                                                                  |
| `vim .bashrc`                                      | Enables us to edit the file which contains the commands working when the computer is started                                                                                                                                                                                                                                              |
| `zip -r teklif.zip teklifhazirla`                  | To zip the "teklifhazirla" file as "teklif.zip"                                                                                                                                                                                                                                                                                           |

**NOTE:** The files which start with "." are secret files.

## In Detail

`alias connect1=ssh root@$serverip` <br>

- Creates an alias for ssh root@$serverip as connect1 if you right that command on .bashrc file.

`find "folder name" | wc -l` <br>

- Finds the given "folder name" and then counts the number of files in it.

`mysql -u dbadmin -p < sakila-schema.sql` <br>

- Import sql file to MySQL.

`rsync -ravz --delete root@165.232.80.129:/var/www/html ./` <br>

- "./" shows the directory of the copy command as a file which I am currently in.

`scp -r /var/www/html/sitelerim/* root@192.168.1.20:/var/www` <br>

- Coppies the files being in the source to the target file. "Source" is /var/www/html/sitelerim and "Target" is root@192.168.1.20:/var/www. "/\*" means all of the files.

`sed 's/./&\n/g' 1.txt | sort | uniq -ic | sort -nr | head -n 6 | tail -n 5` <br>

- Finds out the how many times a word is repeated and sorts the result in a descending way and takes the last 5 rows of the first 6 rows.

`seq 10|xargs -I{} touch {}.txt` <br>

- Creates a series of files from 1 to 10 and saves them as a .txt file from 1 to 10.

`seq 10|xargs -I{} cp -r "file name" {}/` <br>

- Creates 10 copy of the original files in the target directory and names them as {}.txt while copying the given "file name".

`seq 140|xargs -P 20 -I{} wget -q -O {} "https://quakelogic.net/Pubs/{}.pdf" \;` <br>

- Downloads 140 pdf files from specified website with 20 parallel downloads.

`upower -i /org/freedesktop/UPower/devices/battery_BAT0` <br>

- Shows the battery level of the computer.

`upower --dump | grep "percentage"` <br>

- Shows the battery level of the wireless mouse.

`wget -r --no-parent https://stayyoungwith.com/wp-content/uploads/` <br>

- Downloads all of the files in the given website. <br>

`wget -r --no-parent  -A *.mp4 https://stayyoungwith.com/wp-content/uploads/` <br>

- Downloads all of the mp4 files in the given website. <br>

`wget -r --no-parent  -R *.mp4 https://stayyoungwith.com/wp-content/uploads/` <br>

- Downloads all of the files (except mp4) in the given website.

`rename -n 's/ /./g' *` <br>

- Changes all of spaces to `.` from all of the existing files and folders (just in terminal).

`for file in *; do mv "$file" `echo $file | tr -cd '.A-Za-z0-9\_-'` ; done` <br>

- Deletes all of the special characters from all of the existing files and folders.
- Eg: `ॐNámásté Egész-ség.mkv --> NmstEgsz-sg.mkv`

`ffmpeg -i "filename" -ss "start" -t "end" -c copy "newfilename"` <br>

- Crops videoclip and save it as mp4 file on linux terminal.
  **NOTE:** If `ffmpeg`is not installed on your system, use `sudo apt install ffmpeg -y`.

`ffmpeg -i "filename.mp4" -vn -acodec copy "newfilename.acc"` <br>

- Converts mp4 file to aac (like mp3) file on linux terminal.

`ffmpeg -i 1.webm -vf "scale=1920:1080" 1.mp4` <br>

- Converts webm file to mp4 file on linux terminal with a resolution of 1920:1080 pixels (can subject to change).

`ffmpeg -i 1.mp4 -c:v libx264 -preset fast 2.mp4` <br>

- Fixes the problematic video (no video or async video/sound) and decreases its size.

`cat "filename.txt" | xclip -sel clip` <br>

- Copies the file content directly to the clipboard so you can paste it directly.

`sudo dpkg-reconfigure tzdata` <br>

- Configures the date and time correctly if some problem occurs.

`setxkbmap tr` <br>

- Sets keyboard settings for Türkçe.

`wget -A html --no-clobber --random-wait --no-parent --convert-links --level 1 --no-check-certificate -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:6.0a2) Gecko/20110613 Firefox/6.0a2" -r https://www.$domain.com/` <br>
`wget -A html --no-clobber --random-wait --no-parent --level 1 --no-check-certificate -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:6.0a2) Gecko/20110613 Firefox/6.0a2" -r https://www.$domain.com/` <br>

- Installs a web site's files. Its parameters are as follows
  - `-A` defines which files will be dowloaded
  - `--no-clobber` prevents file in the new copy to overwrite the old
  - `--random-wait` waits randomly between the retrievals
  - `--no-parent` does not ever ascend to the parent directory when retrieving recursively
  - `--convert-links` after the download is complete, convert the links in the document to make them suitable for local viewing
  - `--level 1` specifies recursion maximum depth level depth. Use inf as the value for inifinite
  - `--no-check-certificate` prevents you to be blocked by the certification problems
  - `-r` turns on recursive retrieving. The default maximum depth is 5. If the website has more levels than 5, then you can specify it with `--level=depth`

`find ./ -type f -exec sed -i 's|https://www\.example\.com/|\./|gI' {} \;` <br>

- Changes the **https://www.exmaple.com/** phrase with **./**.

`pv /dev/sda | dd /dev/sdb` <br>

- Copies the files inside of **/dev/sda** to **/dev/sdb** and shows the process level.

`find ./ -size 0c -delete` <br>

- Finds and deletes all the 0 byte files.

`find . -name "*.html" |wc` <br>

- Finds the number of HTML files in current directory.

`hashcat 78b6c1cd9f90d2560525966c76d8d398 -a 3 -m 0` <br>

- Hacks the md5 format password to get the actual password.

`hashcat -a 3 -m 0 ~/pass.csv` <br>

- Hacks the md5 format password inside of **pass.cv** file to get the actual password.

`$ rsync -av --partial --inplace --append --progress root@server-ip:/file/location .` <br>

- Downloads a super large file over SSH using rsync. If the connection interrupts, the download resumes from the same point instead of starting from scratch. And it saves bandwidth.
  ```
  --inplace : update destination files in-place
  --partial : keep partially transferred files
  --append : append data onto shorter files
  --progress : show progress during transfer
  ```

`dd if=/dev/urandom of=16G.img bs=1G count=16` <br>

- Creates a 16 GB of one file called 16G.img.

```BASH
for i in *.sql; do echo "Importing: $i"; mysql -u root -proot ozlem2 < $i; done;
# if the content of '~/.my.cnf' is set as
# [client]
# user=root
# password="root"
for i in *.sql; do echo "Importing: $i"; mysql ozlem2 < $i; done;
```

- Runs more than one sql at the same time.

```BASH
echo willBeShown
 echo willNotBeShown
echo willBeShown
history
```

- Not to show a command in history, just add a <kbd>SPACE</kbd> front of it.

`find ~/Downloads/SQL -type f -name "\*.sql.gz" -cmin -15 | xargs pv | gunzip | mysql test;` <br>

- Finds the **\*.sql.gz** files that have changed in the last 15 minutes and import them into the test database.

`pr -F *.md > newfile.md` <br>

- Combines all markdown files into single file called 'newFile.md'.

`lowriter --convert-to pdf *.docx` <br>

- Converts all of the given files (ex; docx) to PDF documents

`exiftool -AllDates="2000:01:01 00:00:00" *.jpg` <br>

- Changes all dates to 2000:01:01 00:00:00 for `.jpg` files in a directory.

`gunzip -c /path/to/file/*.gz | pv | mysql -f -D $dbname` <br>

- Unzip all the files and import them into mysql in local with showing the progress (pv).
