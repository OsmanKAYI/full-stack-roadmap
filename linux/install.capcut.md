# How to Install CapCut on Ubuntu 24.04

CapCut, formerly internationally known as ViaMaker, is a Chinese short-form video editing app developed by ByteDance.

> Run each command step by step and check for errors in the terminal. Some of the troubleshooting steps below are **only needed if you hit Wine-related problems**.

## Install Lutris

Lutris is a free, open-source, cross-platform, and free-to-play video game launcher.

```bash
sudo apt update
sudo apt upgrade
sudo apt install libgl1-mesa-dri libglx-dev -y
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo apt update
sudo apt install lutris -y
```

**Ref:** [Lutris - GitHub](https://github.com/lutris/lutris/releases)

## Install CapCut.exe (latest) from official website

- Download the latest CapCut PC version from the official website:

  - Page: <https://www.capcut.com/tools/video-editor-download>
  - Direct Windows download link ("Download for free" button):
    - <https://www.capcut.com/activity/download_pc?__download_from__=download_pc2&from_page=a1.b5.0.0&enter_from=content_section>

- Optionally, you can use the following video as a reference for the steps: [Linux Brother - YouTube](https://www.youtube.com/watch?v=gT78ArWu5Eo)

### 1. Download the CapCut installer

- Download the `CapCut_...exe` file using the link above.
- Note the path where you saved it, for example: `~/Downloads/CapCut_1_0_4_58_capcutpc_0.exe`.

### 2. Open Lutris and add a new Windows application

1. Launch **Lutris** from your application menu.
2. Click the **`+` (Add Game)** button in the top-left corner.
3. In the window that opens, select **Add locally installed game**.
4. In the **Name** field, enter `CapCut`.
5. Make sure the **Runner** is set to **Wine**.

### 3. Select the CapCut installer .exe file

1. In the same window, go to the **Game options** tab.
2. In the **Executable** field, click **Browse** and select the `CapCut_...exe` file you downloaded.
3. (Optional) In the **Wine prefix** field, you can use the default prefix or select a new folder, for example: `~/.wine-capcut`.

Kaydetmek için **Save** / **Add** butonuna tıkla. Lutris ana ekranında artık `CapCut` diye bir giriş göreceksin.

### 4. Run the installer and complete the setup

1. In the Lutris main screen, **double-click** the `CapCut` entry or right-click and choose **Play**.
2. The normal CapCut installation wizard (as in Windows) should open.
3. Accept the license agreement and follow the **Next** / **Install** steps.
4. When the installation finishes, close the installer window.

Once the installation is complete, CapCut will be installed inside the Wine prefix you used.

### 5. Running CapCut again

- You can open CapCut any time by using the `CapCut` entry in Lutris.
- If Lutris starts asking for the installer .exe again instead of running CapCut:
  - Right-click the `CapCut` entry → **Configure**.
  - In **Game options → Executable**, select the actual CapCut executable (e.g. `CapCut.exe`).

## Troubleshooting Wine issues

If you have any Wine-related issues during installation or while running CapCut, you can try the following steps.

1. **Totally delete Wine** (this will remove existing Wine installations and apps depending on them):

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

4. **Install missing 32-bit libraries (only if error message mentions them)**:

   For example, if `libgd3:i386` is reported as missing, install it directly:

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

7. **If issues still continue**:

   - Check the official WineHQ documentation for Ubuntu (including 24.04) for the most up-to-date repository and installation instructions:
     - `https://wiki.winehq.org/Ubuntu`

Using the official WineHQ instructions instead of old PPAs usually resolves stubborn Wine32 dependency problems on newer Ubuntu releases.

## Wine setup steps used in this document (chronological)

Below is the **64-bit WineHQ path that got us closest to a working setup**, listed step by step.

1. **Completely remove any existing Wine installation**

   ```bash
   sudo apt purge wine* -y
   sudo apt autoremove --purge -y
   ```

2. **Enable multi-arch support and install basic 32-bit libraries**

   ```bash
   sudo dpkg --add-architecture i386
   sudo apt update
   sudo apt --fix-broken install
   sudo apt install libgd3:i386 -y
   ```

3. **Add the official WineHQ repository (Ubuntu 24.04 "noble") and install WineHQ stable**

   ```bash
   sudo mkdir -pm755 /etc/apt/keyrings
   sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
   sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources

   sudo apt update
   sudo apt install --install-recommends winehq-stable -y
   wine --version  # çıktıda wine-10.0 görüldü
   ```

4. **Create a clean 64-bit prefix with WineHQ (`.wine-capcut64`)**

   ```bash
   rm -rf "$HOME/.wine-capcut64"
   WINEPREFIX="$HOME/.wine-capcut64" wineboot --init
   ```

5. **Run the new CapCut installer directly with Wine in the 64-bit prefix**

   ```bash
   WINEPREFIX="$HOME/.wine-capcut64" wine "$HOME/Downloads/CapCut_7579977665915158529_installer.exe"
   ```

6. **(Optional) Run the same installer through Lutris using its own Wine runner**

   Lutris log'unda görülen komut:

   ```bash
   gamemoderun /home/osman/.local/share/lutris/runners/wine/wine-ge-8-26-x86_64/bin/wine \
     /home/osman/Downloads/CapCut_7579977665915158529_installer.exe
   ```

The common outcome of all the steps above: the installer successfully connects to the internet (HTTP 200 OK, JSON response), but the GUI progress bar stays stuck at 0%.

## Known Issues & Alternatives

Despite all Wine/Lutris attempts described in this document, the following issues occurred and could not be resolved in a stable way:

- **`pc_not_support_version`** error (with older CapCut installer versions).
- **"32 Bit or WinXP system not supported!!"** error (the installer treats the Wine environment as 32-bit or an old Windows version and refuses to run).
- Even with WineHQ 10.0 + a clean 64-bit prefix (`~/.wine-capcut64`), the installer **remains stuck at 0% progress**.
- The same behavior is observed when using Lutris with its `wine-ge-8-26-x86_64` runner.

These symptoms indicate that the Ubuntu 24.04 + Wine + latest CapCut PC version combination is **unstable / incompatible** and, in practice, cannot be reliably installed at the moment.

This note is written to guide anyone who wants to try the same steps in the future and to serve as a reference point in case someone manages to improve this process and reach a working solution.
