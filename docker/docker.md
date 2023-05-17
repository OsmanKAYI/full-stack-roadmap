# Docker

## What is Docker?

Docker is among the most popular platforms for developing and deploying containerized applications. Containers are isolated environments that hold an application along with all the software packages it needs. With Docker, you can run or scale your application in any environment.

## Docker Installation

### Step 1: Before Start

```BASH
# lder versions of Docker went by the names of docker, docker.io, or docker-engine
# you might also have installations of containerd or runc
# uninstall any such older versions before attempting to install a new version
sudo apt purge docker docker-engine docker.io containerd runc

# install packages to allow apt to use a repository over HTTPS
sudo apt install ca-certificates curl gnupg

# add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# use the following command to set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### Step 2: Install Latest Version

```BASH
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Step 3: Verify Docker Installation

```BASH
sudo docker run hello-world
```

The output will be like the following which means that the installation is successful.

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
719385e32844: Pull complete
Digest: sha256:fc6cf906cbfa013e80938cdf0bb199fbdbb86d6e3e013783e5a766f50f5dbce0
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

**Ref:** https://docs.docker.com/engine/install/ubuntu/
