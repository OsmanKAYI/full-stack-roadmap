# WordPress CLI Installation Guide

## Installing the `wp-cli` tool

```bash
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Verify it's working
wp --info
```

## Sample WordPress Project Installation with wp-cli

```bash
#!/bin/bash

# Navigate to the installation directory
cd /var/www/html/sitename

# WordPress configuration
wp config create --dbname=wpdb --dbuser=wpuser --dbpass=password --dbhost=localhost --locale=en_US --dbprefix=wp_
wp core install --url="http://localhost" --title="Site Title" --admin_user=admin --admin_password=admin123 --admin_email=admin@example.com

# Theme installation
wp theme install astra --activate

# Plugin installation and activation
wp plugin install polylang --activate
wp plugin install rank-math-seo --activate
wp plugin install envira-gallery-lite --activate
wp plugin install wp-super-cache --activate
wp plugin install smush --activate
wp plugin install wordfence --activate
wp plugin install custom-post-type-ui --activate
wp plugin install advanced-custom-fields --activate
wp plugin install redirection --activate

# Language setting
wp language core install en_US
wp site switch-language en_US

echo "Installation completed."
```

## Key Components

1. **Database Configuration**: Set up the WordPress database connection
2. **Core Installation**: Initialize WordPress with admin credentials
3. **Theme Setup**: Install and activate a theme (Astra in this example)
4. **Essential Plugins**: Install commonly used plugins for:
   - Multilingual support (Polylang)
   - SEO optimization (Rank Math)
   - Gallery management (Envira Gallery)
   - Caching (WP Super Cache)
   - Image optimization (Smush)
   - Security (Wordfence)
   - Custom content types (Custom Post Type UI)
   - Advanced fields (Advanced Custom Fields)
   - URL redirection (Redirection)
5. **Language Configuration**: Set the site's primary language
