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
sudo apt install software-properties-common apt-transport-https wget -y
wget -O vscode.gpg https://packages.microsoft.com/keys/microsoft.asc
sudo gpg --dearmor -o /usr/share/keyrings/vscode.gpg vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
### install extesions
bash ../vscode/extensions.php.sh

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
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt upgrade

## php
sudo apt install php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-xml libapache2-mod-php7.4 -y
sudo service apache2 restart

## mysql
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
## mysql password reset
mysql --user="root" --password="" --execute="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');"

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