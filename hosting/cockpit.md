# Cockpit

Cockpit is an interactive server admin interface. It is easy to use and very lightweight. Cockpit interacts directly with the operating system from a real Linux session in a browser. For more information, visit [cockpit's github page](https://github.com/cockpit-project/cockpit).

You can [install Cockpit](https://cockpit-project.org/running.html) on many Linux operating systems including Debian, Fedora and RHEL.

## Ubuntu Installation

```BASH
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit
```

After that, type `localhost:9090` on your browser and login with your system's username and password.
