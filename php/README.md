# PHP

PHP is a popular server-side scripting language designed for web development. It is widely used to build dynamic web applications and can be embedded into HTML code.

## Frameworks

PHP has a variety of frameworks available that can be used to build web applications more quickly and efficiently. Popular PHP frameworks include Laravel, Symfony, and CodeIgniter.

## Installing PHP & Apache

Apache is the most commonly used Web server on Linux systems. Web servers are used to serve Web pages requested by client computers.

```bash
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
# Apache Configurations
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
```

PHP is a general-purpose scripting language geared toward web development.

```bash
sudo apt install php -y
sudo service apache2 restart
```

## Documentation

The PHP documentation is available online at [php.net](https://www.php.net/). This documentation includes guides, tutorials, and reference material for learning PHP and using it effectively.

- [What is PHP](./what.is.php.md)
- [How to Use Two Different PHP Versions](./how.to.use.two.different.php.versions.md)
- [Database connection v1 (PHP File)](./php.db.connection.v1.php)
- [Database connection v2 (PHP File)](./php.db.connection.v2.php)
- [PHP Array Functions](./php.array.functions.md)
- [PHP GET & POST Methods](./php.get.post.methods.md)
- [PHP Forms](./php.form.introduction.md)
- [PHP Form Handling](./php.form.handling.md)
- [PHP Form Validation](./php.form.validation.md)
- [PHP Form Required](./php.form.required.md)
- [PHP Form URL and Email](./php.form.url.and.email.md)
- [Handling URL Parameters in PHP](./handling.url.parameter.md)
- [PHP Form Complete](./php.form.complete.md)
- [PHP MySQL Login](./php.mysql.login.md)
- [Null Coalescing Assignment](./null.coalescing.assignment.md)
- [Remove .php From URL](./remove.php.from.url.md)
- [PHP Debug (xdebug)](./xdebug.md)
- [PHP Cookie)](./php.cookie.md)
- [PHP Session)](./php.session.md)
- [Set Server Date Time Property](./set.server.datetime.property.md)
- [Optimizing PHP for High Traffic Websites](./optimize.php.md)
- [Understanding WebSockets in PHP](./websockets.in.php.md)

## Useful Links

- [LAMP Stack Built with Docker Compose](https://github.com/sprintcube/docker-compose-lamp)
  - It is a local development environment for PHP. This Docker Stack is build for local development and not for production usage.
- [PHP The Right Way](https://phptherightway.com/)
  - The Right Way is an easy-to-read, quick reference for PHP popular coding standards, links to authoritative tutorials around the Web, and what the contributors consider to be best practices at present.
- [Sweet PHP Debugging in Four Minutes](https://laracasts.com/series/visual-studio-code-for-php-developers/episodes/13)

## Projects

- [Simple Excel](https://github.com/faisalman/simple-excel-php)
  - Easily parse / convert / write between Microsoft Excel XML / CSV / TSV / HTML / JSON / etc formats
