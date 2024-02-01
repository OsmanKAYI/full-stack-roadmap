# PHP-CLI Example

## Content of index.php:

```php
<?php

echo "<h1>Hello from Docker !!!</h1>";
echo "<br>";
echo "PHP version:" . phpversion();
```

## Content of Dockerfile:

```
FROM php:7.0-cli
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "./index.php" ]
```

## Step 1

```bash
docker build -t $imagename .
# After each modification of the dockerfile
# the docker image needs to be recreated by running this code
```

- This is a Docker command and the docker build command allows Docker images to be built using file called Dockerfile. This command creates a Docker image named **$imagename** using the Dockerfile in the current directory.

- Also, the **. (dot)** refers to the directory where the Dockerfile is located and the Dockerfile in that directory will be used.

- The **-t** flag is used to give the created image a tag and in this case the tag is **$imagename**.

- To run this command, a file called Dockerfile must exist in the directory where the command is run. This file contains the steps that define the structure of the Docker image and, if necessary, the commands to run during the creation of the image. These steps are listed sequentially in the Dockerfile, with each step forming a layer of the Docker image.

## Step 2

```bash
docker run -it --rm --name $containername $imagename
# Running the Docker image file
```

- This is a Docker command, and the docker run command enables a Docker image to be run. This command runs a Docker image named **$imagename** and creates a Docker container named **$containername**.

- The **-it** flags set the Docker container to run in an interactive mode, allowing the user to interact at the command line.

- The **--rm** flag ensures that the Docker container is automatically deleted after it is run.

- The **--name** flag gives the Docker container a name, in this case **$containername**.

- **$imagename** at the end of the command specifies the name of the Docker image to run. This image must reside in an image repository such as Docker Hub or be created locally.

- Note that to run this command, you must first have a Docker image named **$imagename**. If this image does not exist locally, it may need to be created first. Also, make sure that the ports, connection settings and other Docker container settings are configured correctly for the application being run.

**Refs:**

- https://www.youtube.com/playlist?list=PL_f2F0Oyaj4_xkCDqnRWp4p5ypjDeC0kO
- https://github.com/gkandemi/docker
- https://github.com/truthseekers/php-docker-simple
