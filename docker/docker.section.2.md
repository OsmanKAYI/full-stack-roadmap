# Docker Part 2: How to Prepare a New Docker Image?

**TLDR:** This blog explores customizing Docker images using Dockerfile and showcases how to create and push a simple image to DockerHub.

The first part of the Docker blog series introduced what Docker is, how it works, and its applications. As mentioned previously, [DockerHub](https://hub.docker.com) contains numerous beneficial images, including both official ones (like Ubuntu, Nginx, Redis, etc.) and those derived from them with varying features. Although these images often meet most needs, the requirement to customize both official and other repository images arises quickly. This second installment focuses on leveraging Docker's rich customization tools to tailor existing images to specific needs while gaining a deeper understanding of Docker.

For those who haven't read the first blog, it's highly recommended to check it out.

[Docker Part 1: What is it, How Does it Work, and Where is it Used?](https://gokhansengun.com/docker-nedir-nasil-calisir-nerede-kullanilir/)

In this second blog about preparing Docker images, daily usage examples will not be extensively covered. Practical applications of Docker are summarized in the linked blog below. After reading this, it’s advisable to check it out.

[Docker Part 3: What Are the Purposes of Docker Compose and How Is It Used?](https://gokhansengun.com/docker-compose-nasil-kullanilir/)

## Overview

This blog aims to enhance the effective use of Docker by completing the following steps, detailing customization processes:

- To provide motivation, the journey begins with creating a simple image, running it, pushing it to DockerHub, and making it available for others.
- The structure of the Dockerfile and its instructions will be examined.
- Customization of an Ubuntu base image will occur, installing Nginx and serving a simple web page.

## Prerequisites

To follow the steps outlined in this blog, the following conditions are expected:

- Ability to use the command line (command window or terminal) on the relevant platform (Windows, Linux, Mac).
- Basic understanding of Docker CLI.
- Familiarity with Ubuntu package installation (apt-get) at a beginner level.
- Knowledge equivalent to that presented in the [first blog of the Docker series](https://gokhansengun.com/docker-nedir-nasil-calisir-nerede-kullanilir/).

## Dockerfile - Introduction

The previous blog highlighted one of Docker’s most significant advantages over LXC: the structure of containers is maintained in a text-based file, standardizing and making the image-to-container creation process repeatable. This text-based file is known as the Dockerfile. The Docker Daemon reads and evaluates the instructions within the Dockerfile added to the file system, creating a new image based on these instructions.

## Preparing a Simple Image and Pushing to DockerHub

Creating a new image is straightforward. A Dockerfile summarizing how to create the new image is placed in a folder, and the command `docker build .` is executed in the terminal within that folder. The resulting image can be viewed using the `docker images` command.

1. Begin by creating a simple image. Create a new folder in the file system and inside it, create a file named `Dockerfile`. Note that the file has no extension. If using Windows, ensure that file extensions are visible and that the new file doesn’t receive the default `.txt` extension. The ideal method is to create the file using the command line or a text editor. Use `echo. 2>Dockerfile` in Windows or `touch Dockerfile` in Mac OS X and Linux to create a Dockerfile in the relevant folder.

2. Open the created Dockerfile with a text editor and enter the following lines:

   ```dockerfile
   FROM ubuntu:latest

   MAINTAINER Gokhan Sengun <gokhansengun@gmail.com>
   ```

   The instruction `FROM ubuntu:latest` indicates that the new image will derive from the official `ubuntu` image with the `latest` tag. The image maintainer’s name and email are specified afterward.

   This image will be identical to the official `ubuntu` image distributed by DockerHub.

3. Now, execute the command `docker build .` from the Docker CLI, and the output should resemble the following:

   ```plaintext
   Gokhans-MacBook-Pro:DockerfileBlog gsengun$ docker build .
   Sending build context to Docker daemon 2.048 kB
   Step 1 : FROM ubuntu:latest
   ---> 2fa927b5cdd3
   Step 2 : MAINTAINER Gokhan Sengun <gokhansengun@gmail.com>
   ---> Running in 471e40634b23
   ---> a748835505b2
   Removing intermediate container 471e40634b23
   Successfully built a748835505b2
   ```

   The first line of the output shows that the Docker CLI is sending the necessary information to the Docker Daemon for the build process. Subsequent outputs reflect the application of the instructions in the Dockerfile. The Docker Daemon treats each instruction as a step and successfully creates the image. Run the command `docker images` to see output similar to this, noting that the value in the `IMAGE ID` column (a748835505b2) corresponds to the last line of the previous output.

   ```plaintext
   REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
   <none>                    <none>              a748835505b2        4 minutes ago       122 MB
   gsengun/jmeter3.0         1.7.1               055a31dd0034        2 days ago          736.6 MB
   mono                      4.4.0.182-onbuild   15129f680b3b        13 days ago         771.7 MB
   ```

   It's noteworthy that the newly created image differs slightly from others; the `REPOSITORY` and `TAG` columns remain empty. In addition to the new image, two previously used images are visible on the host. The `mono` image is expressed directly, while `gsengun/jmeter3.0` is shown with a namespace (`gsengun`). As explained earlier, official repositories do not have a namespace prefix, while images from DockerHub must have a namespace to prevent name collisions.

4. To add a tag and repository to the image created above, the `docker tag` command can be used. Execute a command similar to the following, replacing `gsengun` with your namespace. If sending images to DockerHub, remember that the namespace should be your Docker Hub ID.

   ```bash
   docker tag a748835505b2 gsengun/myubuntu:0.1
   ```

   Note that `a748835505b2` is the ID of the image built in previous steps. Now run the `docker images` command again and observe that the `REPOSITORY` and `TAG` columns are now filled with the provided information.

   ```plaintext
   Gokhans-MacBook-Pro:DockerfileBlog gsengun$ docker images
   REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
   gsengun/myubuntu          0.1                 a748835505b2        About an hour ago   122 MB
   gsengun/jmeter3.0         1.7.1               055a31dd0034        3 days ago          736.6 MB
   mono                      4.4.0.182-onbuild   15129f680b3b        13 days ago         771.7 MB
   ```

   Instead of building and tagging the image separately, the tagging could have been done during the build process. The command for this would be `docker build -t gsengun/myubuntu:0.1 .` instead of `docker build myubuntu .`.

5. Now, test the created image to ensure everything is functioning correctly. Although this first image is an exact replica of Ubuntu, this step is still worth attempting. Create a container that outputs "Hello Docker from Ubuntu."

   ```bash
   Gokhans-MacBook-Pro:DockerfileBlog gsengun$ docker run gsengun/myubuntu:0.1 echo "Hello Docker from Ubuntu"
   Hello Docker from Ubuntu
   ```

6. The next step is to push the successfully tested image to DockerHub. As expected, a DockerHub account is necessary for this process. Visit [DockerHub](https://hub.docker.com/) and click the `Sign Up` button under the `New to Docker?` section to register. The Docker Hub ID chosen here will serve as the namespace for your images.

   After completing the registration, authenticate by running the `docker login` command in the command line, entering the Docker Hub ID and password. The output should resemble the following:

   ```plaintext
   Gokhans-MacBook-Pro:DockerfileBlog gsengun$ docker login
   Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
   Username (gsengun): gsengun
   Password: ****************
   Login Succeeded
   ```

7. Once DockerHub authentication is complete in the command line, push the newly created image. Replace `gsengun` with your DockerHub ID and wait for the process to finish.

   ```bash
   Gokhans-MacBook-Pro:DockerfileBlog gsengun$ docker push gsengun/myubuntu:0.1
   # The push refers to a repository [docker.io/gsengun/myubuntu]
   ```

Upon completion, the result should resemble this:

```plaintext
The push refers to repository [docker.io/gsengun/myubuntu]
4e37583428b1: Pushed
0.1: digest: sha256:ea9f78b6cf531c079d7c875f057fe84aebc2648ed538737f7fa36dbd64b2e1b8 size: 524
```

Finally, verify that the image is visible on your DockerHub account. You can view it by clicking on your DockerHub ID after logging into DockerHub, which should direct you to your profile and show the uploaded image.

Sure! Here’s a concise summary of the Dockerfile structure and instructions in Markdown format, along with the Nginx image setup example.

## Dockerfile Structure

A Dockerfile is line-based and does not use serialization formats like YAML or JSON. Instructions are formatted as follows:

```bash
INSTRUCTION arguments
```

Comments are prefixed with `#`.

## Common Instructions

### RUN

Used to execute commands during the build process. For example, to install a package:

```dockerfile
RUN apt-get install -y iputils-ping
```

### CMD

Specifies the default command to run when a container is started. It can be provided in different formats:

1. **Exec form** (preferred):

   ```dockerfile
   CMD [ "executable", "param1", "param2" ]
   ```

2. **Parameter form**:

   ```dockerfile
   ENTRYPOINT [ "ping" ]
   CMD [ "8.8.8.8" ]
   ```

3. **Shell form**:

   ```dockerfile
   CMD command param1 param2
   ```

### ENTRYPOINT

Defines a command that will run as an executable when a container starts. Formats:

1. **Exec form**:

   ```dockerfile
   ENTRYPOINT ["executable", "param1", "param2"]
   ```

2. **Shell form**:

   ```dockerfile
   ENTRYPOINT command param1 param2
   ```

### EXPOSE

Informs Docker that the container listens on the specified network ports:

```dockerfile
EXPOSE 80
```

### ADD

Adds files from the host filesystem or a URL to the image:

```dockerfile
ADD [ "src", "dest" ]
```

### COPY

Similar to `ADD`, but does not allow URLs:

```dockerfile
COPY [ "src", "dest" ]
```

### WORKDIR

Sets the working directory for subsequent instructions:

```dockerfile
WORKDIR /app/src
```

### HEALTHCHECK

Checks the health of the running container:

```dockerfile
HEALTHCHECK --interval=10s --timeout=60s CMD curl -f http://localhost:9876/ || exit 1
```

## Example: Creating an Nginx Image to Serve a Simple Website

### Steps

1. Create a directory with an empty `Dockerfile` and an `index.html` file with the following content:

   ```html
   <html>
     <head>
       <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
       <title>Ana Sayfa</title>
     </head>
     <body>
       <div style="text-align: center;">
         <h1>Web Sitemize Hoşgeldiniz</h1>
         <h2>Nginx ve Docker İşbirliği Sunar</h2>
       </div>
     </body>
   </html>
   ```

2. Write the Dockerfile:

   ```dockerfile
   FROM ubuntu:latest
   MAINTAINER Gokhan Sengun <gokhansengun@gmail.com>

   # Update package list
   RUN apt-get update

   # Install Nginx
   RUN apt-get install -y nginx

   # Add website content
   ADD [ "./index.html", "/var/www/html/" ]

   # Expose HTTP port
   EXPOSE 80

   # Set entrypoint to start Nginx
   ENTRYPOINT ["nginx", "-g", "daemon off;"]
   ```

### Building the Image

Run the following command in the directory containing the Dockerfile:

```bash
docker build -t my-nginx .
```

### Running the Container

Start the container with:

```bash
docker run -p 80:80 my-nginx
```

**Ref:** [Docker Bölüm 2 - gokhansengun.com](https://gokhansengun.com/docker-yeni-image-hazirlama/)
