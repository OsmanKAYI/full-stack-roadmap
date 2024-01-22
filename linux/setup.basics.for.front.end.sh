# Setup Basics for Front-End Developer on Linux

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
sudo apt install vim   pdftk meld xclip axel gnome-tweaks net-tools hardinfo gpustat nvtop  unrar caffeine magic-wormhole  pv -y

## TLDR
sudo apt install tldr -y
tldr -u

## GNOME Sushi

sudo apt install gnome-sushi -y

## Visual Studio Code
sudo apt install software-properties-common apt-transport-https wget -y
wget -O vscode.gpg https://packages.microsoft.com/keys/microsoft.asc
sudo gpg --dearmor -o /usr/share/keyrings/vscode.gpg vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y

## Git
sudo apt-get install git -y
git config --global user.email "fatmaakman@gmail.com"
git config --global user.name "seymaakman"

#### GitHub Configurations
cd ~/.ssh
ssh-keygen -o -t rsa -C "fatmaakman@gmail.com"
# Public name will be saved as seyma instead of id_rsa
ssh-add ~/.ssh/seyma
cat seyma.pub
# Copy the Github SSh key starting with "sss-rsa" and ending with ".com".
# After that go to "Settings > SSH and GPG keys > New SSH key".
# Give it a unique name and paste the copied Github ssh key here.

## Apache
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart

#### Apache Configurations
sudo adduser seyma www-data
sudo chown -R seyma:www-data /var/www/html/

##### Restart Apache Service
sudo systemctl restart apache2

## html Configurations
sudo adduser seyma www-data
sudo chown -R seyma:www-data /var/www/html/
cd ~
cd ~/Desktop
ln -s /var/www/html/
sudo rm -f /var/www/html/index.html

## VLC Media Player
sudo apt install vlc -y
