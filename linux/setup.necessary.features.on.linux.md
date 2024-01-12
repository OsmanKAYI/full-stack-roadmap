# Setup Necessary Features on Linux

## System Update Installation

- Below commands are used to make the system up to date. Both commands should be run before installing any app.

```BASH
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh
```

## Set System Time

```BASH
# to set timezone as Istanbul
sudo timedatectl set-timezone Europe/Istanbul
# to choose timezone manually: sudo dpkg-reconfigure tzdata

# to show the seconds on desktop clock
gsettings set org.gnome.desktop.interface clock-show-seconds true

# to setup auxiliary packages
sudo apt-get install ntp ntpdate -y

# to setup NTP server
sudo ntpdate ntp.ubuntu.com

# to get timezone and current time
timedatectl status
```

## Set Keyboard Setting for Türkçe

```BASH
setxkbmap tr
```

## Check Drivers

```BASH
sudo ubuntu-drivers autoinstall
```

## Desktop Configurations

```BASH
# to set the position of the dock to the left
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'

# to minimize/extend all windows of a folder/program with one click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# to switch between windows of a folder/program with mouse rolling
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'
```

**NOTE:** To see more configurations about dock [visit](https://github.com/micheleg/dash-to-dock/blob/master/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml)

## Guake

- Guake is a dropdown terminal made for the GNOME desktop environment.

```BASH
sudo apt-get install guake -y
```

#### Guake Configurations

- In start menu type `Guake` and press <kbd>ENTER</kbd> to launch Guake Preferences.
- In `General` fulfill the checkbox for `Start Guake at login`.
- In `Main Window` fulfill the checkbox for `Place tabs on top`.

## Necessary Packages

- **vim** is a free and open-source, screen-based text editor program.
- **bat**, is a cat command written in Rust programming language, comes with syntax highlighting, git integration, and works as is a drop-in cat command replacement.
- **pdftk**, is a PDF toolkit. It allows you to manipulate PDF files. It also allows you to extract text from PDF files.
- **meld**, is the visual diff and merge tool, targeted at developers. It allows users to compare two or three files or directories visually, color-coding the different lines.
- **xclip** is X11 clipboard manipulation tool, similar to xsel.Handles the X primary and secondary selections, plus the system clipboard ( <kbd>CTRL</kbd> + <kbd>C</kbd> / <kbd>CTRL</kbd> + <kbd>V</kbd> ).
- **axel** is a program that downloads a file from a FTP or HTTP server through multiple connection, each connection downloads its own part of the file.
- **gnome Tweak Tool** is software that allows us to change the general appearance and behavior of components in the Gnome Desktop Environment.
- **net-tools** package is a collection of programs for controlling the network subsystem of the Linux kernel. This package is known to build and work properly using an LFS-10.1 platform. This package includes `ifconfig`.
- **hardInfo** (in short for “hardware information“) is a system profiler and benchmark graphical tool for Linux systems, that is able to gather information from both hardware and some software and organize it in an easy to use GUI tool.
- **gpustat** is a GPU monitoring tool, capable of displaying a multitude of information from multiple GPU nodes on one page.
- **nvtop** is a ncurses-based GPU status viewer for NVIDIA GPUs.
- **testdisk** checks and recovers lost partitions.
- **unrar** extracts RAR file archives.
- **caffeine** prevents the desktop from becoming idle when an application is running full-screen. A desktop indicator ‘caffeine-indicator’ supplies a manual toggle, and the command ‘caffeinate’ can be used to prevent idleness for the duration of any command.
- **wormhole** lets you share files with end-to-end encryption and a link that automatically expires. So you can keep what you share private and make sure your stuff doesn't stay online forever.
- **hashcat** is a password recovery tool. It had a proprietary code base until 2015, but was then released as open source software.
- **pv** shows the progress of data through a pipeline by giving information such as time elapsed, percentage completed (with progress bar), current throughput rate, total data transferred, and ETA.

```BASH
sudo apt install vim bat pdftk meld xclip axel gnome-tweaks net-tools hardinfo gpustat nvtop testdisk unrar caffeine magic-wormhole hashcat pv -y
```

- `batcat $fileName` # to see and arrange the content of any file.
- `xclip -sel clip` # to copy
- `xclip -sel clip -o` # to paste
- `gpustat -i 0.20` # to follow GPU usage as 5 measurements / second (or 1 measurement / milisecond)
- `wormhole send "fileName"` # to send file

## TLDR

- **TLDR** is an internet slang for a summary of a long text. Its name comes from the acronym (or initialism) TL;DR, which stands for too long; didn't read. In the same spirit, the tldr command-line tool summarizes a lengthy man page and consists mainly of examples.

```BASH
sudo apt install tldr -y
tldr -u
```

- `tldr $commandName` # to get short summary manual of any command.

## MC

- Midnight Commander, a terminal based file manager.Navigate the directory structure using the arrow keys, the mouse or by typing the commands into the terminal.

```BASH
sudo apt install mc -y
```

## GNOME Sushi

- It is a file previewer. To use it hit Space Bar on keyboard to quick preview selected file in a pop-up window. And, hit the Space Bar again will close it.

```BASH
sudo apt install gnome-sushi -y
```

## GNOME Screenshot

- GNOME Screenshot is a desktop environment-agnostic utility for taking screenshots. When you bind any key to gnome-screenshot, you can use this key combination to take screenshot.

```BASH
sudo apt install gnome-screenshot -y
sudo apt install xclip -y
```

- Then go to `Settings | Keyboard Shortcuts | View and Customize Shortcuts | Custom Shortcuts`
- And create a new shortcut by clicking on `+` symbol
- Give it a `Name` and paste the following command into `Command`.

`sh -c 'gnome-screenshot -af /home/$USER/Pictures/$(date "+%Y.%m.%d-%H.%M.%S").png'`

- Click on `Set Shortcut...` and give it a key combination (in my case <kbd>CTRL</kbd> + <kbd>SHIFT</kbd> + <kbd>S</kbd> ).
- Then click on `Add`.

**NOTE:** If you face some problems to save the screenshot into selected location (in my case it is Pictures folder), try to change permissions with the following command.

`sudo chmod ugo+rwx /home/$USER/Pictures/*`

- To revert the changes you've done, use the following.

`sudo chmod ugo-rwx /home/$USER/Pictures/*`

## GIMP Image Editor

- GIMP is a free and open-source raster graphics editor used for image manipulation and image editing, free-form drawing, transcoding between different image file formats, and more specialized tasks.

```BASH
sudo apt install gimp -y
```

**NOTE:** To see an example and have some tips, visit [Ubuntu Community Retouch Photos](https://help.ubuntu.com/community/Photos/RetouchPhotos)

## LYNX

- Command-line web browser.

```BASH
sudo apt install lynx -y
```

## TUXEDO Control Center

- The TUXEDO Control Center (short: TCC) gives TUXEDO laptop users full control over their hardware like CPU cores, fan speed and more. To get more information about the project visit [TUXEDO Control Center Project](https://github.com/tuxedocomputers/tuxedo-control-center) on GitHub.

```BASH
# add repositories in apt list (my case it is "jammy" but it may subject to change depending on your condition)
echo -e "deb https://deb.tuxedocomputers.com/ubuntu jammy main" | sudo tee -a /etc/apt/sources.list.d/tuxedocomputers.list

# dive into source directory
cd /etc/apt/trusted.gpg.d/

# dowload the programm
sudo wget https://deb.tuxedocomputers.com/0x54840598.pub.asc

# update and install the program
sudo apt update
sudo apt install tuxedo-control-center -y
```

## Firefox

- Mozilla Firefox, or simply Firefox, is a free and open-source web browser developed by the Mozilla Foundation and its subsidiary, the Mozilla Corporation. It uses the Gecko rendering engine to display web pages, which implements current and anticipated web standards.

```BASH
sudo add-apt-repository -y ppa:mozillateam/ppa
```

```BASH
# below commands should be copied and pasted as one piece
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001

Package: firefox
Pin: version 1:1snap1-0ubuntu2
Pin-Priority: -1
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
```

```BASH
sudo snap remove firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo apt install firefox -y
```

## Chromium

- Chromium is a free and open-source web browser project, mainly developed and maintained by Google. This codebase provides the vast majority of code for the Google Chrome browser, which is proprietary software and has some additional features.

```BASH
sudo apt install chromium-browser -y
```

## Cockpit

Cockpit is an interactive server admin interface. It is easy to use and very lightweight.

```BASH
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit
```

After that, type `localhost:9090` on your browser and login with your system's username and password.

## Visual Studio Code

- Visual Studio Code, also commonly referred to as VSCode, is a source-code editor made by Microsoft with the Electron Framework, for Windows, Linux and macOS. Features include support for debugging, syntax highlighting, intelligent code completion, snippets, code refactoring, and embedded Git.

```BASH
sudo apt install software-properties-common apt-transport-https wget -y
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt install code -y
```

**Ref:** https://linuxhint.com/install-visual-studio-code-ubuntu22-04/

#### Update VSCode

- Install the latest version of [VSCode](https://code.visualstudio.com/).
- Then use the following command.

`sudo apt install ~/Downloads/$FILE` # default download directory choosen as ~/Downloads

#### WakaTime for VSCode

- It is an open source plugin for productivity metrics, goals, leaderboards, and automatic time tracking.

1. Press <kbd>F1</kbd> and type `install`. Pick `Extensions: Install Extension`
2. Type `wakatime` and hit <kbd>ENTER</kbd>.
3. Install WakaTime.
4. Enter your [API Key](https://wakatime.com/settings/api-key).
5. Use VSCode like you normally do and your coding activity will be displayed on your [WakaTime Dashboard](https://wakatime.com/dashboard).

**NOTE:** Other useful VSCode extensions and related setting.json file can be found from [here](https://github.com/OsmanKAYI/computerNotes/blob/master/09.vscode.extensions.md)

#### Completely Remove VSCode

```BASH
sudo apt purge code
sudo apt autoremove
rm-rf /home/$USER/.vscode/
rm -rf /home/$USER/.config/Code/
```

## WPS Office

- As one of the best Microsoft Office alternatives of 2021, WPS Office is fully compatible with main Linux distributions, including Ubuntu and Linux Mint. Download [WPS Office](https://www.wps.com/) for Linux. After downloading latest version, follow the steps below.

```BASH
# dive into download directory (since it downloads to 'Downloads/' folder)
cd Downloads/

# install downloaded file
sudo apt install ./wps-office_*_amd64.deb
# press 'OK' and 'YES', one after another
```

## Notion

- Notion is a freemium productivity and note-taking web application developed by Notion Labs Inc. It offers organizational tools including task management, project tracking, to-do lists, bookmarking, and more.

```BASH
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app
```

## Git

- Git is a distributed version control system developed by Linus Torvalds, the creator of the Linux Kernel.

```BASH
sudo apt-get install git -y
git config --global user.email "osmankayi06@gmail.com"
git config --global user.name "OsmanKAYI"
```

#### GitHub Configurations

```BASH
cd ~/.ssh
ssh-keygen -o -t rsa -C "osmankayi06@gmail.com"
# Public name will be saved as osmankayi instead of id_rsa
ssh-add ~/.ssh/osmankayi
```

- -o flag forces the tool to generate SSH keys with the OpenSSH format
- -t flag specifies they type of SSH keys to create
- -C flag allows for comments that get added as metadata at the end of the public key

`cat osmankayi.pub`

- Copy the Github SSh key starting with "sss-rsa" and ending with ".com".
- After that go to "Settings > SSH and GPG keys > New SSH key".
- Give it a unique name and paste the copied Github ssh key here.

## Apache

- Apache is the most commonly used Web server on Linux systems. Web servers are used to serve Web pages requested by client computers.

```BASH
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
```

#### Apache Configurations

```BASH
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
```

## PHP

- PHP is a general-purpose scripting language geared toward web development.

```BASH
sudo apt install php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-xml libapache2-mod-php7.4 -y
sudo service apache2 restart
```

**NOTE:** Two different verisons of php can be used with following the instructions 🚩[here](https://github.com/OsmanKAYI/osmankayi.com/blob/main/php/how.to.use.two.different.php.versions.md)🚩

**NOTE:** The max uploaded file size can be increased from [here](https://github.com/OsmanKAYI/osmankayi.com/blob/main/db/mysql/increase.max.upload.file.size.md)🚩

## Xdebug

- Xdebug is a PHP extension which provides debugging and profiling capabilities. It uses the DBGp debugging protocol.

```BASH
sudo find /usr/ -name xdebug.so
sudo apt-get purge php7.4-xdebug
sudo apt-get install php7.4-xdebug
sudo vi /etc/php/7.4/apache2/conf.d/20-xdebug.ini
```

##### Add following 3 lines in 20-xdebug.ini

```
zend_extension=xdebug.so
xdebug.mode=develop,debug
xdebug.start_with_request=yes
```

##### Restart Apache Service

```BASH
sudo systemctl restart apache2
```

##### How To Use Xdebug with VSCode

- You can follow the steps described in [Xdebug Configuration for VSCode](https://github.com/OsmanKAYI/osmankayi.com/blob/main/php/xdebug.md)

## Composer

- Composer is a dependency manager made for the PHP programming language. It allows users to easily manage and integrate external dependencies and libraries for PHP software development.

```BASH
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# put the composer.phar into a directory on your PATH, so you can simply call composer from any directory (Global install)
sudo mv composer.phar /usr/local/bin/composer
```

##### How To Watch Errors Real-time

```BASH
sudo tail -f /var/log/apache2/error.log
```

## MariaDB

- MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system, intended to remain free and open-source software under the GNU General Public License.

```BASH
sudo apt install mariadb-server mariadb-client -y
sudo systemctl enable mariadb
sudo service mariadb restart
sudo mysql -u root
  show databases;
  use mysql;
  update user set plugin='' where User='root';
  flush privileges;
  exit;
sudo mysql_secure_installation
```

#### MySQL Password Reset

- Below commands can be used just in the first experience since after the first usage, password will not be emty ('').

```BASH
sudo service mysql stop
sudo service mysqld stop
sudo mysqld_safe --skip-grant-tables --skip-networking &
mysql -u root
  use mysql;
  update user set password=PASSWORD("root") where User='root';
  flush privileges;
  quit;
sudo kill `sudo cat /var/run/mysqld/mysqld.pid`
sudo service mysql  start
sudo service mysqld start
```

- or simply

```BASH
mysql --user="root" --password="" --execute="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');"
```

#### MariaDB Password Reset

```BASH
sudo service mariadb vstop
sudo mysqld_safe --skip-grant-tables --skip-networking --skip-networking &
mysql -u root
  use mysql;
  update user set password=PASSWORD("root") where User='root';
  flush privileges;
  quit;
sudo kill `sudo cat /var/run/mysqld/mysqld.pid`
sudo service mariadb start
```

## Redis

- Redis is an in-memory data structure store, used as a distributed, in-memory key–value database, cache and message broker, with optional durability.

```BASH
sudo apt install redis-server php-redis -y
systemctl enable redis-server
systemctl start redis-server
```

#### Start Redis With Password

```BASH
sudo vim /etc/redis/redis.conf
```

- Find and uncomment `requirepass yourpassword` and write your password in "yourpassword" part

#### Change Redis Password

```BASH
redis-cli
#if exists
AUTH oldpassword
CONFIG SET requirepass "newpassword"
CONFIG REWRITE
```

## Restart Services

- Almost every change needs a restart to be activated.

```BASH
sudo service apache2 restart
sudo service mariadb restart
sudo systemctl enable mariadb
sudo systemctl enable apache2
```

## html Configurations

- The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser.

```BASH
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
cd ~
cd ~/Desktop
ln -s /var/www/html/
sudo rm -f /var/www/html/index.html
```

## Adminer

- Adminer is a tool for managing content in databases. It natively supports MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, Elasticsearch and MongoDB. Adminer is distributed under Apache license in a form of a single PHP file.

```BASH
cd /var/www/html
mkdir adminer
cd adminer
wget -O index.php https://www.adminer.org/latest.php
```

## Vue

- [Vue.js](https://vuejs.org/) is an open-source model–view–viewmodel front end JavaScript framework for building user interfaces and single-page applications. It was created by Evan You.

```BASH
# choose a $projectname, after that, choose `No` unless you know what you are doing
npm init vue@latest
```

```BASH
cd $projectname

# project setup
npm install

# compile and hot-reload for development
npm run dev
```

- When the project is ready to publish, run the following to have the last product.

```BASH
# compile and minify for production
npm run build
```

**NOTE:** If you face with some problems in `npm init vue@latest`, which is generally because of node version installed in machine, run the following.

```BASH
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
```

**NOTE:** If you see a warning about `spoof.js`, it can be beacuse of one of the firefox extensions (ex: `Mobile simulator`).

## Anaconda

- Anaconda is a distribution of the Python and R programming languages for scientific computing, that aims to simplify package management and deployment.

- Checkout the latest version from [download page](https://repo.anaconda.com/archive/) and run the following command.

  ```BASH
  curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
  bash anaconda.sh
  ```

- Press <kbd>ENTER</kbd> until the yes/no question comes.
- Then type `yes` to accept the Anaconda licence aggrement to continue.
- Verify the directory location for Anaconda installation. Just hit <kbd>ENTER</kbd> to continue installer to that directory.
- Type “yes” to initialize the Anaconda installer on your system.

  ```BASH
  # activate the installation
  source ~/.bashrc

  # check the installed version
  conda --version
  ```

- Now we are in the default base of the programming environment. To verify the installation we will open conda list.
  `conda list`
  `conda update --all -y` # to upgrade the Anaconda on your system
  `conda deactivate` # to exit from conda terminal

#### Jupyter Notebook

- Project Jupyter is a project to develop open-source software, open standards, and services for interactive computing across multiple programming languages.

```BASH
jupyter notebook # to start jupyter notebook while you are in the conda terminal
```

##### Convert Output to PDF

- If you want to export notebook to PDF in VSCode, below packages should be installed.

```BASH
sudo apt install texlive-xetex texlive-fonts-recommended texlive-plain-generic # install texlive packages
sudo apt install pandoc # install pandoc package
```

#### Completely Remove Anaconda

```BASH
rm -rf ~/anaconda3 ~/.conda

# to edit the ~/.bashrc file
vim ~/.bashrc
```

- Navigate to the end of the file and remove the Anaconda environment configuration.
- Press <kbd>ESC</kbd> and type `:wq` and then press <kbd>ENTER</kbd> to save file.

## GPT4All

- GPT4All is an open-source software ecosystem that allows anyone to train and deploy powerful and customized large language models (LLMs) on everyday hardware. Nomic AI oversees contributions to the open-source ecosystem ensuring quality, security and maintainability.

```BASH
cd ~/source/
mkdir gpt4all/
cd gpt4all/
wget https://gpt4all.io/installers/gpt4all-installer-linux.run
chmod +x gpt4all-installer-linux.run
./gpt4all-installer-linux.run
```

- After that,

  - Click on `Next`, three times
  - Check the box of `I accept the licence` and press `Next`
  - Click on `Install` button and press `Finish`

- To execute the program,

```BASH
cd ~/gpt4all/bin
# run the file called "chat"
```

- In first execution, one of the available models should be downloaded according to your operating system's condition.

## gphotos-sync

- gphotos-sync is a command line python application that uses the Google Photos API.

```BASH
apt install python3-pip
# install gphotos-sync wih pip:
python3 -m pip install gphotos-sync
# export ~/.local/bin in PATH if you haven't already (that's where the executables for packages installed using pip3 are stored)
echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc
# run .bashrc for updated PATH
source ~/.bashrc
```

- For more information visit [Get Photos on GooglePhotos Using gPhoto](./25.sync.googlephotos.md).

## OpenSSH

- OpenSSH is a suite of secure networking utilities based on the Secure Shell protocol, which provides a secure channel over an unsecured network in a client–server architecture.

```BASH
sudo apt-get install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
```

#### Copy SSH Public Key To Remote Server

```BASH
ssh-copy-id -i ~/.ssh/id_rsa user@server
```

#### How To Copy Files Within SSH Servers

```BASH
scp -r user@server:/file/to/path ./local/path/to/copy
```

#### Securely Stop SSH Server

```BASH
sudo service sshd stop
sudo systemctl disable sshd
```

## Postman

- Postman is an API Platform for developers to design, build, test and iterate their APIs.

```BASH
# download postman app on ubuntu
wget https://dl.pstmn.io/download/latest/linux64

# extract postman linux64 compressed file
sudo tar -xvf linux64 -C /usr/bin

# add this API testing tool to system PATH
echo 'export PATH="$PATH:/usr/bin/Postman"' >> ~/.bashrc
source ~/.bashrc

# create launcher shortcut
sudo vi /usr/share/applications/Postman.desktop
# copy and past the following lines
```

```
[Desktop Entry]
Name=Postman API Tool
GenericName=Postman
Comment=Testing API
Exec=/usr/bin/Postman/Postman
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/bin/Postman/app/resources/app/assets/icon.png
StartupWMClass=Postman
StartupNotify=true
```

#### Completely Remove Postman

```BASH
sudo rm -r /usr/bin/Postman
sudo rm -r /usr/share/applications/Postman.desktop
sudo rm -r ~/Desktop/Postman.desktop
```

## SoapUI Open Source

- For developers and testers looking to accelerate their ability to deliver REST, SOAP, and GraphQL APIs. SoapUI Open Source is the simplest and easiest way to begin your API testing journey.

**Intallation:**

- Visit [https://www.soapui.org/downloads/soapui/](SoapUI) and click on _Download SoapUI Open Source_.

```BASH
cd Downloads/
bash SoapUI-*
```

- Click on _Next_ for 6 times and, at the end, click on _Finish_

## AutoKey

- AutoKey is a free, open-source scripting application for Linux. AutoKey allows the user to define hotkeys and trigger phrases which expand to predefined text, automating frequent or repetitive tasks such as correcting typographical errors or common spelling mistakes and inserting boiler plate sections of text.

```BASH
sudo apt install autokey-gtk
```

## Knime

- Knime is an open-source analytics platform that provides its users with the opportunity to learn as they build. The unique design pipeline that it offers lets the users better understand their own requirements which resultantly ensures a more logical solution coming to fruition.

```BASH
# use "wget" to download the Knime tool
wget https://download.knime.org/analytics-platform/linux/knime-latest-linux.gtk.x86_64.tar.gz

# extract the compressed file
tar -xvzf knime-latest-linux.gtk.x86_64.tar.gz

# change the directory and move into the extracted folder
cd knime_*/

# run the executable file in the folder
./knime
```

## VirtualBox

- VirtualBox is a general purpose virtualiser that is available across Linux, Mac OS and Windows.

```BASH
sudo apt install virtualbox -y
```

### VirtualBox Full-Screen Configurations

```BASH
sudo apt update
sudo apt install build-essential dkms linux-headers-$(uname -r) -y
cd
cd /media/$USER/VBox_GAs_6.1.381
./autorun.sh
reboot
```

## VLC Media Player

- VLC media player is a free and open-source, portable, cross-platform media player software and streaming media server developed by the VideoLAN project.

```BASH
sudo apt install vlc -y
```

## Anydesk

- AnyDesk is a remote desktop application distributed by AnyDesk Software GmbH. The proprietary software program provides platform independent remote access to personal computers and other devices running the host application. It offers remote control, file transfer, and VPN functionality.

```BASH
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
cd ~/Downloads/
sudo apt install anydesk -y
```

**NOTE:** If the screen share is not working, use following commands.

```BASH
echo $XDG_SESSION_TYPE
sudo vi /etc/gdm3/custom.conf
# uncomment this line   ===>    WaylandEnable=false
# and reboot your system
```

## Discord

- Discord is a VoIP and instant messaging social platform. Users have the ability to communicate with voice calls, video calls, text messaging, media and files in private chats or as part of communities called "servers".

  - Download the DEB installer from [Discord](https://discord.com/download)
  - Open the dowload location in Terminal and type the following command.<br>
    `sudo dpkg -i discord-0.0.22.deb`

## Zoom

- Zoom, stylized as zoom or Zoom Meetings is a proprietary videotelephony software program developed by Zoom Video Communications.

  - Download the DEB installer from [Zoom](https://zoom.us/download?os=linux)
  - Open the dowload location in Terminal and type the following command.<br>
    `sudo apt install ./zoom_amd64.deb`

## Telegram

- Telegram Messenger is a globally accessible freemium, cross-platform, encrypted, cloud-based and centralized instant messaging service. The application also provides optional end-to-end encrypted chats, popularly known as secret chat and video calling, VoIP, file sharing and several other features.

```BASH
sudo apt install telegram-desktop
```

## Steam

- Steam is a video game digital distribution service and storefront from Valve. It was launched as a software client in September 2003 as a way for Valve to provide automatic updates for their games, and expanded to distributing third-party game publishers' titles in late 2005.

```BASH
sudo add-apt-repository multiverse
sudo apt install steam -y
```

## Sweet Home 3D

- Sweet Home 3D is a free architectural design software that helps users create a 2D plan of a house, with a 3D preview, and decorate exterior and interior views, including ability to place furniture and home appliances. In Sweet Home 3D, furniture can be imported and arranged to create a virtual environment.

```BASH
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.sweethome3d.Sweethome3d -y
flatpak update com.sweethome3d.Sweethome3d
sudo apt install sweethome3d -y
```
