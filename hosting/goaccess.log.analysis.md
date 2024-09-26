# Analyse Web Server Logs with GoAccess

GoAccess is an open source **real-time web log analyzer** and interactive viewer that runs in a **terminal** on \*nix systems or through your **browser**. It provides **fast** and valuable HTTP statistics for system administrators that require a visual server report on the fly. More info at: [https://goaccess.io](https://goaccess.io/?src=gh).

```bash
sudo apt install goaccess -y
```

**Note:** It is likely this will install an outdated version of GoAccess. To make sure that you're running the latest stable version of GoAccess see alternative option below.

## Official GoAccess Debian & Ubuntu repository

```bash
wget -O - https://deb.goaccess.io/gnugpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/goaccess.gpg &gt;/dev/null
echo "deb [signed-by=/usr/share/keyrings/goaccess.gpg arch=$(dpkg --print-architecture)] https://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/goaccess.list
sudo apt-get update
sudo apt-get install goaccess -y
```

- See the official GitHub page: [goaccess - GitHub](https://github.com/allinurl/goaccess)
