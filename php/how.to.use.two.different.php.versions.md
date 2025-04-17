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

- In this case, versions 7.4 and 8.3 are installed and version 7.4 is setup as current version. It could be reversed.

```bash
# install php7.4 with common packages
sudo apt install php7.4-xdebug php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-xml libapache2-mod-php7.4 -y

# install php8.3 with common packages
sudo apt install php8.3-xdebug php8.3-fpm php8.3-intl php8.3-imagick php8.3-dev php8.3-zip php8.3-curl php8.3-xmlrpc php8.3-sqlite3 php8.3-gd php8.3-mysql php8.3-mbstring php8.3-xml libapache2-mod-php8.3 -y

# enable rewrite module
sudo a2enmod rewrite

# disable php8.3
sudo a2dismod php8.3

# enable php7.4
sudo a2enmod php7.4

# restart apache
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

### To Select PHP Version from Installed Versions

```bash
sudo update-alternatives --config php
php -v # will give you the selected php version
```

### To Select PHP Version Directly

```bash
sudo update-alternatives --set php /usr/bin/php7.4
php -v # will give you the version 7.4
```

## Summary

- To activate PHP 7.4,

```bash
sudo a2dismod php8.3;sudo a2dismod php7.4;sudo service apache2 restart;sudo a2enmod php7.4;sudo service apache2 restart;sudo update-alternatives --set php /usr/bin/php7.4;sudo service apache2 restart
```

- To activate PHP 8.3,

```bash
sudo a2dismod php8.3;sudo a2dismod php7.4;sudo service apache2 restart;sudo a2enmod php8.3;sudo service apache2 restart;sudo update-alternatives --set php /usr/bin/php8.3;sudo service apache2 restart
```
