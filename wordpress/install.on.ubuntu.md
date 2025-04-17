# WordPress Installation Steps on Ubuntu 22.04

## 1. Download and Extract WordPress

- Download the latest Turkish WordPress package:

```bash
wget https://tr.wordpress.org/latest-tr_TR.zip
```

- Extract the WordPress files and remove the zip:

```bash
unzip latest-tr_TR.zip
rm -rf latest-tr_TR.zip
```

## 2. Set Up Web Directory

- Move WordPress to Apache's web directory:

```bash
mv wordpress/ /var/www/html/
cd /var/www/html/wordpress/
```

## 3. Configure Apache

- Enable URL rewriting and restart Apache:

```bash
sudo a2enmod rewrite
sudo systemctl restart apache2
```

## 4. Set File Permissions

- Configure proper ownership and permissions:

```bash
sudo chown -R $USER:www-data wordpress/
sudo usermod -aG www-data $USER
sudo chown -R www-data:www-data wp-content/
```

These steps will install and configure WordPress with proper permissions on your Ubuntu 22.04 system.
