# Remove .php From URL and Make User Friendly URL In PHP

To remove the .php extension from URLs in a Core PHP website, you'll need to utilize URL rewriting techniques. This can be accomplished through Apache's mod_rewrite module, allowing for the creation of user-friendly URLs.

## Steps:

1. **Enable mod_rewrite:** Ensure that the mod_rewrite module is enabled in your Apache server configuration. Open your httpd.conf file and verify that the following line is not commented out:
   `LoadModule rewrite_module modules/mod_rewrite.so`

If you make any changes, remember to restart your Apache server.

2. **Create a .htaccess file:** In the root directory of your website, create a file named .htaccess if it doesn't already exist.

3. **Add Rewrite Rules:** Open the .htaccess file and add the following lines:

```config
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^([^\.]+)$ $1.php [NC,L]
```

- This code snippet checks if the requested file or directory does not exist, and if so, it appends a .php extension to the request.
- Test: Try accessing your pages without the .php extension in the URL (e.g., https://insightinfo.tech/contact). If everything is set up correctly, it should work as expected.

Remember that this approach assumes you’re using an Apache web server. If you’re using a different server, the steps may be slightly different. Always back up your files before making changes to configuration files.

**Ref:** [pritam maheshwari - Medium](https://medium.com/@pritammaheshwari188/remove-php-from-url-and-make-user-friendly-url-in-php-115b453c15af)
