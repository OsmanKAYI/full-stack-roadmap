# How to Fix Broken System Time on Linux

```bash
# to set timezone as Istanbul
sudo timedatectl set-timezone Europe/Istanbul

# to choose timezone manually: sudo dpkg-reconfigure tzdata

# to setup auxiliary packages
sudo apt-get install ntp ntpdate -y

# to setup NTP server
sudo ntpdate ntp.ubuntu.com

# to get timezone and current time
timedatectl status
```
