# Create Your Own VPN (Virtual Private Server) Server

A VPN is a mechanism for creating a secure connection between a computing device and a computer network, or between two networks, using an insecure communication medium such as the public Internet.

- **Step 1:** You need to have a remote server and connect it as follows.

```bash
ssh $username@$ipAdress -D 8080
```

- **Step 2:** You need to configure the settings on browser as follows.
  - Go to **Settings**.
  - Under **Network Settings**, click on **Settings...**.
  - Choose **Manual proxy configuration**.
  - Fulfill the **SOCKS Host** as **localhost** and **Port** as **8080**.
    - Be sure that **SOCKSv5** is selected.
