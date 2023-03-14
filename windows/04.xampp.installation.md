# PHP and MySQL Installation

## Download and Setup xampp

- xampp is downloaded from [here](https://www.apachefriends.org/download.html).
- xampp.exe is run and `Next` button is clicked, step by step (No special configurations to do).
- Installed file will be in `C:\xampp` directory.

### Appended to the End of `php.ini` File

```PHP
display_startup_errors = On
display_errors         = On
upload_max_filesize    = 128M
upload_max_size        = 128M
post_max_size          = 128M
max_input_vars         = 5000
error_reporting        = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE & ~E_WARNING
mbstring.language          = Turkish
mbstring.internal_encoding = UTF-8
```

### Changes to Do in `my.ini` File

- `sql_mode=NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION` satırı `sql_mode=''` olarak değiştirilecek

## Intallation of `Adminer` for MySQL Management

- A new file is created under the directory of `xammp/htdocs` with a name of `adminer`.
- Either [adminer-latest.php](https://www.adminer.org/latest.php) or [adminer-latest-mysql.php](https://www.adminer.org/latest-mysql.php) file is dowloaded.
- Name of the downloaded file's name is changed as `index.php`.
- `index.php` is moved to the directory of `xampp/htdocs/adminer`.
- To use adminer, type `localhost/adminer` in browser.
- **NOTE:**When the password of `root` is `NULL`, the adminer will not work. The password should be changed.

### Change Password of User `root` in MySQL

```SQL
mysql -u root -p
  SET PASSWORD FOR 'root'@'localhost' = PASSWORD("root");
  exit;
```

### Add New User in MySQL

```SQL
CREATE USER 'dbadmin'@'localhost' IDENTIFIED BY 'dbadmin';
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
