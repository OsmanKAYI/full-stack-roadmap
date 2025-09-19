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

## Install CapCut.exe via [CapCut Installer v0.1.2.6](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa2RSQTZ5QjRiSTNBdFZsRjJUTFpEZ3lJb1BDZ3xBQ3Jtc0ttQTJFMU1fZWR0b2JNcXBrWHc4QzdtMkd3WDBBNmNwd2dZUWhCU0J6aXlzdm1HRXd2S04xS0hzMUNhUHIxSlJLR1ltRUlNNGlHcEdOaEdpcDVQSnFBTUJNMDBNZC1nQUFOREIyX0VtQVZVWFBsZFp4WQ&q=https%3A%2F%2Flf16-capcut.faceulv.com%2Fobj%2Fcapcutpc-packages-us%2Fpackages%2FCapCut_1_0_4_58_capcutpc_0.exe&v=p05u2trbo44)

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
