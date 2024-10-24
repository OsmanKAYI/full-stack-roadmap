# How to Install CapCut on Ubuntu 24.04

CapCut, formerly internationally known as ViaMaker, is a Chinese short-form video editing app developed by ByteDance.

## Instal Lutris

Lutris is a free, open-source, cross-platform, and free-to-play video game launcher.

```bash
sudo apt install libgl1-mesa-dri libglx-dev
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo apt update
sudo apt install lutris
```

**Ref:** [Lutris - GitHub](https://github.com/lutris/lutris/releases)

## Install CapCut.exe via [CapCut Installer v0.1.2.6](https://lf16-capcut.faceulv.com/obj/capcutpc-packages-us/installer/capcut_capcutpc_0_1.2.6_installer.exe)

- All the steps are explained in this video [Linux Brother - YouTube](https://www.youtube.com/watch?v=gT78ArWu5Eo)

**NOTE:** If you have any wine related issues, please follow the steps below:

1. **Totaly delete wine**:

   ```bash
   sudo apt purge wine* -y
   ```

2. **Enable multi-architecture support** (if not already done):

   ```bash
   sudo dpkg --add-architecture i386
   sudo apt update
   ```

3. **Fix broken packages**:

   Use the following command to try and repair broken dependencies:

   ```bash
   sudo apt --fix-broken install
   ```

4. **Install the required dependencies manually**:

   Since `libgd3:i386` is missing, attempt installing it directly:

   ```bash
   sudo apt install libgd3:i386
   ```

5. **Install Wine32**:

   After fixing the dependencies, retry installing `wine32`:

   ```bash
   sudo apt install wine32
   ```

6. **Check for held packages**:

   If the problem persists, check if any packages are being held:

   ```bash
   sudo apt-mark showhold
   ```

   To unhold any package:

   ```bash
   sudo apt-mark unhold <package-name>
   ```

**Additional Step:** If the above steps don't work, **Try using an alternative repository**:

```bash
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt update
sudo apt install wine32
```

This should resolve the dependency issues and allow you to install Wine32.
