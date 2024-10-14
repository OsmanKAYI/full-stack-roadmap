# Docker

## What is Docker?

Docker is among the most popular platforms for developing and deploying containerized applications. Containers are isolated environments that hold an application along with all the software packages it needs. With Docker, you can run or scale your application in any environment.

## Docker Installation

### Step 1: Remove Docker Completely

```bash
# older versions of Docker went by the names of docker, docker.io, or docker-engine
# you might also have installations of containerd or runc
# uninstall any such older versions before attempting to install a new version
sudo apt purge docker docker-engine docker.io containerd runc docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin -y
```

### Step 2: Prepare to Install Docker

```bash
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

### Step 3: Install Latest Version of Docker

```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
reboot
```

### Step 4: Verify Docker Installation

```bash
docker pull hello-world
docker run hello-world
```

The output will be like the following which means that the installation is successful.

```text
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

**Ref:** [Docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
