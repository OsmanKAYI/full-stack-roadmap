# WordPress Multisite Installation Guide

## What is WordPress Multisite?

WordPress Multisite is a powerful feature that allows you to run and manage multiple WordPress websites from a single WordPress installation. With Multisite, you can create new sites instantly and manage them using the same username and password.

## Advantages of Using WordPress Multisite

1. Manage multiple sites from a single dashboard as the network administrator
2. Each site can have its own admin users who can only manage their respective websites
3. Install plugins/themes and activate them for multiple sites with one download
4. Easier update management - you only need to update WordPress, plugins, or themes on one "master" installation

## Disadvantages of Using WordPress Multisite

1. All sites share the same resources - if the network goes down, all sites go down
2. Traffic and server resource management can be challenging for beginners
3. Security vulnerabilities - if one site gets hacked, all sites on the network may be affected
4. Some WordPress plugins may not work properly on a multisite network
5. Not all hosting providers adequately support WordPress multisite

## WordPress Multisite Installation Steps

### 1. Requirements

- A working WordPress installation
- Access to edit `wp-config.php` and `.htaccess` files
- PHP and MySQL that meet WordPress requirements

### 2. Enable Multisite Feature

- Edit the `wp-config.php` file and add the following code before the line that says "That's all, stop editing! Happy publishing."

```php
/* Multisite */
define( 'WP_ALLOW_MULTISITE', true );
```

- You can enable WordPress Multisite in a single command using this bash script:

```bash
sed -i "/\/* That's all, stop editing! Happy publishing. \*\//i \
\/* Multisite *\/\ndefine( 'WP_ALLOW_MULTISITE', true );\n" /path/to/wordpress/wp-config.php
```

- Just replace `/path/to/wordpress/` with your actual WordPress installation path.

### 3. Complete Multisite Network Setup

1. Log in to your WordPress admin panel
2. Go to Tools > Network Setup
3. Choose your network structure:
   - Subdomains: site1.example.com
   - Subdirectories: example.com/site1/
4. Enter a title for your network
5. Verify your admin email address
6. Click the "Install" button

### 4. Update Configuration Files

After completing the Network Setup, WordPress will provide you with code snippets to add to your `wp-config.php` and `.htaccess` files.

#### For `wp-config.php`

Add the provided code to your `wp-config.php` file after the line you added in step 2.

**For Subdirectory Installation:**

```php
define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', false); // false for subdirectories
define('DOMAIN_CURRENT_SITE', 'example.com'); // Change to your domain
define('PATH_CURRENT_SITE', '/'); // Change if WordPress is in a subdirectory
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);
define('COOKIE_DOMAIN', false); // Recommended for local development
```

**For Subdomain Installation:**

```php
define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', true); // true for subdomains
define('DOMAIN_CURRENT_SITE', 'example.com'); // Change to your domain
define('PATH_CURRENT_SITE', '/'); // Change if WordPress is in a subdirectory
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);
define('COOKIE_DOMAIN', false); // Recommended for local development
```

- You can add all multisite settings to your `wp-config.php` file in a single command using this bash script:

**For Subdirectory Installation:**

```bash
sed -i "/\/\* That's all, stop editing! Happy publishing. \*\//i \
\/\* Multisite \*\/\ndefine('WP_ALLOW_MULTISITE', true);\n\n\/\* Multisite Network Configuration \*\/\ndefine('MULTISITE', true);\ndefine('SUBDOMAIN_INSTALL', false);\ndefine('DOMAIN_CURRENT_SITE', 'example.com');\ndefine('PATH_CURRENT_SITE', '\/');\ndefine('SITE_ID_CURRENT_SITE', 1);\ndefine('BLOG_ID_CURRENT_SITE', 1);\ndefine('COOKIE_DOMAIN', false);\n" /path/to/wordpress/wp-config.php
```

**For Subdomain Installation:**

```bash
sed -i "/\/\* That's all, stop editing! Happy publishing. \*\//i \
\/\* Multisite \*\/\ndefine('WP_ALLOW_MULTISITE', true);\n\n\/\* Multisite Network Configuration \*\/\ndefine('MULTISITE', true);\ndefine('SUBDOMAIN_INSTALL', true);\ndefine('DOMAIN_CURRENT_SITE', 'example.com');\ndefine('PATH_CURRENT_SITE', '\/');\ndefine('SITE_ID_CURRENT_SITE', 1);\ndefine('BLOG_ID_CURRENT_SITE', 1);\ndefine('COOKIE_DOMAIN', false);\n" /path/to/wordpress/wp-config.php
```

- Make sure to replace `/path/to/wordpress/` with your actual WordPress installation path and adjust the domain and path settings according to your environment.

#### For `.htaccess`

- Replace the existing WordPress rules in your `.htaccess` file with the code provided by WordPress.

**For Subdirectory Installation:**

```apache
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On

RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase SITE_PATH_PLACEHOLDER
RewriteRule ^index\.php$ - [L]

# uploaded files for multisite (critical!)
RewriteRule ^([_0-9a-zA-Z-]+/)?files/(.+) SITE_PATH_PLACEHOLDERwp-includes/ms-files.php?file=$2 [L]

# add a trailing slash to /wp-admin
RewriteRule ^([_0-9a-zA-Z-]+/)?wp-admin$ $1wp-admin/ [R=301,L]

RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

RewriteRule ^([_0-9a-zA-Z-]+/)?(wp-(content|admin|includes).*) $2 [L]

RewriteRule ^([_0-9a-zA-Z-]+/)?(.*\.php)$ $2 [L]

RewriteRule . index.php [L]
</IfModule>
# END WordPress
```

**For Subdomain Installation:**

```apache
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On

RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase SITE_PATH_PLACEHOLDER
RewriteRule ^index\.php$ - [L]

# add a trailing slash to /wp-admin
RewriteRule ^wp-admin$ wp-admin/ [R=301,L]

# uploaded files for multisite (critical!)
RewriteRule ^([_0-9a-zA-Z-]+/)?files/(.+) SITE_PATH_PLACEHOLDERwp-includes/ms-files.php?file=$2 [L]

RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

RewriteRule ^(wp-(content|admin|includes).*) $1 [L]

RewriteRule ^(.*\.php)$ $1 [L]

RewriteRule . index.php [L]
</IfModule>
# END WordPress
```

- You can update your `.htaccess` file in a single command using this bash script:

**For Subdirectory Installation:**

```bash
sudo bash -c 'cat > /path/to/wordpress/.htaccess << "EOL"
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On

RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase SITE_PATH_PLACEHOLDER
RewriteRule ^index\.php$ - [L]

# uploaded files for multisite (critical!)
RewriteRule ^([_0-9a-zA-Z-]+/)?files/(.+) SITE_PATH_PLACEHOLDERwp-includes/ms-files.php?file=$2 [L]

# add a trailing slash to /wp-admin
RewriteRule ^([_0-9a-zA-Z-]+/)?wp-admin$ $1wp-admin/ [R=301,L]

RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

RewriteRule ^([_0-9a-zA-Z-]+/)?(wp-(content|admin|includes).*) $2 [L]

RewriteRule ^([_0-9a-zA-Z-]+/)?(.*\.php)$ $2 [L]

RewriteRule . index.php [L]
</IfModule>
# END WordPress
EOL'
```

**For Subdomain Installation:**

```bash
sudo bash -c 'cat > /path/to/wordpress/.htaccess << "EOL"
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On

RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase SITE_PATH_PLACEHOLDER
RewriteRule ^index\.php$ - [L]

# add a trailing slash to /wp-admin
RewriteRule ^wp-admin$ wp-admin/ [R=301,L]

# uploaded files for multisite (critical!)
RewriteRule ^([_0-9a-zA-Z-]+/)?files/(.+) SITE_PATH_PLACEHOLDERwp-includes/ms-files.php?file=$2 [L]

RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

RewriteRule ^(wp-(content|admin|includes).*) $1 [L]

RewriteRule ^(.*\.php)$ $1 [L]

RewriteRule . index.php [L]
</IfModule>
# END WordPress
EOL'
```

- **Note:** This command will prompt you for your sudo password. Also, we're writing the `.htaccess` file in the main WordPress directory, because for Multisite you need to modify the `.htaccess` in the main directory, not in the plugins directory.

- Just replace `/path/to/wordpress/` with your actual WordPress installation path.

**If WordPress is installed in a subdirectory:**

If WordPress is installed in a subdirectory (e.g., `/blog/` or `/wordpress/`), you need to update the `RewriteBase` value in the `.htaccess` file accordingly:

```apache
RewriteBase /wordpress/
```

### 5. Log Back In

After updating the configuration files, log out and log back in to your WordPress admin panel.

### 6. Network Administration

1. After logging back in, you'll see a new "My Sites" menu in the admin toolbar
2. Go to My Sites > Network Admin to access the network dashboard
3. From here, you can manage network settings, add new sites, and configure themes and plugins

### 7. Adding New Sites

1. Go to My Sites > Network Admin > Sites
2. Click the "Add New" button
3. Enter the site address, title, and admin email
4. Click "Add Site"

### 8. Managing Themes and Plugins

1. Go to My Sites > Network Admin > Themes or Plugins
2. Install themes or plugins as you normally would
3. Use the "Network Enable" option to make themes or plugins available to all sites

## Setting Up Wildcard Subdomains (For Subdomain Installation)

If you chose the subdomain option, you'll need to set up wildcard subdomains on your server:

### For Apache

1. Make sure the Apache module `mod_rewrite` is enabled:

```bash
sudo a2enmod rewrite
sudo systemctl restart apache2
```

2. Configure your virtual host to allow wildcard subdomains:

```apache
<VirtualHost *:80>
    ServerName example.com
    ServerAlias *.example.com
    DocumentRoot /var/www/html/wordpress

    <Directory /var/www/html/wordpress>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

### For Local Development

1. For local development, you'll need to modify your hosts file:

```bash
# On Linux/Mac
sudo nano /etc/hosts

# Add these lines
127.0.0.1   example.test
127.0.0.1   site1.example.test
127.0.0.1   site2.example.test
```

2. Or use a tool like dnsmasq to handle wildcard subdomains automatically:

```bash
# Install dnsmasq
sudo apt-get install dnsmasq

# Configure dnsmasq
sudo nano /etc/dnsmasq.conf

# Add this line
address=/.example.test/127.0.0.1

# Restart dnsmasq
sudo systemctl restart dnsmasq
```

## Using Custom Domains for Each Site

WordPress multisite also allows you to set different domains for each website in your network using domain mapping:

1. Install a domain mapping plugin like "WordPress MU Domain Mapping"
2. Add the necessary DNS records for each domain to point to your server
3. Map domains to specific sites in your network through the plugin settings

## Troubleshooting

### Common Issues and Solutions

#### 404 Errors on Subsite Pages

- Ensure your `.htaccess` file is properly configured
- Check that the `RewriteBase` value matches your WordPress installation path
- Verify that `mod_rewrite` is enabled on your server

```bash
sudo a2enmod rewrite
sudo systemctl restart apache2
```

#### Redirect Loop or Improper Redirects

- Check the `wp-admin` rewrite rule in your `.htaccess` file
- For subdirectory installations, make sure you're using:

```apache
RewriteRule ^([_0-9a-zA-Z-]+/)?wp-admin$ $1wp-admin/ [R=301,L]
```

- For subdomain installations, make sure you're using:

```apache
RewriteRule ^wp-admin$ wp-admin/ [R=301,L]
```

#### Network Admin Not Accessible

- Verify that the multisite code in `wp-config.php` is correct
- Check that `SUBDOMAIN_INSTALL` is set to the correct value (true for subdomains, false for subdirectories)
- Make sure `DOMAIN_CURRENT_SITE` and `PATH_CURRENT_SITE` are set correctly

#### Permission Issues

- Check file and directory permissions
- WordPress files should typically be 644 and directories 755

```bash
find /path/to/wordpress -type f -exec chmod 644 {} \;
find /path/to/wordpress -type d -exec chmod 755 {} \;
chmod 600 /path/to/wordpress/wp-config.php
```

## Local Development Considerations

When developing a WordPress Multisite locally:

1. Use a local development environment like XAMPP, MAMP, Local by Flywheel, or Docker
2. For subdirectory installations, no special configuration is needed
3. For subdomain installations, you'll need to configure your hosts file or use a tool that supports wildcard subdomains
4. Consider using a .local or .test TLD for local development
5. Set `COOKIE_DOMAIN` to false in your `wp-config.php` file to avoid cookie issues

**NOTE:** You can use the [wp.multisite.sh](./wp.multisite.sh) script to automate the WordPress Multisite setup process. This script will automatically convert your WordPress installation to a multisite configuration.
