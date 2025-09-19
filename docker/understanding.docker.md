# Understanding Docker

## TL;DR

- **Docker**: An open-source platform for automating application deployment and management using containerization.
- **Docker Image**: A lightweight, immutable software package containing everything needed to run an application, built in layers for efficient storage.
- **Docker Container**: A runtime instance of an image, providing a lightweight and isolated environment for applications.
- **Storage**: Images and containers are stored under `/var/lib/docker/` in the Docker daemon's storage.
- **Docker Volume**: A persistent storage mechanism that allows data sharing between containers, retaining data even if containers are removed.

### Key Commands for Docker Volumes

- **Create a Volume**: `docker volume create my_volume`
- **Run a Container with a Volume**: `docker run -d -v my_volume:/data my_image`
- **List Volumes**: `docker volume ls`
- **Inspect a Volume**: `docker volume inspect my_volume`
- **Remove a Volume**: `docker volume rm my_volume`

Understanding these concepts is essential for efficient application deployment and data management in Docker.

## What is Docker?

Docker is an open-source platform that enables developers to automate the deployment, scaling, and management of applications using containerization. It allows applications to be packaged along with their dependencies into containers, which can run consistently across different environments.

## What is a Docker Image?

- **Definition:** A Docker image is a lightweight, standalone, and executable software package that includes everything needed to run an application: the code, runtime, libraries, environment variables, and configuration files.
- **Immutable:** Images are immutable, meaning they do not change once created. You can create new images by building on top of existing images.
- **Layered Structure:** Images are built in layers, allowing for efficient storage and sharing. Each layer represents a change or addition to the image.

## What is a Docker Container?

- **Definition:** A Docker container is a runtime instance of a Docker image. It is a lightweight, portable, and isolated environment where applications can run.
- **Ephemeral Nature:** Containers are usually transient and can be started, stopped, and deleted. Changes made to a running container do not affect the original image, although you can create new images from a container.
- **Isolation:** Containers provide process isolation, meaning applications running in containers do not interfere with each other.

## Where are Images and Containers Stored?

- **Images Storage:** Docker images are stored in the Docker daemon's storage, typically under `/var/lib/docker/image`. The actual directory structure may vary depending on the storage driver used.
- **Containers Storage:** When you create a container from an image, the container's filesystem is layered on top of the image's filesystem. The container's changes are stored in a separate writable layer, also under `/var/lib/docker/containers/`.

## Directory Breakdown in `/var/lib/docker`

1. **buildkit:** Contains data related to Docker BuildKit, which enhances the image build process.
2. **containers:** Holds information about running and stopped containers, including logs and metadata.
3. **engine-id:** Contains the unique ID of the Docker engine instance.
4. **image:** Stores Docker images and metadata about them.
5. **network:** Contains data about Docker networks and their configurations.
6. **overlay2:** Used for images and containers when the OverlayFS storage driver is utilized, storing layered filesystems.
7. **plugins:** Stores Docker plugins that extend Docker functionalities.
8. **runtimes:** Contains information about different runtimes available for Docker containers (e.g., runc).
9. **swarm:** Holds data related to Docker Swarm for managing clusters of Docker hosts.
10. **tmp:** Used for temporary files during Docker operations.
11. **volumes:** Contains Docker volumes used for persistent storage that can be shared between containers.

## How to Start Docker Containers

```bash
docker-compose up -d
# -d for detached (or deamon mode) to run in background
```

## How to Stop Docker Containers

```bash
docker-compose down
```

## How to Check Running Docker Containers

```bash
docker ps
```

## What is a Docker Volume?

Docker Volume is a persistent storage mechanism that manages and shares data between containers. Key features include:

- **Persistence:** Data in a volume is retained even if the container is removed.
- **Sharing Data:** Volumes can be shared between multiple containers, allowing them to access the same data.
- **Performance:** Volumes can be optimized by Docker for better performance compared to container filesystem storage.
- **Decoupling Data from Containers:** Volumes allow you to separate application logic from data, making containers more modular.
- **Backup and Restore:** Volumes can be easily backed up and restored.
- **Management:** Docker provides commands to create, inspect, and manage volumes.

### Creating and Using Docker Volumes

- **Create a Volume:**

```bash
docker volume create my_volume
```

- **Run a Container with a Volume:**

```bash
docker run -d -v my_volume:/data my_image
```

- **List Volumes:**

```bash
docker volume ls
```

- **Inspect a Volume:**

```bash
docker volume inspect my_volume
```

- **Remove a Volume:**

```bash
docker volume rm my_volume
```

## Conclusion

Docker provides a powerful framework for developing and managing applications using containers. Understanding the roles of images, containers, and volumes is crucial for efficient application deployment and data management. If you have any further questions or need additional information, feel free to ask!

## Summary

- Docker is a containerization platform.
- Docker Images are read-only templates used to create containers.
- Docker Containers are instances of images that run the applications.
- Both images and containers are stored in the Docker daemon's storage, typically under /var/lib/docker/.
