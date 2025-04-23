#!/bin/bash

# WordPress Installer Script using WP-CLI
# This script automates the installation of WordPress on Ubuntu 22.04 using WP-CLI

# Color definitions for better readability
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NC="\033[0m" # No Color

# Function to display messages
function echo_message() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

function echo_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

function echo_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

function echo_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if script is run as root
if [ "$(id -u)" -eq 0 ]; then
    echo_error "This script should not be run as root. Please run as a regular user with sudo privileges."
    exit 1
fi

# Check if WP-CLI is installed, if not install it
if ! command -v wp &> /dev/null; then
    echo_message "WP-CLI not found. Installing..."
    # Download WP-CLI phar file
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # Make it executable
    chmod +x wp-cli.phar
    # Move to path
    sudo mv wp-cli.phar /usr/local/bin/wp
    echo_success "WP-CLI installed successfully"
fi

# Ask for project name
echo_message "WordPress Installation Script for Ubuntu 22.04 using WP-CLI"
echo -n "Enter your project name (without spaces): "
read PROJECT_NAME

# Validate project name (no spaces, special characters limited)
if [[ ! $PROJECT_NAME =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo_error "Project name can only contain letters, numbers, underscores, and hyphens."
    exit 1
fi

# Ask for owner name
echo -n "Enter owner name (without spaces): "
read OWNER

# Validate owner name (no spaces, special characters limited)
if [[ ! $OWNER =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo_error "Owner name can only contain letters, numbers, underscores, and hyphens."
    exit 1
fi

# Set directory and database names
WP_DIR="${PROJECT_NAME}-wordpress"
DB_NAME="${OWNER}_wordpress"
DB_USER="${OWNER}"

# Ask for database password
echo -n "Enter database password (leave blank to generate one): "
read -s USER_DB_PASS
echo ""

# Generate a random password if user didn't provide one
if [ -z "$USER_DB_PASS" ]; then
    DB_PASS=$(openssl rand -base64 12)
    echo_message "Generated random password for database."
else
    DB_PASS="$USER_DB_PASS"
fi

# Ask for site title
echo -n "Enter site title: "
read SITE_TITLE

# Ask for admin username
echo -n "Enter admin username: "
read ADMIN_USER

# Ask for admin password
echo -n "Enter admin password (leave blank to generate one): "
read -s ADMIN_PASS
echo ""

# Generate a random admin password if user didn't provide one
if [ -z "$ADMIN_PASS" ]; then
    ADMIN_PASS=$(openssl rand -base64 12)
    echo_message "Generated random password for admin user."
fi

# Ask for admin email
echo -n "Enter admin email: "
read ADMIN_EMAIL

echo_message "Project name: $PROJECT_NAME"
echo_message "WordPress directory will be: /var/www/html/$WP_DIR"
echo_message "Database name will be: $DB_NAME"
echo_message "Database user will be: $DB_USER"
echo_message "Database password will be: $DB_PASS"
echo_message "Site title will be: $SITE_TITLE"
echo_message "Admin username will be: $ADMIN_USER"
echo_message "Admin password will be: $ADMIN_PASS"
echo_message "Admin email will be: $ADMIN_EMAIL"

# Confirm installation
echo -n "Continue with installation? (y/n): "
read CONFIRM
if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
    echo_message "Installation cancelled."
    exit 0
fi

# Step 1: Check if destination directory already exists
if [ -d "/var/www/html/$WP_DIR" ]; then
    echo_warning "Directory /var/www/html/$WP_DIR already exists."
    echo -n "Do you want to overwrite it? (y/n): "
    read DIR_OVERWRITE
    
    if [[ $DIR_OVERWRITE =~ ^[Yy]$ ]]; then
        echo_message "Removing existing directory..."
        sudo rm -rf /var/www/html/$WP_DIR
    else
        echo_error "Installation cancelled. Please choose a different project name."
        exit 1
    fi
fi

# Step 2: Create directory
echo_message "Creating WordPress directory..."
sudo mkdir -p /var/www/html/$WP_DIR
sudo chown $USER:www-data /var/www/html/$WP_DIR
echo_success "Directory created successfully."

# Step 3: Configure Apache
echo_message "Configuring Apache..."
sudo a2enmod rewrite
sudo systemctl restart apache2
echo_success "Apache configured successfully."

# Step 4: Create database and user
echo_message "Creating database and user..."

# MySQL commands
MYSQL_COMMANDS="
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
"

# Execute MySQL commands
echo_message "You may be prompted for your MySQL root password..."

# Try without password first (if MySQL is configured that way)
if ! echo "$MYSQL_COMMANDS" | sudo mysql -u root 2>/dev/null; then
    # If that fails, prompt for password
    echo -n "Enter MySQL root password: "
    read -s MYSQL_ROOT_PASS
    echo ""
    
    if ! echo "$MYSQL_COMMANDS" | sudo mysql -u root -p"$MYSQL_ROOT_PASS"; then
        echo_error "Failed to create database and user."
        echo_warning "Continuing with installation, but you may need to create the database manually."
        
        # Create database manually
        echo_message "Attempting to create database manually..."
        sudo mysqladmin -u root -p"$MYSQL_ROOT_PASS" create "$DB_NAME"
        
        if [ $? -ne 0 ]; then
            echo_error "Manual database creation failed. Please create the database manually after installation."
        else
            echo_success "Database created manually."
            
            # Create user and grant privileges
            GRANT_COMMANDS="
            CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
            GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
            FLUSH PRIVILEGES;
            "
            
            if ! echo "$GRANT_COMMANDS" | sudo mysql -u root -p"$MYSQL_ROOT_PASS"; then
                echo_error "Failed to create user and grant privileges. Please do this manually after installation."
            else
                echo_success "User created and privileges granted manually."
            fi
        fi
    fi
fi

echo_success "Database and user created successfully."

# Step 5: Download and install WordPress using WP-CLI
echo_message "Downloading and installing WordPress in Turkish..."
cd /var/www/html/$WP_DIR
sudo wp core download --locale=tr_TR --allow-root
echo_success "WordPress core downloaded successfully."

# Step 6: Create wp-config.php using WP-CLI
echo_message "Creating wp-config.php file..."
sudo wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbprefix=${PROJECT_NAME}_ --locale=tr_TR --allow-root

# Add FS_METHOD to wp-config.php
echo_message "Adding FS_METHOD to wp-config.php..."
sudo wp config set FS_METHOD 'direct' --allow-root
echo_success "wp-config.php created and configured successfully."

# Step 7: Install WordPress using WP-CLI
echo_message "Installing WordPress..."
sudo wp core install --url=http://localhost/$WP_DIR --title="$SITE_TITLE" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root
echo_success "WordPress installed successfully."

# Step 8: Set file permissions
echo_message "Setting file permissions..."
# Set ownership
sudo chown -R $USER:www-data /var/www/html/$WP_DIR/
sudo usermod -aG www-data $USER

# Set base permissions
sudo find /var/www/html/$WP_DIR/ -type d -exec chmod 755 {} \;
sudo find /var/www/html/$WP_DIR/ -type f -exec chmod 644 {} \;

# Set specific permissions for writable directories
sudo chmod -R 775 /var/www/html/$WP_DIR/wp-content/

# Create upgrade directory with proper permissions if it doesn't exist
sudo mkdir -p /var/www/html/$WP_DIR/wp-content/upgrade
sudo chmod 775 /var/www/html/$WP_DIR/wp-content/upgrade
sudo chown www-data:www-data /var/www/html/$WP_DIR/wp-content/upgrade

# Make sure plugins and themes directories are writable
sudo chmod -R 775 /var/www/html/$WP_DIR/wp-content/plugins
sudo chmod -R 775 /var/www/html/$WP_DIR/wp-content/themes

echo_success "File permissions set successfully."

# Step 9: Install and activate a default theme (optional)
echo_message "Installing and activating Twenty Twenty-Four theme..."
sudo wp theme install twentytwentyfour --activate --allow-root
echo_success "Theme installed and activated successfully."

# Step 10: Install some useful plugins (optional)
echo_message "Installing useful plugins..."
sudo wp plugin install wordpress-seo contact-form-7 --activate --allow-root
echo_success "Plugins installed and activated successfully."

# Final message
echo_success "WordPress installation completed successfully!"
echo_message "Your WordPress site is available at: http://localhost/${YELLOW}$WP_DIR${NC}"
echo_message "Admin URL: ${YELLOW}http://localhost/$WP_DIR/wp-admin/${NC}"
echo_message "Admin Username: ${YELLOW}$ADMIN_USER${NC}"
echo_message "Admin Password: ${YELLOW}$ADMIN_PASS${NC}"
echo_message "Database Name: ${YELLOW}$DB_NAME${NC}"
echo_message "Database User: ${YELLOW}$DB_USER${NC}"
echo_message "Database Password: ${YELLOW}$DB_PASS${NC}"
echo_warning "IMPORTANT: Please save your credentials in a secure location."
