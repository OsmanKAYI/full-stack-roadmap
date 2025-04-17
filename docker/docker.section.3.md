# Docker Part 3: How and Why to Use Docker Compose?

**TL;DR:** This chapter covers practical use cases of Docker Compose in development, testing, and production environments. It provides steps to create a basic Docker Compose setup for serving static web pages using Nginx, along with essential prerequisites and commands.

Docker blog series has previously introduced the fundamentals of Docker to facilitate its daily use. This chapter focuses on practical applications of Docker in development, testing, and production environments, showcasing how Docker can enhance efficiency in daily tasks. Examples provided are expected to inspire new ideas for utilizing Docker effectively.

For those who haven't read the earlier parts of the blog series, the first two installments are recommended:

- [Docker Chapter 1: What is it, How does it work, and Where is it used?](https://gokhansengun.com/docker-nedir-nasil-calisir-nerede-kullanilir/)
- [Docker Chapter 2: How to Prepare a New Docker Image?](https://gokhansengun.com/docker-yeni-image-hazirlama/)

## Overview of the Chapter

The features discussed in this chapter are supported in Docker Compose version 1.6 and later. To check the version, use the command `docker-compose version`. If the output shows a version lower than 1.6, an upgrade will be necessary to follow the instructions in this blog.

By completing the following steps, a deeper understanding of Docker's daily usage and its conveniences will be gained:

- Discussion on the purpose of Docker Compose and the problems it solves.
- Creation of a simple `docker-compose.yml` file to set up a basic system.
- Introduction to Docker Compose CLI (docker-compose).
- Detailed examination of the `docker-compose.yml` file structure and configuration options.
- Running a relatively complex setup designed with Docker Compose, along with line-by-line explanations to conclude the blog.

## Prerequisites

To follow the steps outlined in this blog, the following conditions should be met:

- Ability to use command line (command window or terminal) on the relevant platform (Windows, Linux, Mac).
- General knowledge of Docker CLI.
- Familiarity with YAML (pronounced "Yam-ul") data serialization language.
- Understanding of Docker concepts as described in [the first blog of the series](https://gokhansengun.com/docker-nedir-nasil-calisir-nerede-kullanilir/).
- Knowledge about Dockerfile preparation as explained in [the second blog of the series](https://gokhansengun.com/docker-yeni-image-hazirlama/).

## Introduction to Docker Compose

Previous chapters focused on creating a single Docker image or running a single container. Products and systems commonly used or offered to clients consist of multiple services (typically web servers, application servers, database servers, cache servers, message queue servers, etc.). It is not practical to manage medium and large-scale systems using only Docker CLI. These types of systems require a separate tool for managing container operations such as starting, stopping, and defining relationships between them.

Docker Compose is utilized for easy management of development, user acceptance (UAT), and testing environments. It offers straightforward setup, maintenance, and overall usage in these environments. However, with new developments by `Docker Inc`, its application in production environments, where system stability, performance, consistency, redundancy, and high availability are crucial, is becoming more common. The integration of Docker Compose with Swarm, introduced in Docker version 1.12, indicates stronger future developments in this area. Docker Compose should not be confused with clustering tools like Docker Swarm and Kubernetes, which strive to provide the aforementioned features for production systems.

The services (containers) defined in the `docker-compose.yml` file can be started, stopped, and removed with single commands, simplifying management.

The `docker-compose` tool, based on [Fig](http://www.fig.sh/), is currently provided by `Docker Inc`, which also offers Docker CLI and Docker Daemon, and is typically included in the Docker bundle across all platforms. After understanding the function of Docker Compose, the next step involves illustrating concepts and usage through a simple system and scenario.

## Setting Up a Simple System with Docker Compose

In the [first blog of this series](https://gokhansengun.com/docker-nedir-nasil-calisir-nerede-kullanilir/), it was mentioned that Docker can assist in transferring the concept of multitenancy from applications to the platform. This section aims to exemplify this by setting up a structure of Docker containers to serve static web pages for a holding company consisting of companies A, B, and C. The focus will be on the testing environment. The static websites will be served using Nginx, utilizing the official Nginx Docker image available on [DockerHub](https://hub.docker.com) instead of the custom Nginx Docker image created in the previous blog.

Let's get started:

1. Create a new folder for this project and generate a `docker-compose.yml` file with the following content:

   ```yaml
   version: '2'

   services:
     company_a_web_server:
       image: nginx:latest
       ports:
         - '8001:80'

     company_b_web_server:
       image: nginx:latest
       ports:
         - '8002:80'

     company_c_web_server:
       image: nginx:latest
       ports:
         - '8003:80'
   ```

   The format of the `docker-compose.yml` file has evolved in versions 1.6 and later to support various features. Note that the first line reads `version: '2'`, which indicates compatibility with Docker Compose version 1.6 and later.

   In the `services` section of the YAML file, the services to be managed by Docker Compose are listed. In this example, services named `company_a_web_server`, `company_b_web_server`, and `company_c_web_server` are created for companies A, B, and C respectively. Services can be derived from a pre-existing image (like `nginx:latest`) or created using a provided Dockerfile. The `image` keyword specifies which image the service will use.

   The Nginx containers (services) created with this Docker Compose file listen on HTTP port (80), expose this port, and serve web pages. To access the web pages served by containers through port 80, port forwarding to different ports on the host (8001, 8002, 8003) is necessary.

2. Open a terminal and navigate to the folder containing the `docker-compose.yml` file. Run the command `docker-compose up`. Docker Compose will first pull all images listed in the YAML file (if not already downloaded) and then run them. If the Nginx image has been previously pulled from DockerHub, the output should resemble the following:

   ```bash
   Gokhans-MacBook-Pro:DCBlog gsengun$ docker-compose up
   Creating network "dcblog_default" with the default driver
   Creating dcblog_company_a_web_server_1
   Creating dcblog_company_b_web_server_1
   Creating dcblog_company_c_web_server_1
   Attaching to dcblog_company_a_web_server_1, dcblog_company_c_web_server_1, dcblog_company_b_web_server_1
   ```

   As seen in the output, Docker Compose created a network named `dcblog_default` and subsequently started the containers by combining the folder name `DCBlog` with the service names `company_x_web_server`. The final line indicates that the terminal is now attached to the running containers. This output will be analyzed further, but let's complete the demo first.

3. Open a web browser and check if Nginx’s default page is accessible at `http://localhost:8001`, `http://localhost:8002`, and `http://localhost:8003`. A similar display should appear, particularly for Company A’s web page, which is shown below:

   [![Home Page Company A](https://gokhansengun.com/resource/img/DockerPart3/CompanyAHomePage.png)](https://gokhansengun.com/resource/img/DockerPart3/CompanyAHomePage.png 'Home Page Company A')

4. To understand what Docker Compose does in the background, open a new terminal and run the command `docker ps` to see which containers are currently running. The output should show that Compose has started three containers named as configured:

   ```bash
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                           NAMES
   894cf2d86b46        nginx:latest        "nginx -g 'daemon off"   14 minutes ago      Up 14 minutes       443/tcp, 0.0.0.0:8003->80/tcp   dcblog_company_c_web_server_1
   ed8bdaa7514c        nginx:latest        "nginx -g 'daemon off"   14 minutes ago      Up 14 minutes       443/tcp, 0.0.0.0:8002->80/tcp   dcblog_company_b_web_server_1
   99e685c06e2d        nginx:latest        "nginx -g 'daemon off"   14 minutes ago      Up 14 minutes       443/tcp, 0.0.0.0:8001->80/tcp   dcblog_company_a_web_server_1
   ```

5. Return to the terminal where `docker-compose up` was executed and stop the containers by pressing `Ctrl + C`. Check the running containers again with `docker ps`, which should show none are active. Running `docker ps -a` will display the stopped containers:

   ```bash
   Gokhans-MacBook-Pro:DCBlog gsengun$ docker ps -a
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                           NAMES
   894cf2d86b46        nginx:latest        "nginx -g 'daemon off"   14 minutes ago      Exited (0) 2 minutes ago     443/tcp                        dcblog_company_c_web_server_1
   ed8bdaa7514c        nginx:latest        "nginx -g 'daemon off"   14 minutes ago      Exited (0) 2 minutes ago     443/tcp                        dcblog_company_b_web_server_1
   99e685c06e2d        nginx:latest        "nginx -g 'daemon off"   14 minutes ago      Exited (0) 2 minutes ago     443/tcp                        dcblog_company_a_web_server_1
   ```

   An easier way to stop and remove all containers and networks created by Docker Compose is to run `docker-compose down` instead of using `Ctrl + C`. The command stops all running containers, removes them, and deletes the created network.

   ```bash
   Gokhans-MacBook-Pro:DCBlog gsengun$ docker-compose down
   Stopping dcblog_company_a_web_server_1 ... done
   Stopping dcblog_company_c_web_server_1 ... done
   Stopping dcblog_company_b_web_server_1 ... done
   Removing dcblog_company_a_web_server_1 ... done
   Removing dcblog_company_c_web_server_1 ... done
   Removing dcblog_company_b_web_server_1 ... done
   Removing network dcblog_default
   ```

6. To build a new service configuration, update the `docker-compose.yml` file as follows:

   ```yaml
   version: '2'

   services:
     company_a_web_server:
       image: nginx:latest
       ports:
         - '8001:80'
       volumes:
         - ./company_a:/usr/share/nginx/html
     company_b_web_server:
       image: nginx:latest
       ports:
         - '8002:80'
       volumes:
         - ./company_b:/usr/share/nginx/html
     company_c_web_server:
       image: nginx:latest
       ports:
         - '8003:80'
       volumes:
         - ./company_c:/usr/share/nginx/html
   ```

   The new addition of the `volumes` keyword specifies which folders will be mounted to the Nginx server. This allows Nginx to serve files from the host directory.

7. In the terminal, create directories for each company:

   ```bash
   mkdir company_a company_b company_c
   ```

8. Create a simple `index.html` file for each company in their respective directories. For instance, create `company_a/index.html` with the content:

   ```html
   <html>
     <head>
       <title>Company A</title>
     </head>
     <body>
       <h1>Welcome to Company A's website!</h1>
     </body>
   </html>
   ```

   Repeat for companies B and C with different content.

9. Restart the services using the `docker-compose up` command again. Refresh the browser tabs at `http://localhost:8001`, `http://localhost:8002`, and `http://localhost:8003` to see the customized web pages for each company.

## Docker Compose CLI

Docker Compose CLI, çoklu konteyner uygulamalarını yönetmek için kullanılır. Bu bölümde, `docker-compose build`, `docker-compose up`, `docker-compose down`, ve diğer önemli komutlar hakkında detaylı bilgi verilecektir.

### docker-compose build

`docker-compose build` ve `docker-compose build <service_name>` komutları ile Compose dosyasında tanımladığınız servisleri teker teker veya toplu halde build edebilirsiniz. Örneğin, Host’tan kopyalanan dosyaları değiştirdiyseniz ve ilgili servisin image’ını yeniden build etmek istiyorsanız, `docker-compose build <service_name>` komutunu kullanmalısınız. Sonrasında `docker-compose up` komutu ile yeni bir container oluşturabilirsiniz.

### docker-compose up

`docker-compose up` komutu, Compose dosyasında tanımlı tüm servisleri başlatmak için kullanılır. Eğer servis konfigürasyonunda veya Dockerfile'da bir değişiklik yapıldıysa, `docker-compose up` bu değişiklikleri algılar, image’ı rebuild eder ve önceki container’ı kaldırarak yeni bir container oluşturur. Eğer bu işlemlerin yapılmasını istemiyorsanız `--no-recreate` parametresi kullanılabilir.

Belirli servisleri başlatmak için ise kullanım şekli `docker-compose up <service_name_1> <service_name_2>` şeklindedir. Örneğin, sadece A şirketinin web sunucusunu başlatmak için şu komutu verebilirsiniz:

```bash
docker-compose up company_a_web_server
```

### docker-compose down

`docker-compose down` komutu, Compose tarafından yaratılan container’ları durdurur ve sistemden kaldırır. Eğer oluşturulan volume'ların da silinmesi isteniyorsa `-v` parametresi kullanılmalıdır. Ayrıca, yeni image’lar build edilmişse `--rmi all` parametresi ile bu image’lar da silinebilir.

### docker-compose ps

`docker-compose ps` komutu, sadece ilgili Compose dosyasındaki container’ları listelemenizi sağlar. Bu, daha yönetilebilir bir çıktı sunar. Çalışan tüm container'ların durumunu görmek için `docker-compose ps` komutunu kullanabilirsiniz.

### docker-compose run

`docker-compose run` komutu, Compose dosyasında tanımlanmayan bir komut çalıştırmak için kullanılır. Örneğin, A şirketinin container’ı üzerinden B şirketine `ping` atmak için şu komutu kullanabilirsiniz:

```bash
docker-compose run company_a_web_server ping -c 4 company_b_web_server
```

### docker-compose start

Daha önce başlatılan container’lardan bir veya birkaçını yeniden başlatmak için `docker-compose start` komutu kullanılır. Ancak, bu komut genellikle sık kullanılmaz çünkü `docker-compose up <service_name>` ile aynı işlevi görür.

### docker-compose stop

`docker-compose stop`, daha önce başlatılan bir veya daha fazla servisi durdurmak için kullanılır. Örneğin:

```bash
docker-compose stop company_a_web_server
```

### docker-compose exec

`docker-compose exec`, çalışan bir container’da komut çalıştırmak için kullanılır. Örneğin, A şirketinin container’ına terminal erişimi sağlamak için:

```bash
docker-compose exec company_a_web_server /bin/bash
```

Bu komut, ayrıca başka komutlar koşturmak için de kullanılabilir:

```bash
docker-compose exec company_a_web_server ping -c 4 company_b_web_server
```

## Structure of the `docker-compose.yml` File and Configuration Options

The `docker-compose.yml` file is formatted in YAML, consisting of three main sections: Service, Volume, and Network configurations.

### Overview

The `docker-compose.yml` file is written in [YAML](http://yaml.org/) format, which is a data serialization format like JSON and XML. YAML is favored in the industry for its readability in simple configurations.

#### Service Configuration

Service configurations are specified under the `services:` tag, defining the details of the containers launched for each service. Below are some key configuration options for services:

##### build

Specifies the Dockerfile used for building the service. It can be specified in two ways:

```yaml
build: ./MyWebApp
```

Or with a context and Dockerfile name:

```yaml
build:
  context: ./MyWebApp
  dockerfile: Dockerfile-MyWebApp
```

##### command

Overrides the default command provided by the image:

```yaml
command: ping -c 4 www.google.com
```

##### container_name

Allows you to specify a custom name for the container:

```yaml
container_name: db-seeder-container
```

##### depends_on

Specifies the dependency order of services, though it doesn't wait for services to be "ready":

```yaml
version: '2'

services:
  nginx-service:
    build: WebSite
    depends_on:
      - ruby-service
  ruby-service:
    build: WebApp
    depends_on:
      - redis-service
  redis-service:
    image: redis
```

##### dns

Sets DNS servers for containers:

```yaml
dns: 8.8.8.8
```

Or multiple servers:

```yaml
dns:
  - 8.8.8.8
  - 8.8.4.4
```

##### environment

Adds environment variables to containers:

```yaml
environment:
  - MODE=PROD
  - DEBUG=true
  - PASSWORD=secret
```

##### expose

Exposes ports to other containers without exposing them to the host:

```yaml
expose:
  - '5432'
```

##### extra_hosts

Adds IPs to the container's `/etc/hosts` file:

```yaml
extra_hosts:
  - 'local.server:192.168.0.22'
```

##### image

Specifies the image for containers:

```yaml
image: nginx
```

For a built image:

```yaml
image: gsengun/mywebapp:1.0
build:
  context: ./MyWebApp
  dockerfile: Dockerfile-MyWebApp
```

##### networks

Defines networks for the service:

```yaml
my-service:
  networks:
    - nosql-network
```

##### ports

Maps host ports to container ports:

```yaml
ports:
  - '5432:5432'
  - '16000-17000:16000-17000'
```

##### volumes

Mounts host folders or defines named volumes:

1. Mounting a host folder:

   ```yaml
   services:
     my-service:
       volumes:
         - /Users/gsengun/Desktop/App:/var/lib/app
   ```

2. Creating a volume on the container:

   ```yaml
   services:
     my-service:
       volumes:
         - /var/lib/app
   ```

3. Using a named volume:

   ```yaml
   services:
     my-service:
       volumes:
         - my-volume:/var/lib/app

   volumes:
     my-volume:
       driver: local
   ```

#### Volume Configuration

Named volumes are accessible by all services and can be inspected via Docker CLI:

```yaml
volumes:
  my-named-volume:
    driver: local
```

#### Network Configuration

Compose offers extensive network configuration options for complex systems.

### Examining a Complex System Created with Docker Compose

#### Application Introduction

To reinforce what we've learned, let's test a complex structure with a simple application using Docker Compose. The original application can be found [here](https://github.com/docker/example-voting-app.git), and the forked version [here](https://github.com/gokhansengun/example-voting-app.git).

The application asks users if they prefer cats or dogs and displays the results. It uses five different services:

1. `voting-app`: A Python web app on port 5000.
2. `redis`: Redis memory cache for storing votes.
3. `worker`: A .NET app that saves votes to the `db` service.
4. `db`: A Postgres database.
5. `result-app`: A Node.js app showing the voting results on port 5001.

#### Analyzing the `docker-compose.yml` File

Here's the `docker-compose.yml` file for the application:

```yaml
version: '2'

services:
  voting-app:
    build: ./vote
    command: python app.py
    volumes:
      - ./vote:/app
    ports:
      - '5000:80'

  redis:
    image: redis:alpine
    ports: ['6379']

  worker:
    build: ./worker

  db:
    image: postgres:9.4

  result-app:
    build: ./result
    command: nodemon --debug server.js
    volumes:
      - ./result:/app
    ports:
      - '5001:80'
      - '5858:5858'
```

##### voting-app Service

This service is defined as follows:

```yaml
voting-app:
  build: ./vote
  command: python app.py
  volumes:
    - ./vote:/app
  ports:
    - '5000:80'
```

It builds the image from the `Dockerfile` in the `vote` folder and runs `python app.py` after creation.

##### redis Service

This service is defined simply:

```yaml
redis:
  image: redis:alpine
  ports: ['6379']
```

The container uses the `redis:alpine` image and maps the Redis port to the host.

##### worker Service

This service is straightforward:

```yaml
worker:
  build: ./worker
```

It builds the image from the `worker` folder's Dockerfile.

**Ref:** [Docker Bölüm 3 - gokhansengun.com](https://gokhansengun.com/docker-compose-nasil-kullanilir/)
