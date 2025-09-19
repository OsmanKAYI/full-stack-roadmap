# CyberPanel Setup Guide

## Creating a Server

1. Go to Digital Ocean and create a new droplet:

   - Click **Create** → **Droplet**
   - Select a location close to your target audience
   - Choose **Ubuntu 22.04 (LTS) x64**
   - Select size:
     - **CPU options** → **Regular** (Disk type: SSD)
   - Add your SSH Keys (if available)
   - Enable Backups (optional)
   - Add improved metrics monitoring and alerting (free)
   - Set a hostname
   - Click **Create Droplet**

2. Once the setup is complete, copy the server IP address

3. Open your terminal and connect to the server:

```bash
ssh root@YOUR_SERVER_IP
apt update && apt upgrade -y
sh <(curl https://cyberpanel.net/install.sh || wget -O - https://cyberpanel.net/install.sh)
```

## Installation Process

Follow the installation prompts:

```text
CyberPanel Installer v2.4.0

1. Install CyberPanel.
2. Exit.

Please enter the number[1-2]: 1

CyberPanel Installer v2.4.0

RAM check : 179/957MB (18.70%)
Disk check : 2/25GB (9%) (Minimal 10GB free space)

1. Install CyberPanel with OpenLiteSpeed.
2. Install Cyberpanel with LiteSpeed Enterprise.
3. Exit.

Install Full service for CyberPanel? This will include PowerDNS, Postfix and Pure-FTPd.
Full installation [Y/n]: y

Full installation selected...

Do you want to setup Remote MySQL? (This will skip installation of local MySQL)
(Default = No) Remote MySQL [y/N]: N

Local MySQL selected...

Press Enter key to continue with latest version or Enter specific version such as: 1.9.4, 2.0.1, 2.0.2...etc

Branch name set to v2.4.0

Please choose to use default admin password 1234567, randomly generate one (recommended) or specify the admin password?
Choose [d]fault, [r]andom or [s]et password: [d/r/s]
Admin password will be provided once installation is completed...

Do you wish to install Memcached process and its PHP extension?
Please select [Y/n]:

Install Memcached process and its PHP extension set to Yes...

Do you wish to install Redis process and its PHP extension?
Please select [Y/n]:

Install Redis process and its PHP extension set to Yes...

Would you like to set up a WatchDog (beta) for Web service and Database service?
The watchdog script will be automatically started up after installation and server reboot
If you want to kill the watchdog, run watchdog kill
Please type Yes or no (with capital Y, default Yes):

Install Watchdog set to Yes...
```

## Post-Installation Setup

1. Log in to CyberPanel:

   - Access `https://YOUR_SERVER_IP:8090`
   - Username: `admin`
   - To set or retrieve the password, use: `adminPass YOUR_PASSWORD`

2. DNS Configuration:

   - Set up an A record for your domain:

     ```text
     yourdomain.com IN A YOUR_SERVER_IP
     ```

3. Verify reverse DNS (rDNS) record on the server:

   ```bash
   dig -x YOUR_SERVER_IP +short
   ```

   Example: `dig -x 111.222.333.444 +short`
