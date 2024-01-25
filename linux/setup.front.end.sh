clear

#### COLORS
#### COLORS
#### COLORS
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

echo "Please fulfill the instructions for GIT"
echo ""

echo -e -n "Enter your ${LIGHTCYAN}name${NC} and ${LIGHTCYAN}surname${NC}: "
read GIT_NAME_SURNAME

echo -e -n "Enter your ${LIGHTCYAN}git email${NC}: "
read GIT_EMAIL

echo -e -n "Enter your ${LIGHTCYAN}filename${NC} for ~/.ssh/: "
read SSH_FILENAME

echo ""
echo ""
echo -e  "$LIGHTGREEN !!! INSTALLATION STARTED !!! $NC"
echo ""

# SETUP BASICS FOR FRONT-END DEVELOPER ON LINUX

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
sudo apt install vim pdftk meld xclip axel gnome-tweaks net-tools hardinfo gpustat nvtop unrar caffeine magic-wormhole pv -y

## TLDR
sudo apt install tldr -y
tldr -u

## GNOME Sushi
sudo apt install gnome-sushi -y

## GNOME Screenshot
sudo apt install gnome-screenshot xclip -y
### Set up custom shortcut for taking screenshots with Windows key + Shift + S
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot '<Super><Shift>s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Take a Screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super><Shift>s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "sh -c 'gnome-screenshot -af ~/Pictures/$(date "+%Y.%m.%d-%H.%M.%S").png'"
### Add the custom shortcut to the list of custom shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[ '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/' ]"
### Add the necessary permissions to the custom shortcut
sudo chmod ugo+rwx /home/$USER/Pictures/*

## Firefox
### Add Mozilla PPA
sudo add-apt-repository -y ppa:mozillateam/ppa
### Create preferences file for apt
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
### Remove existing Firefox Snap package
sudo snap remove firefox
### Configure unattended-upgrades for the Mozilla PPA
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
### Install Firefox from the PPA
sudo apt update
sudo apt install firefox -y

## Visual Studio Code
sudo apt install software-properties-common apt-transport-https wget -y
wget -O vscode.gpg https://packages.microsoft.com/keys/microsoft.asc
sudo gpg --dearmor -o /usr/share/keyrings/vscode.gpg vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
bash ../vscode/extensions.front.end.sh

## Git
sudo apt-get install git -y
if [ -n "$GIT_EMAIL" ]; then
  git config --global user.email $GIT_EMAIL
fi
if [ -n "$GIT_NAME_SURNAME" ]; then
  git config --global user.name $GIT_NAME_SURNAME
fi

## Apache
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
#### Apache Configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
##### Restart Apache Service
sudo systemctl restart apache2

## html Configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
cd ~/Desktop
ln -s /var/www/html/
sudo rm -f /var/www/html/index.html

## VLC Media Player
sudo apt install vlc -y

#### GitHub Configurations
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