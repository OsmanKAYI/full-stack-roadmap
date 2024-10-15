# Nginx Docker Setup Example

# create a directory for the project
mkdir -p nginxDocker
cd nginxDocker/

# create `index.html` file and add some content
touch index.html
echo "
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Ana Sayfa</title>
</head>
<body>
    <div style="text-align: center;">
      <h1>Welocome to Nginx Example Site</h1>
      <h2>Nginx and Docker collaboration presents</h2>
    </div>
</body>
</html>
" > index.html

# create `Dockerfile` file and add some content
touch Dockerfile
echo "
FROM ubuntu:latest

MAINTAINER Osman KAYI <osmankayi06@gmail.com>

# update the package lists
RUN apt-get update

# install the Nginx package
RUN apt-get install -y nginx

# move the content of our website to the /var/www/html directory
ADD [ "./index.html", "/var/www/html/" ]

# expose port 80 that Nginx listens on to be accessible through the Docker Networking module
EXPOSE 80

# set the ENTRYPOINT of the image to nginx -g 'daemon off;' to ensure this command is executed when the container starts
ENTRYPOINT nginx -g 'daemon off;'
" > Dockerfile

# build the Docker Image
docker build -t osmankayi/mywebsite:0.1 .

# run the Docker Container
docker run -p 8080:80 osmankayi/mywebsite:0.1

echo "Docker Image ve Docker Container created... You can visit (http://localhost:8080) now!"
