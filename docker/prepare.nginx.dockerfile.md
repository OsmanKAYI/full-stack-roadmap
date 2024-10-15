# Nginx Docker Setup Example

## TL;DR

This guide walks you through setting up an Nginx web server inside a Docker container, serving a simple HTML page. The image is based on Ubuntu and uses Docker to expose Nginx on port 80.

## 1. Create a directory for the project

```bash
mkdir -p nginxDocker
cd nginxDocker/
```

## 2. Create `index.html` file

```bash
touch index.html
```

Then, add the following HTML content:

```html
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>Ana Sayfa</title>
  </head>
  <body>
    <div style="text-align: center;">
      <h1>Welocome to Nginx Example Site</h1>
      <h2>Nginx and Docker collaboration presents</h2>
    </div>
  </body>
</html>
```

## 3. Create a `Dockerfile`

```bash
touch Dockerfile
```

Add the following content to the `Dockerfile`:

```dockerfile
FROM ubuntu:latest

MAINTAINER Osman KAYI <osmankayi06@gmail.com>

# Update the package lists
RUN apt-get update

# Install Nginx
RUN apt-get install -y nginx

# Copy the index.html to Nginx's default web directory
ADD [ "./index.html", "/var/www/html/" ]

# Expose port 80 to access the Nginx server
EXPOSE 80

# Start Nginx in the foreground
ENTRYPOINT nginx -g 'daemon off;'
```

## 4. Build the Docker Image

```bash
docker build -t osmankayi/mywebsite:0.1 .
```

## 5. Run the Docker Container

```bash
docker run -p 8080:80 osmankayi/mywebsite:0.1
```

## 6. Access the Website

Open your browser and navigate to `http://localhost:8080`. You should see the webpage with the message:  
**"Welocome to Nginx Example Site - Nginx and Docker collaboration presents"**.
