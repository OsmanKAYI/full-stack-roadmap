# SETUP LINUX FOR PHP CLASS

## update & upgrade & autoremove & snap refresh
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh

## set timezone as Istanbul
sudo timedatectl set-timezone Europe/Istanbul
## choose timezone manually: sudo dpkg-reconfigure tzdata
## setup auxiliary packages
sudo apt-get install ntp ntpdate -y
## setup NTP server
sudo ntpdate ntp.ubuntu.com
## get timezone and current time
timedatectl status
## set keyboard settings for Türkçe
setxkbmap tr

## visual studio code
sudo rm /etc/apt/sources.list.d/vscode.list
sudo rm /usr/share/keyrings/vscode.gpg
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
### install extesions
wget https://raw.githubusercontent.com/OsmanKAYI/full-stack-roadmap/main/vscode/extensions.php.sh -O - | sh

## apache
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
## apache configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/

## to install old versions of php
sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https
LC_ALL=C.UTF-8
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt upgrade

## php
sudo apt install php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-xml libapache2-mod-php7.4 -y
sudo service apache2 restart

## mysql
sudo apt install mariadb-server mariadb-client -y
sudo systemctl enable mariadb
sudo service mariadb restart
### sudo mysql_secure_installation
## mysql password reset
mysql --user="root" --password="" --execute="use mysql; SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root'); flush privileges;"

## restart services
sudo service apache2 restart
sudo service mariadb restart
sudo systemctl enable mariadb
sudo systemctl enable apache2

## html configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
cd ~
cd ~/Desktop
ln -s /var/www/html/
sudo rm -f /var/www/html/index.html

## adminer
cd /var/www/html
mkdir adminer
cd adminer
wget -O index.php https://www.adminer.org/latest.php

sudo apt autoremove -y