# LAMP with Docker

- To install docker, refer to the [Docker Installation](./docker.md) section.

## 1. Create Project Directory

```bash
mkdir lamp-docker
cd lamp-docker/
```

## 2. Create `docker-compose.yml` File

Create the `docker-compose.yml` file with the following content:

```yaml
version: '3.8'

services:
  web:
    image: php:7.4-apache
    container_name: my_lamp_web
    ports:
      - '8080:80'
    volumes:
      - ./html:/var/www/html
    networks:
      - lamp_network

  db:
    image: mysql:5.7
    container_name: my_lamp_db
    environment:
      MYSQL_ROOT_PASSWORD: root # MySQL root user password
      MYSQL_DATABASE: mydb # Database name to be created (if desired)
      MYSQL_USER: user # Username to be created (if desired)
      MYSQL_PASSWORD: user # Password for the user (if desired)
    volumes:
      - ./mysql:/var/lib/mysql
    networks:
      - lamp_network

  adminer:
    image: adminer
    container_name: my_adminer
    ports:
      - '8081:8080'
    networks:
      - lamp_network

networks:
  lamp_network:
    driver: bridge
```

## 3. Create HTML Directory and PHP File

```bash
mkdir html
vi html/index.php
```

Add the following content to `index.php`:

```php
<?php
phpinfo();
?>
```

## 4. Start Docker Containers

```bash
docker-compose up -d
```

## 5. Check Running Containers

```bash
docker ps
```

## 6. Access the Application

- In your browser: [http://localhost:8080](http://localhost:8080)
- For Adminer: [http://localhost:8081](http://localhost:8081)

## 7. Stop Docker Containers

```bash
docker-compose down
```

- To install LAMP docker directly, use the following command on terminal:

```bash
wget https://osmankayi.com/docker/lamp.with.docker.sh
chmod +x lamp.with.docker.sh
bash lamp.with.docker.sh
```
