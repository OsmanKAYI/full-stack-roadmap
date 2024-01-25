clear

## cOLORS
## cOLORS
## cOLORS
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
echo -e -n "Enter your ${LIGHTCYAN}name${NC} and ${LIGHTCYAN}surname${NC}: "
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

# SETUP NECESSARY FEATURES ON LINUX

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

## Check Drivers
sudo ubuntu-drivers autoinstall

## Desktop Configurations
# to set the position of the dock to the left
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
# to minimize/extend all windows of a folder/program with one click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# to switch between windows of a folder/program with mouse rolling
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

## Guake
sudo apt-get install guake -y

## Necessary Packages
sudo apt install vim ranger bat pdftk meld xclip axel gnome-tweaks net-tools hardinfo gpustat nvtop testdisk unrar caffeine magic-wormhole hashcat pv -y

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
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "sh -c 'gnome-screenshot -af ~/Pictures/$(date "+%Y.%m.%d-%H.%M.%S").png'"
# add the custom shortcut to the list of custom shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[ '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/' ]"
# add the necessary permissions to the custom shortcut
sudo chmod ugo+rwx /home/$USER/Pictures/*

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
# add Mozilla PPA
sudo add-apt-repository -y ppa:mozillateam/ppa
# create preferences file for apt
PREFERENCES=$(cat <<EOF
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001

Package: firefox
Pin: version 1:1snap1-0ubuntu2
Pin-Priority: -1
EOF
)
echo "$PREFERENCES" | sudo tee /etc/apt/preferences.d/mozilla-firefox
# remove existing Firefox Snap package
sudo snap remove firefox
# configure unattended-upgrades for the Mozilla PPA
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
# install Firefox from the PPA
sudo apt update
sudo apt install firefox -y

## Chromium
sudo apt install chromium-browser -y

## Cockpit
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit

## Visual Studio Code
sudo apt install software-properties-common apt-transport-https wget -y
wget -O vscode.gpg https://packages.microsoft.com/keys/microsoft.asc
sudo gpg --dearmor -o /usr/share/keyrings/vscode.gpg vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
# install extesions
wget https://raw.githubusercontent.com/OsmanKAYI/full-stack-roadmap/main/vscode/extensions.sh -O - | sh

## WPS Office
# dive into download directory (since it downloads to 'Downloads/' folder)
cd ~/Downloads/
# install downloaded file
sudo apt install ./wps-office_*_amd64.deb
# press 'OK' and 'YES', one after another

## Notion
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app

## Git
sudo apt-get install git -y
git config --global user.email "GIT_EMAIL"
git config --global user.name "GIT_USERNAME"

## Apache
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
## apache Configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/

## PHP
sudo apt install php
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
sudo apt install autokey-gtk

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
sudo apt install telegram-desktop

## Steam
sudo add-apt-repository multiverse
sudo apt install steam -y

## Sweet Home 3D
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.sweethome3d.Sweethome3d -y
flatpak update com.sweethome3d.Sweethome3d
sudo apt install sweethome3d -y

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