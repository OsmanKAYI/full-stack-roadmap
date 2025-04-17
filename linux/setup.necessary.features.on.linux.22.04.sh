clear

## COLORS
## COLORS
## COLORS
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWNORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'

DARKGREY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

NC='\033[0m' # No Color

echo -e -n "Please fulfill the instructions for ${YELLOW}GIT${NC}"
echo ""
echo -e -n "Enter your ${LIGHTCYAN}name and surname${NC}: "
read GIT_NAME_SURNAME
echo -e -n "Enter your ${LIGHTCYAN}git email${NC}: "
read GIT_EMAIL
echo -e -n "Enter your ${LIGHTCYAN}filename${NC} to be shown instead of id_rsa for ~/.ssh/: "
read SSH_FILENAME

echo ""
echo ""

echo -e -n "Please fulfill the instructions for ${YELLOW}REDIS${NC}"
echo ""
echo -e -n "Enter your ${LIGHTCYAN}redis password${NC}: "
read REDIS_PASSWORD

echo ""
echo ""
echo -e  "$LIGHTGREEN !!! INSTALLATION STARTED !!! $NC"
echo ""

# SETUP NECESSARY FEATURES ON LINUX 22.04

## System Update Installation
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh

## Set System Time
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

## Set Keyboard Setting for Türkçe
setxkbmap tr

# Ubuntu Settings
## appearance
### style
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme  'Yaru-sage'
### desktop icons
gsettings set org.gnome.shell.extensions.ding icon-size 'standard'
gsettings set org.gnome.shell.extensions.ding start-corner 'top-left'
### dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
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

## Check Drivers
sudo ubuntu-drivers autoinstall -y

## Desktop Configurations
# to set the position of the dock to the left
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
# to minimize/extend all windows of a folder/program with one click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# to switch between windows of a folder/program with mouse rolling
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

## Guake
sudo apt-get install guake -y

## The Fuck
sudo apt install python3-dev python3-pip python3-setuptools -y
pip3 install thefuck --user

## Necessary Packages
sudo apt install axel bat boxes caffeine curl figlet gnome-tweaks gpustat hardinfo hashcat locate lolcat meld net-tools nvtop pdftk pv ranger testdisk tmux tree unrar vim magic-wormhole xclip -y

## Ulauncher
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher -y

## TLDR
sudo apt install tldr -y
tldr -u

## MC
sudo apt install mc -y

## GNOME Sushi
sudo apt install gnome-sushi -y

## GNOME Screenshot
sudo apt install gnome-screenshot xclip -y
# set up custom shortcut for taking screenshots with Windows key + Shift + S
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot '<Super><Shift>s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Take a Screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super><Shift>s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "sh -c 'gnome-screenshot -af ~/Pictures/\$(date "+%Y.%m.%d-%H.%M.%S").png'"
# add the custom shortcut to the list of custom shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[ '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/' ]"
# add the necessary permissions to the custom shortcut
sudo chmod ugo+rwx /home/$USER/Pictures/*

## Master PDF Editor
sudo snap install master-pdf-editor-5 -y

## GIMP Image Editor
sudo apt install gimp -y

## LYNX
sudo apt install lynx -y

## TUXEDO Control Center
# add repositories in apt list (my case it is "jammy" but it may subject to change depending on your condition)
echo -e "deb https://deb.tuxedocomputers.com/ubuntu jammy main" | sudo tee -a /etc/apt/sources.list.d/tuxedocomputers.list
# dive into source directory
cd /etc/apt/trusted.gpg.d/
# dowload the programm
sudo wget https://deb.tuxedocomputers.com/0x54840598.pub.asc
# update and install the program
sudo apt update
sudo apt install tuxedo-control-center -y

## Firefox
# remove existing Firefox Snap package
sudo snap remove firefox
# install Firefox from the PPA
sudo apt update
# purge Firefox
sudo apt purge firefox -y
# install Firefox
sudo apt install firefox -y

## Chromium
sudo apt install chromium chromium-browser -y

## Syncthing
# add the release PGP keys
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
# add the "stable" channel to your APT sources
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing -y

## Cockpit
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit -y

## Windsurf
# Add the release PGP keys
curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
# Add the "stable" channel to your APT sources
echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
# Update the system
sudo apt update
# Install Windsurf
sudo apt upgrade windsurf -y
# install extesions
wget https://raw.githubusercontent.com/OsmanKAYI/full-stack-roadmap/main/vscode/extensions.sh -O - | sh
rm -f extensions.sh

## Visual Studio Code
sudo rm /etc/apt/sources.list.d/vscode.list
sudo rm /usr/share/keyrings/vscode.gpg
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
# install extesions
wget https://raw.githubusercontent.com/OsmanKAYI/full-stack-roadmap/main/vscode/extensions.sh -O - | sh

## WPS Office
# dive into download directory
cd ~/Downloads/
# download WPS Office
wget https://wps-community.org/wps-office_11.1.0.11723.XA_amd64.deb
# install the downloaded file
sudo dpkg -i wps-office_11.1.0.11723.XA_amd64.deb

## Notion
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app-enhanced -y
sudo apt install notion-app -y

## Git
sudo apt-get install git -y
git config --global user.email "GIT_EMAIL"
git config --global user.name "GIT_USERNAME"
# to set the default branch name as "main"
git config --global init.defaultBranch main 

## Apache
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
## apache Configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/

## PHP
sudo apt install php -y
sudo service apache2 restart
## restart Apache Service
sudo systemctl restart apache2

## Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
# put the composer.phar into a directory on your PATH, so you can simply call composer from any directory (Global install)
sudo mv composer.phar /usr/local/bin/composer
## watch errors real-time
sudo tail -f /var/log/apache2/error.log

## MySQL
sudo apt install mariadb-server mariadb-client -y
sudo systemctl enable mariadb
sudo service mariadb restart
### sudo mysql_secure_installation
## mysql password reset
mysql --user="root" --password="" --execute="use mysql; SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root'); flush privileges;"

## Redis
sudo apt install redis-server php-redis -y
systemctl enable redis-server
systemctl start redis-server
## change Redis Password
redis-cli
#if exists
AUTH oldpassword
CONFIG SET requirepass $REDIS_PASSWORD
CONFIG REWRITE

## Restart Services
sudo service apache2 restart
sudo service mariadb restart
sudo systemctl enable mariadb
sudo systemctl enable apache2

## html Configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
cd ~/Desktop
ln -s /var/www/html/
sudo rm -f /var/www/html/index.html

## Adminer
cd /var/www/html
mkdir adminer
cd adminer
wget -O index.php https://www.adminer.org/latest.php

## Node with NVM
# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# start nvm
source ~/.bashrc
# list remote versions
nvm ls-remote
# install latest node version
nvm install node  # "node" is an alias for the latest version

### Degit
# install degit to download and install Git repositories
npm i degit -g

## Draw.io
# install drawio to design diagrams and webpages
curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest | grep browser_download_url | grep '\.deb' | cut -d '"' -f 4 | wget -i -
sudo apt -f install ./drawio-amd64-*.deb

## gphotos-sync
apt install python3-pip
# install gphotos-sync wih pip:
python3 -m pip install gphotos-sync
# export ~/.local/bin in PATH if you haven't already (that's where the executables for packages installed using pip3 are stored)
echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc
# run .bashrc for updated PATH
source ~/.bashrc

## OpenSSH
sudo apt-get install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh

## Postman
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

## AutoKey
sudo apt install autokey-gtk -y

## Knime
# use "wget" to download the Knime tool
wget https://download.knime.org/analytics-platform/linux/knime-latest-linux.gtk.x86_64.tar.gz
# extract the compressed file
tar -xvzf knime-latest-linux.gtk.x86_64.tar.gz
# change the directory and move into the extracted folder
cd knime_*/
# run the executable file in the folder
./knime

## VirtualBox
sudo apt install virtualbox -y

## VLC Media Player
sudo apt install vlc -y

## Anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
cd ~/Downloads/
sudo apt install anydesk -y

## Telegram
sudo apt install telegram-desktop -y

## Steam
sudo add-apt-repository multiverse -y
sudo apt install steam -y

## Fritzing
sudo apt install fritzing -y

## gitHub Configurations
cd ~/.ssh
if [ -n "$SSH_FILENAME" ]; then
  ssh-keygen -f $SSH_FILENAME -C $GIT_EMAIL
  # Public name will be saved as $SSH_FILENAME instead of id_rsa
  ssh-add ~/.ssh/$SSH_FILENAME
  echo "Here is your public ssh key: "
  echo "Copy the Github SSH key starting with 'sss-rsa' and ending with '.com'."
  cat $SSH_FILENAME.pub
  # After that go to "Settings > SSH and GPG keys > New SSH key".
  # Give it a unique name and paste the copied Github ssh key here.
fi

touch ~/.gitconfig
echo "
[user]
	email = $GIT_EMAIL
	name = $GIT_NAME_SURNAME
[credential]
	helper = store
[init]
	defaultBranch = main
[pull]
	rebase = false

[diff]
        tool = meld
[core]
        editor = code --wait
[color]
        ui = auto
[alias]
        co = checkout
        br = branch
        st = status
        ci = commit
        lg = log --oneline --graph --all
" > ~/.gitconfig

# Startup Applications
## guake.desktop
echo -e '[Desktop Entry]\nName[tr]=Guake Uçbirim\nName=Guake Terminal\nComment=Use the command line in a Quake-like terminal\nTryExec=guake\nExec=guake\nIcon=guake\nType=Application\nCategories=GNOME;GTK;System;Utility;TerminalEmulator;\nStartupNotify=true\nX-Desktop-File-Install-Version=0.22\nX-GNOME-Autostart-enabled=true\nHidden=false\nNoDisplay=false' > ~/.config/autostart/guake.desktop
## caffeine.desktop
echo -e '[Desktop Entry]\nIcon=caffeine\nName=Caffeine\nComment=Temporarily deactivate the screensaver and sleep mode\nExec=caffeine-indicator\nTerminal=false\nType=Application\nCategories=Utility;\nKeywords=Screensaver,Power,Saving,Blank\nStartupNotify=false' > ~/.config/autostart/caffeine.desktop
## tuxedo-control-center-tray.desktop
echo -e '[Desktop Entry]\nName=TUXEDO Control Center\nComment=Tray icon for TUXEDO Control Center\nExec=/usr/bin/tuxedo-control-center --tray\nHidden=false\nTerminal=false\nType=Application\nIcon=tuxedo-control-center\nCategories=System;TrayIcon' > ~/.config/autostart/tuxedo-control-center-tray.desktop
## ulauncher
echo -e '[Desktop Entry]\nName=Ulauncher\nComment=Application launcher for Linux\nExec=env GDK_BACKEND=x11 /usr/bin/ulauncher --hide-window --hide-window\nIcon=ulauncher\nTerminal=false\nType=Application\nCategories=Utility;Application;' > ~/.config/autostart/ulauncher.desktop

# Favorite Applications
gsettings get org.gnome.shell favorite-apps ['org.gnome.Nautilus.desktop', 'gnome-system-monitor.desktop', 'virtualbox.desktop', 'thunderbird.desktop', 'firefox_firefox.desktop', 'chromium_chromium.desktop', 'telegramdesktop.desktop', 'code.desktop', 'windsurf.desktop', 'zotero.desktop', 'Postman.desktop', 'wps-office-prometheus.desktop', 'org.fritzing.Fritzing.desktop']

# Settings
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
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
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

sudo apt autoremove -y
