# Setup Necessary Features on Linux 22.04

## System Update Installation

- Below commands are used to make the system up to date. Both commands should be run before installing any app.

```bash
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh
```

## Set System Time

```bash
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

```bash
setxkbmap tr
```

## Check Drivers

```bash
sudo ubuntu-drivers autoinstall
```

## Desktop Configurations

```bash
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

```bash
sudo apt-get install guake -y
```

### Guake Configurations

- In start menu type `Guake` and press `ENTER` to launch Guake Preferences.
- In `General` fulfill the checkbox for `Start Guake at login`.
- In `Main Window` fulfill the checkbox for `Place tabs on top`.

## The Fuck

- The Fuck is a magnificent app that corrects errors in previous console commands.

```bash
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user
```

## Necessary Packages

- **axel** is a program that downloads a file from a FTP or HTTP server through multiple connection, each connection downloads its own part of the file.
- **bat**, is a cat command written in Rust programming language, comes with syntax highlighting, git integration, and works as is a drop-in cat command replacement.
- **boxes** is a text filter which can draw any kind of box around its input text. Box design choices range from simple boxes to complex ASCII art.
- **caffeine** prevents the desktop from becoming idle when an application is running full-screen. A desktop indicator ‘caffeine-indicator’ supplies a manual toggle, and the command ‘caffeinate’ can be used to prevent idleness for the duration of any command.
- **curl** is a command line tool for transferring data from or to a server.
- **figlet** is a a computer program that generates text banners, in a variety of typefaces, composed of letters made up of conglomerations of smaller ASCII characters.
- **gnome Tweak Tool** is software that allows us to change the general appearance and behavior of components in the Gnome Desktop Environment.
- **gpustat** is a GPU monitoring tool, capable of displaying a multitude of information from multiple GPU nodes on one page.
- **hardInfo** (in short for “hardware information“) is a system profiler and benchmark graphical tool for Linux systems, that is able to gather information from both hardware and some software and organize it in an easy to use GUI tool.
- **hashcat** is a password recovery tool. It had a proprietary code base until 2015, but was then released as open source software.
- **locate**, is a powerful tool in Linux used for finding files and directories in your system. It uses a database that stores the path of every file and directory, making the search process significantly faster than searching through each directory manually.
- **lolcat** is a program that concatenates files, or standard input, to standard output (like the generic cat), and adds rainbow coloring to it.
- **meld**, is the visual diff and merge tool, targeted at developers. It allows users to compare two or three files or directories visually, color-coding the different lines.
- **net-tools** package is a collection of programs for controlling the network subsystem of the Linux kernel. This package is known to build and work properly using an LFS-10.1 platform. This package includes `ifconfig`.
- **nvtop** is a ncurses-based GPU status viewer for NVIDIA GPUs.
- **pdftk**, is a PDF toolkit. It allows you to manipulate PDF files. It also allows you to extract text from PDF files.
- **pv** shows the progress of data through a pipeline by giving information such as time elapsed, percentage completed (with progress bar), current throughput rate, total data transferred, and ETA.
- **ranger**, is a console file manager with VI key bindings.
- **testdisk** checks and recovers lost partitions.
- **tmux** is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached..
- **tree**, is used to display the directory structure in a tree-like format.
- **unrar** extracts RAR file archives.
- **xclip** is X11 clipboard manipulation tool, similar to xsel.Handles the X primary and secondary selections, plus the system clipboard ( `CTRL` + `C` / `CTRL` + `V` ).
- **vim** is a free and open-source, screen-based text editor program.
- **wormhole** lets you share files with end-to-end encryption and a link that automatically expires. So you can keep what you share private and make sure your stuff doesn't stay online forever.

```bash
sudo apt install axel bat boxes caffeine curl figlet gnome-tweaks gpustat hardinfo hashcat locate lolcat meld net-tools nvtop pdftk pv ranger testdisk tmux tree unrar xclip vim magic-wormhole -y
```

- `batcat $fileName` # to see and arrange the content of any file.
- `xclip -sel clip` # to copy
- `xclip -sel clip -o` # to paste
- `gpustat -i 0.20` # to follow GPU usage as 5 measurements / second (or 1 measurement / milisecond)
- `wormhole send "fileName"` # to send file
- `figlet Osman Kayi|lolcat` # to see piped and colored text of "Osman Kayi"

## Ezan Vakti

- **Ezan Vakti** is a pray time reminder application for Linux.

```bash
sudo make PREFIX=/usr sysconfdir=/etc install
```

- Visit official [GitHub Page](https://github.com/fbostanci/ezanvakti) for more information.

## Ulauncher

- **Ulauncher** is an application launcher for Linux

```bash
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher -y
```

- `CTRL` + `SPACE BAR` to use Ulauncher.

## TLDR

- **TLDR** is an internet slang for a summary of a long text. Its name comes from the acronym (or initialism) TL;DR, which stands for too long; didn't read. In the same spirit, the tldr command-line tool summarizes a lengthy man page and consists mainly of examples.

```bash
sudo apt install tldr -y
tldr -u
```

- `tldr $commandName` # to get short summary manual of any command.

## MC

- Midnight Commander, a terminal based file manager.Navigate the directory structure using the arrow keys, the mouse or by typing the commands into the terminal.

```bash
sudo apt install mc -y
```

## GNOME Sushi

- It is a file previewer. To use it hit Space Bar on keyboard to quick preview selected file in a pop-up window. And, hit the Space Bar again will close it.

```bash
sudo apt install gnome-sushi -y
```

## GNOME Screenshot

- GNOME Screenshot is a desktop environment-agnostic utility for taking screenshots. When you bind any key to gnome-screenshot, you can use this key combination to take screenshot.

```bash
# Install required packages
sudo apt install gnome-screenshot xclip -y

### Set up custom shortcut for taking screenshots with Windows key + Shift + S
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot '<Super><Shift>s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Take a Screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super><Shift>s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "sh -c 'gnome-screenshot -af ~/Pictures/\$(date "+%Y.%m.%d-%H.%M.%S").png'"
### Add the custom shortcut to the list of custom shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[ '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/' ]"
### Add the necessary permissions to the custom shortcut
sudo chmod ugo+rwx /home/$USER/Pictures/*
```

## Master PDF Editor

- Master PDF Editor is the optimal solution for editing PDF files in Linux. It enables you to create, edit, view, encrypt, sign and print interactive PDF documents.

```bash
sudo snap install master-pdf-editor-5 -y
```

## GIMP Image Editor

- GIMP is a free and open-source raster graphics editor used for image manipulation and image editing, free-form drawing, transcoding between different image file formats, and more specialized tasks.

```bash
sudo apt install gimp -y
```

**NOTE:** To see an example and have some tips, visit [Ubuntu Community Retouch Photos](https://help.ubuntu.com/community/Photos/RetouchPhotos)

## LYNX

- Command-line web browser.

```bash
sudo apt install lynx -y
```

## TUXEDO Control Center

- The TUXEDO Control Center (short: TCC) gives TUXEDO laptop users full control over their hardware like CPU cores, fan speed and more. To get more information about the project visit [TUXEDO Control Center Project](https://github.com/tuxedocomputers/tuxedo-control-center) on GitHub.

```bash
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

```bash
# remove existing Firefox Snap package
sudo snap remove firefox
# install Firefox from the PPA
sudo apt update
# purge Firefox
sudo apt purge firefox -y
# install Firefox
sudo apt install firefox -y
```

## Chromium

- Chromium is a free and open-source web browser project, mainly developed and maintained by Google. This codebase provides the vast majority of code for the Google Chrome browser, which is proprietary software and has some additional features.

```bash
sudo apt install chromium-browser -y
```

## Syncthing

- Syncthing is an open-source application that enables you to transfer your files directly between two (or more) devices.

```bash
# Add the release PGP keys
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
# Add the "stable" channel to your APT sources
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing -y
```

## Cockpit

Cockpit is an interactive server admin interface. It is easy to use and very lightweight.

```bash
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit -y
```

After that, type `localhost:9090` on your browser and login with your system's username and password.

## Windsurf

- Windsurf is an open-source application that enables you to transfer your files directly between two (or more) devices.

```bash
# Add the release PGP keys
curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
# Add the "stable" channel to your APT sources
echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
# Update the system
sudo apt update
# Install Windsurf
sudo apt upgrade windsurf -y
```

**Ref:** [Windsurf - Codeium](https://codeium.com/windsurf/download_linux)

**NOTE:** Useful Windsurf extensions and related setting.json file can be found from [here](https://github.com/OsmanKAYI/full-stack-roadmap/blob/master/windsurf/extensions.md)

## Visual Studio Code

- Visual Studio Code, also commonly referred to as VSCode, is a source-code editor made by Microsoft with the Electron Framework, for Windows, Linux and macOS. Features include support for debugging, syntax highlighting, intelligent code completion, snippets, code refactoring, and embedded Git.

```bash
sudo rm /etc/apt/sources.list.d/vscode.list
sudo rm /usr/share/keyrings/vscode.gpg
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
```

**Ref:** [linuxhint](https://linuxhint.com/install-visual-studio-code-ubuntu22-04/)

**NOTE:** Other useful VSCode extensions and related setting.json file can be found from [here](https://github.com/OsmanKAYI/full-stack-roadmap/blob/master/vscode/extensions.md)

## WPS Office

- As one of the best Microsoft Office alternatives of 2021, WPS Office is fully compatible with main Linux distributions, including Ubuntu and Linux Mint. Download [WPS Office](https://www.wps.com/) for Linux. After downloading latest version, follow the steps below.

```bash
# dive into download directory
cd ~/Downloads/
# download WPS Office
wget https://wps-community.org/wps-office_11.1.0.11723.XA_amd64.deb
# install the downloaded file
sudo dpkg -i wps-office_11.1.0.11723.XA_amd64.deb
```

## Zotero

- Zotero is a free, easy-to-use tool to help you collect, organize, annotate, cite, and share research.

```bash
sudo apt install wget -y
wget https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh -O - | sudo bash
sudo apt update
sudo apt install zotero -y
```

## Notion

- Notion is a freemium productivity and note-taking web application developed by Notion Labs Inc. It offers organizational tools including task management, project tracking, to-do lists, bookmarking, and more.

```bash
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app-enhanced -y
sudo apt install notion-app -y
```

## Git

- Git is a distributed version control system developed by Linus Torvalds, the creator of the Linux Kernel.

```bash
sudo apt-get install git -y
git config --global user.email "osmankayi06@gmail.com"
git config --global user.name "OsmanKAYI"
# to set the default branch name as "main"
git config --global init.defaultBranch main
```

### GitHub Configurations

```bash
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

```bash
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
```

### Apache Configurations

```bash
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
```

## PHP

- PHP is a general-purpose scripting language geared toward web development.

```bash
sudo apt install php -y
sudo service apache2 restart
```

**NOTE:** Two different verisons of php can be used with following the instructions 🚩[here](https://github.com/OsmanKAYI/osmankayi.com/blob/main/php/how.to.use.two.different.php.versions.md)🚩

**NOTE:** The max uploaded file size can be increased from [here](https://github.com/OsmanKAYI/osmankayi.com/blob/main/db/mysql/increase.max.upload.file.size.md)🚩

## Xdebug

- Xdebug is a PHP extension which provides debugging and profiling capabilities. It uses the DBGp debugging protocol.

```bash
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo find /usr/ -name xdebug.so
sudo apt-get purge php7.4-xdebug
sudo apt-get install php7.4-xdebug
sudo vi /etc/php/7.4/apache2/conf.d/20-xdebug.ini
```

### Add following 3 lines in 20-xdebug.ini

```bash
zend_extension=xdebug.so
xdebug.mode=develop,debug
xdebug.start_with_request=yes
```

### Restart Apache Service

```bash
sudo systemctl restart apache2
```

**NOTE:** When you run the `php -v` command, it will show you the version of PHP you are using. Check the line which starts with `with Xdebug v...`. If you see this line, it means Xdebug is installed and working properly.

```bash
# sample code block
php -v
PHP 8.3.15 (cli) (built: Dec 24 2024 06:10:28) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.3.15, Copyright (c) Zend Technologies
    with Zend OPcache v8.3.15, Copyright (c), by Zend Technologies
    with Xdebug v3.4.0, Copyright (c) 2002-2024, by Derick Rethans
# last line includes Xdebug so working properly
```

### How To Use Xdebug with VSCode

- You can follow the steps described in [Xdebug Configuration for VSCode](https://github.com/OsmanKAYI/osmankayi.com/blob/main/php/xdebug.md)

## Composer

- Composer is a dependency manager made for the PHP programming language. It allows users to easily manage and integrate external dependencies and libraries for PHP software development.

```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# put the composer.phar into a directory on your PATH, so you can simply call composer from any directory (Global install)
sudo mv composer.phar /usr/local/bin/composer
```

- To be able to run the composer, you need to run `source ~/.bashrc`.

**NOTE:** To update composer, run `composer self-update`.

### How To Watch Errors Real-time

```bash
sudo tail -f /var/log/apache2/error.log
```

## MariaDB

- MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system, intended to remain free and open-source software under the GNU General Public License.

```bash
sudo apt install mariadb-server mariadb-client -y
sudo systemctl enable mariadb
sudo service mariadb restart
### sudo mysql_secure_installation
## mysql password reset
mysql --user="root" --password="" --execute="use mysql; SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root'); flush privileges;"
```

### MariaDB Password Reset (if you forgot your password)

```bash
sudo service mariadb stop
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

```bash
sudo apt install redis-server php-redis -y
systemctl enable redis-server
systemctl start redis-server
```

### Start Redis With Password

```bash
sudo vim /etc/redis/redis.conf
```

- Find and uncomment `requirepass yourpassword` and write your password in "yourpassword" part

#### Change Redis Password

```bash
redis-cli
#if exists
AUTH oldpassword
CONFIG SET requirepass "newpassword"
CONFIG REWRITE
```

## Restart Services

- Almost every change needs a restart to be activated.

```bash
sudo service apache2 restart
sudo service mariadb restart
sudo systemctl enable mariadb
sudo systemctl enable apache2
```

## html Configurations

- The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser.

```bash
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
cd ~/Desktop
ln -s /var/www/html/
sudo rm -f /var/www/html/index.html
```

## Adminer

- Adminer is a tool for managing content in databases. It natively supports MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, Elasticsearch and MongoDB. Adminer is distributed under Apache license in a form of a single PHP file.

```bash
cd /var/www/html
mkdir adminer
cd adminer
wget -O index.php https://www.adminer.org/latest.php
```

## Node with NVM

- NVM is a Node.js version manager. It allows you to install and switch between different versions of Node.js.
- To see what is the latest version, visit [nvm-sh on Github](https://github.com/nvm-sh/nvm/releases).

```bash
# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# start nvm
source ~/.bashrc
# list remote versions
nvm ls-remote
# install latest node version
nvm install node  # "node" is an alias for the latest version
```

### Degit

- Degit is a tool that allows you to download and install Git repositories from GitHub, GitLab, Bitbucket, and other Git hosting services without including their commit history. So the fastest and lightest way to install Git projects.

```bash
npm i degit -g
```

**Example Usage:** `degit $username/$projectname`

## Vue

- [Vue.js](https://vuejs.org/) is an open-source model–view–viewmodel front end JavaScript framework for building user interfaces and single-page applications. It was created by Evan You.

```bash
# choose a $projectname, after that, choose `No` unless you know what you are doing
npm init vue@latest
```

```bash
cd $projectname

# project setup
npm install

# compile and hot-reload for development
npm run dev
```

- When the project is ready to publish, run the following to have the last product.

```bash
# compile and minify for production
npm run build
```

**NOTE:** If you face with some problems in `npm init vue@latest`, which is generally because of node version installed in machine, run the following.

```bash
npm cache clean -f
npm install -g n
n stable
```

**NOTE:** If you see a warning about `spoof.js`, it can be beacuse of one of the firefox extensions (ex: `Mobile simulator`).

## Draw.io

- [Draw.io](https://www.draw.io/) is a modern diagramming and collaboration tool for teams, individuals, and organizations.

```bash
curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest | grep browser_download_url | grep '\.deb' | cut -d '"' -f 4 | wget -i -
sudo apt -f install ./drawio-amd64-*.deb
```

## Anaconda

- Anaconda is a distribution of the Python and R programming languages for scientific computing, that aims to simplify package management and deployment.

- Checkout the latest version from [download page](https://repo.anaconda.com/archive/) and run the following command.

  ```bash
  curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
  bash anaconda.sh
  ```

- Press `ENTER` until the yes/no question comes.
- Then type `yes` to accept the Anaconda licence aggrement to continue.
- Verify the directory location for Anaconda installation. Just hit `ENTER` to continue installer to that directory.
- Type “yes” to initialize the Anaconda installer on your system.

  ```bash
  # activate the installation
  source ~/.bashrc

  # check the installed version
  conda --version
  ```

- Now we are in the default base of the programming environment. To verify the installation we will open conda list.
  `conda list`
  `conda update --all -y` # to upgrade the Anaconda on your system
  `conda deactivate` # to exit from conda terminal

### Jupyter Notebook

- Project Jupyter is a project to develop open-source software, open standards, and services for interactive computing across multiple programming languages.

```bash
jupyter notebook # to start jupyter notebook while you are in the conda terminal
```

#### Convert Output to PDF

- If you want to export notebook to PDF in VSCode, below packages should be installed.

```bash
sudo apt install texlive-xetex texlive-fonts-recommended texlive-plain-generic # install texlive packages
sudo apt install pandoc # install pandoc package
```

#### Completely Remove Anaconda

```bash
rm -rf ~/anaconda3 ~/.conda

# to edit the ~/.bashrc file
vim ~/.bashrc
```

- Navigate to the end of the file and remove the Anaconda environment configuration.
- Press `ESC` and type `:wq` and then press `ENTER` to save file.

## GPT4All

- GPT4All is an open-source software ecosystem that allows anyone to train and deploy powerful and customized large language models (LLMs) on everyday hardware. Nomic AI oversees contributions to the open-source ecosystem ensuring quality, security and maintainability.

```bash
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

```bash
cd ~/gpt4all/bin
# run the file called "chat"
```

- In first execution, one of the available models should be downloaded according to your operating system's condition.

## gphotos-sync

- gphotos-sync is a command line python application that uses the Google Photos API.

```bash
apt install python3-pip
# install gphotos-sync wih pip:
python3 -m pip install gphotos-sync
# export ~/.local/bin in PATH if you haven't already (that's where the executables for packages installed using pip3 are stored)
echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc
# run .bashrc for updated PATH
source ~/.bashrc
```

- For more information visit [Get Photos on GooglePhotos Using gPhoto](./sync.googlephotos.md).

## OpenSSH

- OpenSSH is a suite of secure networking utilities based on the Secure Shell protocol, which provides a secure channel over an unsecured network in a client–server architecture.

```bash
sudo apt-get install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh

sudo ufw allow ssh
sudo ufw enable  # Activate Firewall
```

The followings will be added at the end of `etc/ssh/sshd_config` file:

```bash
ClientAliveInterval 300
PermitRootLogin yes
PasswordAuthentication yes
```

### Copy SSH Public Key To Remote Server

```bash
ssh-copy-id -i ~/.ssh/id_rsa user@server
```

### How To Copy Files Within SSH Servers

```bash
scp -r user@server:/file/to/path ./local/path/to/copy
```

### Securely Stop SSH Server

```bash
sudo service sshd stop
sudo systemctl disable sshd
```

## Postman

- Postman is an API Platform for developers to design, build, test and iterate their APIs.

```bash
# download postman app on ubuntu
wget https://dl.pstmn.io/download/latest/linux64

# extract postman linux64 compressed file
sudo tar -xvf linux64 -C /usr/bin

# add this API testing tool to system PATH
echo 'export PATH="$PATH:/usr/bin/Postman"' >> ~/.bashrc
source ~/.bashrc

# create launcher shortcut
echo "[Desktop Entry]
Name=Postman API Tool
GenericName=Postman
Comment=Testing API
Exec=/usr/bin/Postman/Postman
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/bin/Postman/app/resources/app/assets/icon.png
StartupWMClass=Postman
StartupNotify=true" | sudo tee /usr/share/applications/Postman.desktop
```

### Completely Remove Postman

```bash
sudo rm -r /usr/bin/Postman
sudo rm -r /usr/share/applications/Postman.desktop
sudo rm -r ~/Desktop/Postman.desktop
```

## SoapUI Open Source

- For developers and testers looking to accelerate their ability to deliver REST, SOAP, and GraphQL APIs. SoapUI Open Source is the simplest and easiest way to begin your API testing journey.

**Intallation:**

- Visit [SoapUI](https://www.soapui.org/downloads/soapui/) and click on _Download SoapUI Open Source_.

```bash
cd Downloads/
bash SoapUI-*
```

- Click on _Next_ for 6 times and, at the end, click on _Finish_

## AutoKey

- AutoKey is a free, open-source scripting application for Linux. AutoKey allows the user to define hotkeys and trigger phrases which expand to predefined text, automating frequent or repetitive tasks such as correcting typographical errors or common spelling mistakes and inserting boiler plate sections of text.

```bash
sudo apt install autokey-gtk -y
```

## Knime

- Knime is an open-source analytics platform that provides its users with the opportunity to learn as they build. The unique design pipeline that it offers lets the users better understand their own requirements which resultantly ensures a more logical solution coming to fruition.

```bash
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

```bash
sudo apt install virtualbox -y
```

### VirtualBox Full-Screen Configurations

```bash
sudo apt update
sudo apt install build-essential dkms linux-headers-$(uname -r) -y
cd ~/media/$USER/VBox_GAs_6.1.381
./autorun.sh
reboot
```

## VLC Media Player

- VLC media player is a free and open-source, portable, cross-platform media player software and streaming media server developed by the VideoLAN project.

```bash
sudo apt install vlc -y
```

## Anydesk

- AnyDesk is a remote desktop application distributed by AnyDesk Software GmbH. The proprietary software program provides platform independent remote access to personal computers and other devices running the host application. It offers remote control, file transfer, and VPN functionality.

```bash
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
cd ~/Downloads/
sudo apt install anydesk -y
```

**NOTE:** If the screen share is not working, use following commands.

```bash
echo $XDG_SESSION_TYPE
sudo vi /etc/gdm3/custom.conf
# uncomment this line   ===>    WaylandEnable=false
# and reboot your system
```

## Discord

- Discord is a VoIP and instant messaging social platform. Users have the ability to communicate with voice calls, video calls, text messaging, media and files in private chats or as part of communities called "servers".

  - Download the DEB installer from [Discord](https://discord.com/download)
  - Open the dowload location in Terminal and type the following command.

  `sudo dpkg -i discord-0.0.22.deb`

## Zoom

- Zoom, stylized as zoom or Zoom Meetings is a proprietary videotelephony software program developed by Zoom Video Communications.

  - Download the DEB installer from [Zoom](https://zoom.us/download?os=linux)
  - Open the dowload location in Terminal and type the following command.

  `sudo dpkg -i install ./zoom_amd64.deb`

## Telegram

- Telegram Messenger is a globally accessible freemium, cross-platform, encrypted, cloud-based and centralized instant messaging service. The application also provides optional end-to-end encrypted chats, popularly known as secret chat and video calling, VoIP, file sharing and several other features.

```bash
sudo apt install telegram-desktop -y
```

## Steam

- Steam is a video game digital distribution service and storefront from Valve. It was launched as a software client in September 2003 as a way for Valve to provide automatic updates for their games, and expanded to distributing third-party game publishers' titles in late 2005.

```bash
sudo add-apt-repository multiverse -y
sudo apt install steam -y
```

## Fritzing

- Fritzing is an open-source electronic design tool focusing on makers, hobbyists, and everyone else interested in getting creative with interactive electronics.

```bash
sudo apt install fritzing -y
```

## Sweet Home 3D

- Sweet Home 3D is a free architectural design software that helps users create a 2D plan of a house, with a 3D preview, and decorate exterior and interior views, including ability to place furniture and home appliances. In Sweet Home 3D, furniture can be imported and arranged to create a virtual environment.

```bash
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.sweethome3d.Sweethome3d -y
flatpak update com.sweethome3d.Sweethome3d
sudo apt install sweethome3d -y
```

## Startup Applications

- These applications will be started automatically on your system.

```bash
## create the directory (if it doesn’t exist):
mkdir -p ~/.config/autostart
## ezanvakti.desktop
echo -e '[Desktop Entry]\nType=Application\nExec=ezanvakti\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName=Ezan Vakti' > ~/.config/autostart/ezanvakti.desktop
## guake.desktop
echo -e '[Desktop Entry]\nName[tr]=Guake Uçbirim\nName=Guake Terminal\nComment=Use the command line in a Quake-like terminal\nTryExec=guake\nExec=guake\nIcon=guake\nType=Application\nCategories=GNOME;GTK;System;Utility;TerminalEmulator;\nStartupNotify=true\nX-Desktop-File-Install-Version=0.22\nX-GNOME-Autostart-enabled=true\nHidden=false\nNoDisplay=false' > ~/.config/autostart/guake.desktop
## caffeine.desktop
echo -e '[Desktop Entry]\nIcon=caffeine\nName=Caffeine\nComment=Temporarily deactivate the screensaver and sleep mode\nExec=caffeine-indicator\nTerminal=false\nType=Application\nCategories=Utility;\nKeywords=Screensaver,Power,Saving,Blank\nStartupNotify=false' > ~/.config/autostart/caffeine.desktop
## ulauncher
echo -e '[Desktop Entry]\nName=Ulauncher\nComment=Application launcher for Linux\nExec=env GDK_BACKEND=x11 /usr/bin/ulauncher --hide-window --hide-window\nIcon=ulauncher\nTerminal=false\nType=Application\nCategories=Utility;Application;' > ~/.config/autostart/ulauncher.desktop
```

## Favorite Applications

- These applications will be displayed on your system's dock.

```bash
gsettings get org.gnome.shell favorite-apps ['org.gnome.Nautilus.desktop', 'gnome-system-monitor.desktop', 'virtualbox.desktop', 'thunderbird.desktop', 'firefox_firefox.desktop', 'chromium_chromium.desktop', 'telegramdesktop.desktop', 'code.desktop', 'windsurf.desktop', 'zotero.desktop', 'Postman.desktop', 'wps-office-prometheus.desktop', 'org.fritzing.Fritzing.desktop']
```

## Settings

```bash
## appearance
### style
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-sage-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 11'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-sage-dark'
gsettings set org.gnome.desktop.interface gtk-color-scheme ''
gsettings set org.gnome.desktop.interface gtk-color-palette 'black:white:gray50:red:purple:blue:light blue:green:yellow:orange:lavender:brown:goldenrod4:dodger blue:pink:light green:gray10:gray30:gray75:gray90'
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste true
gsettings set org.gnome.desktop.interface gtk-im-module ''
gsettings set org.gnome.desktop.interface gtk-im-preedit-style 'callback'
gsettings set org.gnome.desktop.interface gtk-im-status-style 'callback'
gsettings set org.gnome.desktop.interface gtk-key-theme 'Default'
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
gsettings set org.gnome.desktop.interface font-hinting 'slight'
gsettings set org.gnome.desktop.interface font-rgba-order 'rgb'
gsettings set org.gnome.desktop.interface enable-animations true
gsettings set org.gnome.desktop.interface overlay-scrolling true
gsettings set org.gnome.desktop.interface cursor-size 24
gsettings set org.gnome.desktop.interface cursor-blink true
gsettings set org.gnome.desktop.interface cursor-blink-time 1200
gsettings set org.gnome.desktop.interface cursor-blink-timeout 10
gsettings set org.gnome.desktop.interface scaling-factor uint32 0
gsettings set org.gnome.desktop.interface text-scaling-factor 1.0

### desktop icons
gsettings set org.gnome.shell.extensions.ding icon-size 'standard'
gsettings set org.gnome.shell.extensions.ding start-corner 'top-left'

### dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button true

## sound
### system volume
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

## power
### power saving options
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 900
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 1200

### suspend & power button
gsettings set org.gnome.desktop.interface show-battery-percentage true

### additional
gsettings set org.gnome.desktop.interface can-change-accels false
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface locate-pointer true
gsettings set org.gnome.desktop.interface menubar-accel 'F10'
gsettings set org.gnome.desktop.interface menubar-detachable false
gsettings set org.gnome.desktop.interface menus-have-tearoff false
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Sans Mono 13'
gsettings set org.gnome.desktop.interface toolbar-detachable false
gsettings set org.gnome.desktop.interface toolbar-icons-size 'large'
gsettings set org.gnome.desktop.interface toolbar-style 'both-horiz'
gsettings set org.gnome.desktop.interface toolkit-accessibility false
```
