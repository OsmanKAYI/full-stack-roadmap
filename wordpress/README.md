# WORDPRESS

This guide contains information about installing and basic usage of WordPress on Ubuntu 22.04.

## System Requirements

- PHP 7.4 or higher
- MySQL 5.7 or MariaDB 10.3 or higher
- Apache2/Nginx web server
- Minimum 512MB RAM
- Minimum 1GB disk space

## Pre-installation Setup

1. LAMP stack installation (Linux, Apache, MySQL, PHP)
2. Database creation
3. Required PHP modules installation

## Documentation

- [Install WordPress on Ubuntu](./install.on.ubuntu.md)
  - [Install WordPress using WP-CLI (.sh)](./install-wordpress.sh)
- [WordPress CLI Installation Guide](./wp.cli.md)
- [WordPress Multisite Installation Guide](./wp.multisite.md)
  - [WordPress Multisite Installation (.sh)](./wp.multisite.sh)

## Security Measures

1. Use strong passwords
2. Keep WordPress updated
3. Use security plugins (e.g., Wordfence)
4. Regular backups
5. Use SSL certificate

## Common Tasks

### Update WordPress Site URLs

If you need to update your WordPress site URLs after installation (for example, when moving to a different domain or IP address), you can use the following WP-CLI commands:

```bash
cd /path/to/wordpress
wp option update siteurl "http://192.168.0.97/wordpress_project_name"
wp option update home "http://192.168.0.97/wordpress_project_name"
```

Replace the URL with your actual site URL.

## Useful Resources

- [WordPress Official Documentation](https://wordpress.org/documentation/)
- [WordPress Codex](https://codex.wordpress.org/)
