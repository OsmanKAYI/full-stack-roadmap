# Install NVIDIA Drivers on Ubuntu 22.04

```bash
ubuntu-drivers devices             # to detect the model of nvidia graphic card
sudo ubuntu-drivers autoinstall     # to autoinstall recommended drivers
sudo apt install nvidia-driver-470  # to install specific version of nvidia drivers
sudo reboot                         # to restart your system
```

**NOTE:** In my case, `nvidia-driver-470` solved my problem but it may (most probably, will) be subjected to change. You should be looking for missing type of driver on your system.

**Ref:** [linuxconfig.org](https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04)
