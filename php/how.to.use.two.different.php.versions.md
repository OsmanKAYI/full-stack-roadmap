# How To Use Two Different PHP Versions Interchangeably

## PHP Installation for Different Versions

```bash
sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https
LC_ALL=C.UTF-8
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt upgrade
```

## Setup and Use Two Different PHP Versions

- In this case, versions 7.4 and 8.1 are installed and version 7.4 is setup as current version. It could be reversed.

```bash
sudo apt install php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-xml libapache2-mod-php7.4 -y

sudo apt install php8.1-fpm php8.1-intl php8.1-imagick php8.1-dev php8.1-zip php8.1-curl php8.1-xmlrpc php8.1-sqlite3 php8.1-gd php8.1-mysql php8.1-mbstring php8.1-xml libapache2-mod-php8.1 -y

sudo a2dismod php8.1

sudo a2enmod php7.4

sudo service apache2 restart
```

## List installed PHP versions

```sh
# Check the currently active PHP version
php -v

# List PHP versions with alternatives:
sudo update-alternatives --display php

# List installed PHP versions and their directories
ls /usr/bin/php*

# List installed PHP packages with apt
dpkg --get-selections | grep php
```

## CLI Configuration for PHP Version

```bash
sudo update-alternatives --config php
sudo update-alternatives --set php /usr/bin/php7.4
```
