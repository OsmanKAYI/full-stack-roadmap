# PHP-Apache Example

```BASH
cd
cd /var/www/html/
mkdir docker
cd docker
docker run -d -p 8888:80 --name $containername -v "$PWD":/var/www/html php:7.0-apache

# or

docker run -d -p 80:80 --name $containername -v "$PWD":/var/www/html php:7.0-apache
```

- This is a Docker command, and the docker run command enables a Docker image to be run. This command runs a Docker image named **php:7.0-apache** and creates a Docker container named **$containername**.

- The **-d** flag allows the Docker container to run in the background (as a daemon).

- The **-p** flag ensures that the ports opened by the container are mapped to ports on the host. In this case, it maps host port 8888 to container port 80 (or host port 80 to container port 80).

- The **--name** flag gives the Docker container a name, in this case **$containername**.

- The **-v** flag provides a file share between the Docker container and the host. In this case, the $PWD variable specifies the path to the current directory, and will share files from the /var/www/html directory, allowing the host to access this directory.

- The **php:7.0-apache** at the end of the command specifies the name of the Docker image to run. This image must reside in an image repository such as Docker Hub or be created locally.

- Note that to run this command, you must first have a Docker image named **php:7.0-apache**. Also, make sure that the ports, connection settings and file sharing settings are configured correctly for the application being run.

## To Start

```
# depends on what you used as a host in docker run command

http://localhost:8888/

# or

http://localhost:80/
```

## To Stop

```
docker stop $(docker ps -a -q)
```

## What is _docker-compose.yml_?

- Docker Compose is a tool used to run multiple Docker containers as a single application. **docker-compose.yml** file is a configuration file used by Docker Compose.

- This file defines all containers in a Docker Compose project and how to configure them. For example, a web application can contain multiple containers in a Docker Compose project, one to run the database server, another to run the web server, etc. Docker Compose enables these containers to work together by defining these containers in a single **docker-compose.yml** file.

- The file also contains configuration settings that determine which Docker image to use for each container, which networks to connect each container to, which ports to open, and other Docker settings. **docker-compose.yml** file is used with the Docker Compose CLI and is used to start, stop, restart and perform other Docker operations on all containers managed as a project by Docker Compose.

## Content of _docker-compose.yml_

```YAML
version:'3.1'

services:
  php:
    image: php:7.0-apache
    ports:
      - 8888:80
    volumes:
      - ./:/var/www/html

```

## Docker Compose Up

```PHP
docker compose up -d
```

- This command is used to start all containers in the Docker Compose project. This command starts all services (containers) defined in the **docker-compose.yml** file and runs them in the background (daemon mode).

- Before running this command, a **docker-compose.yml** file must be created for the Docker Compose project. The **docker-compose.yml** file specifies the configuration, networks and dependencies of the services (containers) defined for the project.

- The **-d** flag ensures that the command is executed in the background. This allows the containers to be run and the containers will continue to run even if the terminal window is closed by the user.

- For example, after creating the **docker-compose.yml** file, the above command can be used to start all services (containers) in the Docker Compose project in the background.

## Docker Compose Down

To stop running docker images:

```PHP
docker compose down
```

## Adding MySQL

```YAML
  db:
    image: mysql:8.0
    # NOTE: use of "mysql_native_password" is not recommended: https://dev.mysql.com/doc/refman/8.0/en/upgrading-from-previous-series.html#upgrade-caching-sha2-password
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_USER: "test"
      MYSQL_PASS: "test"
    ports:
      - 3306:3306
  #    volumes:
  #      - $volumename:/var/lib/mysql

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
#volumes:
#  $volumename:
```

## What Happens If _docker-compose.yml_ and _Dockerfile_ Files Are in the Same Directory?

- The **docker-compose.yml** file and the **Dockerfile** file are usually used within the same Docker project and are located in the same directory. In this case, Docker Compose will create the Docker image for each of the containers specified in **docker-compose.yml** using the **Dockerfile** file, which is also located in the same directory.

- **Dockerfile** is a file that specifies how to create a Docker image. The **docker-compose.yml** file defines the configuration of multiple Docker containers managed by Docker Compose. In **docker-compose.yml**, each container specifies a **Dockerfile** or the name of a previously created Docker image. Therefore, having the **Dockerfile** and **docker-compose.yml** in the same directory makes it easier for Docker Compose to create the correct Docker image for each container.

- Using this configuration, you can launch the entire project using the **docker-compose.yml** file. Docker Compose will create Docker images of all containers defined in the **docker-compose.yml** file and then launch Docker containers using these images.

**Ref:** https://github.com/truthseekers/php-docker-simple
