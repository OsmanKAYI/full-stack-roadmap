#!/bin/bash

# WordPress Multisite Complete Setup Script
# This script automates the entire WordPress Multisite setup process including database tables creation

echo "========================================"
echo "WordPress Multisite Complete Setup Script"
echo "========================================"
echo ""

# Check if parameters are passed
if [ $# -ge 1 ]; then
    WP_DIR="$1"
    echo "Using WordPress directory: $WP_DIR"
    
    # If domain is passed as parameter
    if [ $# -ge 2 ]; then
        DOMAIN="$2"
        echo "Using domain: $DOMAIN"
    fi
    
    # If site path is passed as parameter
    if [ $# -ge 3 ]; then
        SITE_PATH="$3"
        echo "Using site path: $SITE_PATH"
    fi
    
    # If admin username is passed as parameter
    if [ $# -ge 4 ]; then
        ADMIN_USERNAME="$4"
        echo "Using admin username: $ADMIN_USERNAME"
    fi
    
    # If admin email is passed as parameter
    if [ $# -ge 5 ]; then
        ADMIN_EMAIL="$5"
        echo "Using admin email: $ADMIN_EMAIL"
    fi
else
    # Ask for WordPress directory path if not provided as parameter
    read -p "Enter your WordPress installation path (e.g., /var/www/html/wordpress): " WP_DIR
fi

# Validate if the directory exists
if [ ! -d "$WP_DIR" ]; then
    echo "Error: Directory $WP_DIR does not exist."
    exit 1
fi

# Check if wp-config.php exists
if [ ! -f "$WP_DIR/wp-config.php" ]; then
    echo "Error: wp-config.php not found in $WP_DIR."
    echo "Please make sure WordPress is properly installed."
    exit 1
fi

echo "\nWordPress installation found at $WP_DIR"

# Get database credentials from wp-config.php
DB_NAME=$(grep DB_NAME "$WP_DIR/wp-config.php" | cut -d "'" -f 4)
DB_USER=$(grep DB_USER "$WP_DIR/wp-config.php" | cut -d "'" -f 4)
DB_PASSWORD=$(grep DB_PASSWORD "$WP_DIR/wp-config.php" | cut -d "'" -f 4)
DB_HOST=$(grep DB_HOST "$WP_DIR/wp-config.php" | cut -d "'" -f 4)
TABLE_PREFIX=$(grep table_prefix "$WP_DIR/wp-config.php" | cut -d "'" -f 2)

echo "Database Name: $DB_NAME"
echo "Table Prefix: $TABLE_PREFIX"

# Ask for domain information if not provided as parameter
if [ -z "$DOMAIN" ]; then
    read -p "Enter your domain (e.g., localhost or example.com): " DOMAIN
fi

# Ask for site path if not provided as parameter
if [ -z "$SITE_PATH" ]; then
    read -p "Enter your site path (e.g., /wordpress/ or / for root): " SITE_PATH
fi
# Ensure the path starts and ends with a slash
if [[ $SITE_PATH != /* ]]; then
    SITE_PATH="/$SITE_PATH"
fi
if [[ $SITE_PATH != */ ]]; then
    SITE_PATH="${SITE_PATH}/"
fi

# Ask for subdomain or subdirectory
echo "\nChoose your network structure:"
echo "1) Subdirectories (example.com/site1)"
echo "2) Subdomains (site1.example.com)"
read -p "Enter your choice (1 or 2): " NETWORK_TYPE

if [ "$NETWORK_TYPE" == "1" ]; then
    SUBDOMAIN_INSTALL="false"
    echo "\nYou selected subdirectory installation."
else
    SUBDOMAIN_INSTALL="true"
    echo "\nYou selected subdomain installation."
    echo "Note: You'll need to configure wildcard subdomains on your server."
fi

# Backup wp-config.php
echo "\nBacking up wp-config.php..."
cp "$WP_DIR/wp-config.php" "$WP_DIR/wp-config.php.backup-$(date +%Y%m%d%H%M%S)"
echo "Backup created."

# Step 1: Add all Multisite configurations at once
echo "\nStep 1: Adding all WordPress Multisite configurations..."

# Remove existing Multisite configurations if they exist
if grep -q "WP_ALLOW_MULTISITE" "$WP_DIR/wp-config.php" || grep -q "MULTISITE" "$WP_DIR/wp-config.php"; then
    echo "Removing existing Multisite configurations..."
    sed -i '/\/\* Multisite \*\//,/WP_ALLOW_MULTISITE/d' "$WP_DIR/wp-config.php"
    sed -i '/\/\* Multisite Network Configuration \*\//,/BLOG_ID_CURRENT_SITE/d' "$WP_DIR/wp-config.php"
    sed -i '/COOKIE_DOMAIN/d' "$WP_DIR/wp-config.php"
    echo "Existing Multisite configurations removed."
fi

# Add all Multisite configurations at once
echo "Adding all Multisite configurations..."
sed -i "/\/\* That's all, stop editing! Happy publishing. \*\//i \
\/\* Multisite \*\/\ndefine('WP_ALLOW_MULTISITE', true);\n\n\/\* Multisite Network Configuration \*\/\ndefine('MULTISITE', true);\ndefine('SUBDOMAIN_INSTALL', $SUBDOMAIN_INSTALL);\ndefine('DOMAIN_CURRENT_SITE', '$DOMAIN');\ndefine('PATH_CURRENT_SITE', '$SITE_PATH');\ndefine('SITE_ID_CURRENT_SITE', 1);\ndefine('BLOG_ID_CURRENT_SITE', 1);\ndefine('COOKIE_DOMAIN', false);\n" "$WP_DIR/wp-config.php"
echo "All Multisite configurations added to wp-config.php."

# Step 2: Create .htaccess file
echo "\nStep 2: Creating .htaccess file..."

# Backup existing .htaccess if it exists
if [ -f "$WP_DIR/.htaccess" ]; then
    cp "$WP_DIR/.htaccess" "$WP_DIR/.htaccess.backup-$(date +%Y%m%d%H%M%S)"
    echo "Existing .htaccess backed up."
fi

# Create new .htaccess with appropriate rules
if [ "$SUBDOMAIN_INSTALL" == "true" ]; then
    # Subdomain rules
    cat > "$WP_DIR/.htaccess" << 'EOL'
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase SITE_PATH_PLACEHOLDER
RewriteRule ^index\.php$ - [L]

# add a trailing slash to /wp-admin
RewriteRule ^wp-admin$ wp-admin/ [R=301,L]

RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]
RewriteRule ^(wp-(content|admin|includes).*) $1 [L]
RewriteRule ^(.*\.php)$ $1 [L]
RewriteRule . index.php [L]
</IfModule>
# END WordPress
EOL
    # Replace placeholder with actual site path
    sed -i "s|SITE_PATH_PLACEHOLDER|$SITE_PATH|g" "$WP_DIR/.htaccess"
else
    # Subdirectory rules
    cat > "$WP_DIR/.htaccess" << 'EOL'
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase SITE_PATH_PLACEHOLDER
RewriteRule ^index\.php$ - [L]

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
EOL
    # Replace placeholder with actual site path
    sed -i "s|SITE_PATH_PLACEHOLDER|$SITE_PATH|g" "$WP_DIR/.htaccess"
fi

echo ".htaccess file created with appropriate rewrite rules."

# Step 3: Create multisite database tables
echo "\nStep 3: Creating multisite database tables..."

# Create SQL file for multisite tables
cat > /tmp/multisite-tables.sql << EOL
CREATE TABLE IF NOT EXISTS ${TABLE_PREFIX}blogs (
  blog_id bigint(20) NOT NULL auto_increment,
  site_id bigint(20) NOT NULL default '0',
  domain varchar(200) NOT NULL default '',
  path varchar(100) NOT NULL default '',
  registered datetime NOT NULL default '0000-00-00 00:00:00',
  last_updated datetime NOT NULL default '0000-00-00 00:00:00',
  public tinyint(2) NOT NULL default '1',
  archived tinyint(2) NOT NULL default '0',
  mature tinyint(2) NOT NULL default '0',
  spam tinyint(2) NOT NULL default '0',
  deleted tinyint(2) NOT NULL default '0',
  lang_id int(11) NOT NULL default '0',
  PRIMARY KEY  (blog_id),
  KEY domain (domain(50),path(5)),
  KEY lang_id (lang_id)
);

CREATE TABLE IF NOT EXISTS ${TABLE_PREFIX}blogmeta (
  meta_id bigint(20) NOT NULL auto_increment,
  blog_id bigint(20) NOT NULL default '0',
  meta_key varchar(255) default NULL,
  meta_value longtext,
  PRIMARY KEY  (meta_id),
  KEY meta_key (meta_key(191)),
  KEY blog_id (blog_id)
);

CREATE TABLE IF NOT EXISTS ${TABLE_PREFIX}registration_log (
  ID bigint(20) NOT NULL auto_increment,
  email varchar(255) NOT NULL default '',
  IP varchar(30) NOT NULL default '',
  blog_id bigint(20) NOT NULL default '0',
  date_registered datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (ID),
  KEY IP (IP)
);

CREATE TABLE IF NOT EXISTS ${TABLE_PREFIX}site (
  id bigint(20) NOT NULL auto_increment,
  domain varchar(200) NOT NULL default '',
  path varchar(100) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY domain (domain,path)
);

CREATE TABLE IF NOT EXISTS ${TABLE_PREFIX}sitemeta (
  meta_id bigint(20) NOT NULL auto_increment,
  site_id bigint(20) NOT NULL default '0',
  meta_key varchar(255) default NULL,
  meta_value longtext,
  PRIMARY KEY  (meta_id),
  KEY meta_key (meta_key(191)),
  KEY site_id (site_id)
);

CREATE TABLE IF NOT EXISTS ${TABLE_PREFIX}signups (
  signup_id bigint(20) NOT NULL auto_increment,
  domain varchar(200) NOT NULL default '',
  path varchar(100) NOT NULL default '',
  title longtext NOT NULL,
  user_login varchar(60) NOT NULL default '',
  user_email varchar(100) NOT NULL default '',
  registered datetime NOT NULL default '0000-00-00 00:00:00',
  activated datetime NOT NULL default '0000-00-00 00:00:00',
  active tinyint(1) NOT NULL default '0',
  activation_key varchar(50) NOT NULL default '',
  meta longtext,
  PRIMARY KEY  (signup_id),
  KEY activation_key (activation_key),
  KEY user_email (user_email),
  KEY user_login_email (user_login,user_email),
  KEY domain_path (domain,path)
);

-- Insert initial site record
INSERT INTO ${TABLE_PREFIX}site (id, domain, path) VALUES (1, '$DOMAIN', '$SITE_PATH');

-- Insert initial sitemeta records
INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'site_name', 'WordPress Network');
INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'admin_email', '${ADMIN_EMAIL:-admin@example.com}');
INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'admin_user_id', '1');
INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'registration', 'none');
INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'upload_filetypes', 'jpg jpeg png gif webp');
INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'blog_upload_space', '100');
INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'fileupload_maxk', '1500');

-- Insert initial blog record for main site
INSERT INTO ${TABLE_PREFIX}blogs (blog_id, site_id, domain, path, registered, last_updated, public) VALUES (1, 1, '$DOMAIN', '$SITE_PATH', NOW(), NOW(), 1);

-- Add network active plugins option
INSERT INTO ${TABLE_PREFIX}options (option_name, option_value, autoload) VALUES ('active_sitewide_plugins', 'a:0:{}', 'yes') ON DUPLICATE KEY UPDATE option_value = 'a:0:{}';

-- Add network plugins option
INSERT INTO ${TABLE_PREFIX}options (option_name, option_value, autoload) VALUES ('network_active_plugins', 'a:0:{}', 'yes') ON DUPLICATE KEY UPDATE option_value = 'a:0:{}';

-- Set site admins in sitemeta
EOL

# Execute SQL file first to create the tables
echo "Executing SQL commands..."
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" < /tmp/multisite-tables.sql

# Now that tables exist, update site_admins
if [ ! -z "$ADMIN_USER" ]; then
    ADMIN_USER_LENGTH="$(echo -n "$ADMIN_USER" | wc -c)"
    echo "Configuring site_admins with username: $ADMIN_USER (length: $ADMIN_USER_LENGTH)"
    
    # Update site_admins directly in the database
    mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "DELETE FROM ${TABLE_PREFIX}sitemeta WHERE meta_key = 'site_admins';"
    mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'site_admins', 'a:1:{i:0;s:$ADMIN_USER_LENGTH:\"$ADMIN_USER\";}');"
fi

if [ $? -eq 0 ]; then
    echo "Multisite database tables created successfully."
else
    echo "Error: Failed to create multisite database tables."
    exit 1
fi

# Step 4: Set up super admin user
echo "\nStep 4: Setting up super admin user..."

# Get the current admin username from the database or use the provided one
if [ -z "$ADMIN_USERNAME" ]; then
    ADMIN_USER=$(mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "SELECT user_login FROM ${TABLE_PREFIX}users WHERE ID = 1;" --skip-column-names)
    
    if [ -z "$ADMIN_USER" ]; then
        echo "Warning: Could not find admin user. Using 'admin' as default."
        ADMIN_USER="admin"
    fi
else
    ADMIN_USER="$ADMIN_USERNAME"
fi

echo "Setting up $ADMIN_USER as super admin..."

# Get admin user ID
ADMIN_ID=$(mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "SELECT ID FROM ${TABLE_PREFIX}users WHERE user_login = '$ADMIN_USER';" --skip-column-names)

if [ -z "$ADMIN_ID" ]; then
    echo "Warning: Could not find admin user ID. Using ID 1 as default."
    ADMIN_ID="1"
fi

# Update admin email if provided
if [ ! -z "$ADMIN_EMAIL" ]; then
    mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "UPDATE ${TABLE_PREFIX}sitemeta SET meta_value = '$ADMIN_EMAIL' WHERE meta_key = 'admin_email';"
    mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "UPDATE ${TABLE_PREFIX}users SET user_email = '$ADMIN_EMAIL' WHERE ID = $ADMIN_ID;"
fi

# Update site_admins in sitemeta to use the actual admin username with proper length
USER_LENGTH=$(echo -n "$ADMIN_USER" | wc -c)
echo "Configuring site_admins with username: $ADMIN_USER (length: $USER_LENGTH)"

# Delete any existing site_admins entry
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "DELETE FROM ${TABLE_PREFIX}sitemeta WHERE meta_key = 'site_admins';"

# Add the correct site_admins entry
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}sitemeta (site_id, meta_key, meta_value) VALUES (1, 'site_admins', 'a:1:{i:0;s:$USER_LENGTH:\"$ADMIN_USER\";}');"

# Add super admin capabilities to the user
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, 'wp_${TABLE_PREFIX}capabilities', 'a:1:{s:13:\"administrator\";b:1;}') ON DUPLICATE KEY UPDATE meta_value = 'a:1:{s:13:\"administrator\";b:1;}';"

mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, 'wp_user_level', '10') ON DUPLICATE KEY UPDATE meta_value = '10';"

mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, 'wp_${TABLE_PREFIX}user_level', '10') ON DUPLICATE KEY UPDATE meta_value = '10';"

# Add super admin capabilities for network
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}options (option_name, option_value, autoload) VALUES ('${TABLE_PREFIX}_user_roles', 'a:1:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}}', 'yes') ON DUPLICATE KEY UPDATE option_value = 'a:1:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}}';"

# Add network admin capabilities
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, '${TABLE_PREFIX}_capabilities', 'a:1:{s:13:\"administrator\";b:1;}') ON DUPLICATE KEY UPDATE meta_value = 'a:1:{s:13:\"administrator\";b:1;}';"

# Add user to site admins
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, 'primary_blog', '1') ON DUPLICATE KEY UPDATE meta_value = '1';"

# Add super admin flag
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, '${TABLE_PREFIX}_user_level', '10') ON DUPLICATE KEY UPDATE meta_value = '10';"

# Add super admin flag (global)
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}') ON DUPLICATE KEY UPDATE meta_value = 'a:1:{s:13:\"administrator\";b:1;}';"

# Add super admin flag (global level)
mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" "$DB_NAME" -e "INSERT INTO ${TABLE_PREFIX}usermeta (user_id, meta_key, meta_value) VALUES ($ADMIN_ID, 'wp_user_level', '10') ON DUPLICATE KEY UPDATE meta_value = '10';"

# Set appropriate permissions
echo "\nSetting appropriate file permissions..."
chmod 644 "$WP_DIR/.htaccess"
chmod 644 "$WP_DIR/wp-config.php"

# Restart web server
echo "\nRestarting web server..."
if command -v systemctl >/dev/null 2>&1; then
    systemctl restart apache2 || systemctl restart httpd || echo "Could not restart web server automatically. Please restart it manually."
else
    service apache2 restart || service httpd restart || echo "Could not restart web server automatically. Please restart it manually."
fi

echo "\n========================================"
echo "WordPress Multisite Setup Complete!"
echo "========================================"
echo ""
echo "Important: To complete the setup, please:"
echo "1. Clear your browser cookies and cache"
echo "2. Close your browser completely and reopen it"
echo "3. Log in to your WordPress admin panel"
echo ""
echo "You should now see 'My Sites' in the admin bar and"
echo "'Network Admin' in the dropdown menu."
echo ""
echo "If you don't see these options:"
echo "- Make sure you're logged in as the admin user"
echo "- Try logging out and back in again"
echo "- Check your wp-config.php and .htaccess files"
echo ""
echo "Note: If you're using subdomains, make sure wildcard"
echo "subdomains are configured on your server."
echo "========================================"
