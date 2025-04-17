# Docker 101 🐳 — Step-by-Step Guide for Beginners

![Docker Logo](https://miro.medium.com/v2/resize:fit:476/1*CMRibKVfk9dfLnJHY-2OqQ.png)

**TLDR:** Docker is a widely adopted open-source platform for packaging, deploying, and running applications. This guide introduces key concepts such as Docker, virtualization, containerization, and Docker Machine, providing a practical understanding for beginners.

![Docker GIF](https://miro.medium.com/v2/resize:fit:400/0*BUYxS9FTRRw3IPWY.gif)

## Table of Contents

- **What is Docker?**
- **What is Virtualization?**
- **What is a Virtualization Host?**
- **What is Containerization?**
- **Containerization 🆚 Virtualization**
- **Docker Machine 💻**
- **Docker Architecture 🏗**
- **Typical Local Workflow 🐜**
- **Conclusion 🐳**

## What is Docker?

Docker is an open-source platform designed for packaging, distributing, and running software applications. It leverages container technology to ensure applications run consistently across various infrastructures. Containers allow apps to run in isolated, fully customized environments, minimizing compatibility issues during deployment. Docker’s key advantage lies in enabling fast and secure deployment by bundling all the dependencies in a single package.

Some core features:

- **Scalability** 💯
- **Portability** 💯
- **Fast Deployment & Isolation** 💯

### Story Analogy

Once, a developer struggled with running applications across different environments. Each time, a full reconfiguration was needed, causing inefficiencies. Docker arrived to simplify the process, enabling applications to run consistently across servers without the need for environment-specific configurations.

## What is Virtualization?

Originally, systems only supported a single operating system. Virtualization technology enabled multiple OS instances to run on a single physical machine, utilizing virtual machines (VMs). VMs are isolated environments, each with its own OS, but require significant memory and disk space. Docker, however, optimizes this by sharing the host OS while maintaining isolation.

## What is a Virtualization Host?

A host is a physical machine that runs one or more virtualized OS instances. Virtual machines behave like separate systems, all running on the same host.

## What is Containerization?

Developers used to rely on virtual machines, which consumed many resources. Then came containers, which bundle all necessary app resources in a single isolated environment. Docker simplifies containerization, allowing quick packaging and distribution of applications. Each container runs independently, reducing resource consumption compared to virtual machines.

## Containerization 🆚 Virtualization

Containers are more lightweight and flexible than virtual machines. They are quicker to create and start while maintaining isolation between containers. This makes containers ideal for cloud-based applications, though virtualization still has its uses in many scenarios.

![Container vs. VM](https://miro.medium.com/v2/resize:fit:700/1*snINBI0HUIYa0BWKyCO3Xg.jpeg)

[Learn more about the differences](https://www.weave.works/blog/a-practical-guide-to-choosing-between-docker-containers-and-vms)

## Docker Machine 💻

Docker Machine is a command-line tool used to manage one or more Docker hosts locally or in the cloud. It simplifies creating virtual machines on platforms like VirtualBox, AWS, or Azure, allowing Docker to run on different operating systems seamlessly.

For example, a team using different OS environments can create Docker virtual machines with Docker Machine, ensuring consistent application behavior across platforms.

## Docker Architecture 🏗

Docker uses a client-server architecture. The Docker client handles commands like building, pulling, and running containers. It communicates with the Docker host, which is responsible for managing containers. The two communicate via REST API over UNIX sockets or a network.

![Docker Architecture](https://miro.medium.com/v2/resize:fit:700/1*JuLjOWZwentwAtlItI9U2w.png)

More details on [Docker Architecture](https://www.geeksforgeeks.org/architecture-of-docker/)

## Typical Local Workflow 🐜

Docker workflows typically begin with a `Dockerfile`, which outlines the app’s requirements. From this, an image is created and used to run containers. Containers are isolated environments where applications are executed. Changes within containers can be saved as new images. The final step involves uploading images to a Docker registry for sharing and reuse.

![Docker Workflow](https://miro.medium.com/v2/resize:fit:700/1*O0HZd0LufiJbVGQ9cG6UVQ.png)

This workflow ensures efficient app deployment across different environments, increasing productivity.

## Conclusion 🐳

Docker has become a standard tool in IT for packaging, distributing, and running applications. By leveraging containerization, it enables faster, more efficient deployment while minimizing resource usage and compatibility issues across environments. Docker’s ease of use and powerful features have made it a staple in modern software development.

**Ref:** [Tarık Kaan Koç - Medium](https://medium.com/geeks-of-data/docker-101-yeni-ba%C5%9Flayanlar-i%C3%A7in-ad%C4%B1m-ad%C4%B1m-rehber-253e6b7cb9f6)
