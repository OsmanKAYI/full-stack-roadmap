# How To Increase Maximum Upload File Size for MySQL

1. Learn the Php version with the command of

   `php -v`

2. According to your Php version, use the command below to open the php.ini file.

   `sudo vi /etc/php/7.4/apache2/php.ini`

   where `7.4` is the Php version uploaded on my computer

3. Paste the following lines at the end of `php.ini` file,

```BASH
    display_startup_errors = On
    display_errors         = On
    short_open_tag         = On
    opcache.enable         = 0
    upload_max_filesize    = 128M
    upload_max_size        = 128M
    post_max_size          = 128M
    max_input_vars         = 30000
    date.timezone          = "Europe/Istanbul"
    error_reporting        = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE & ~E_WARNING
    mbstring.language      = Turkish
    mbstring.internal_encoding = UTF-8
```

**Note:** `post_max_size` should be larger than `upload_max_size`

4. Restart your apache server to see the changes.

   `sudo service apache2 restart`
