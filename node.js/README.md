# Node.js

Node.js is an open-source, cross-platform JavaScript runtime environment that allows developers to build server-side and networking applications. It uses an event-driven, non-blocking I/O model, making it lightweight and efficient, perfect for building scalable web applications.

## Features

- **Asynchronous and Event-Driven**: Node.js uses non-blocking, event-driven architecture, making it suitable for building highly scalable and performant applications.
- **Cross-Platform**: Node.js runs on various platforms including Windows, macOS, and Linux, providing flexibility for developers.
- **Vast Ecosystem**: Node.js has a rich ecosystem of packages available through npm, allowing developers to easily extend the functionality of their applications.
- **Community Support**: Node.js has a large and active community of developers who contribute to its development, provide support, and share knowledge.

## Installaing Node.js with NVM

NVM is a Node.js version manager. It allows you to install and switch between different versions of Node.js. To see what is the latest version, visit [nvm-sh on Github](https://github.com/nvm-sh/nvm/releases).

```bash
# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# start nvm
source ~/.bashrc
# list remote versions
nvm ls-remote
# install latest node version
nvm install node  # "node" is an alias for the latest version
nvm use v20.11.0 # if you want to use specific version
nvm use v20.11.0 --default # if you want to use specific version as default
```

## Documentation

The official Node.js documentation provides comprehensive guides, APIs reference, and tutorials. You can access it [here](https://nodejs.org/en/docs/).

- [What is Node.js & Where to Use It?](./what.is.node.js.md)
- [Node.js Version Switch](./node.version.switch.md)
