#!/bin/bash

# Project directory
PROJECT_DIR="my-lamp-project"

# Create directory
mkdir -p $PROJECT_DIR/html

# Create docker-compose.yml file
cat <<EOL > $PROJECT_DIR/docker-compose.yml
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
      MYSQL_ROOT_PASSWORD: root                        # MySQL root user password
      # MYSQL_DATABASE: mydatabase                     # Database name to be created (if desired)
      # MYSQL_USER: user                               # Username to be created (if desired)
      # MYSQL_PASSWORD: userpassword                   # Password for the user (if desired)
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
EOL

# Create a simple PHP file
echo "<?php phpinfo(); ?>" > $PROJECT_DIR/html/index.php

# Start Docker containers
cd $PROJECT_DIR
docker-compose up -d

echo "LAMP and Adminer environment setup is complete. Visit http://localhost:8080 and http://localhost:8081 in your browser."
