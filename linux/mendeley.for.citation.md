# Mendeley

​Mendeley is a reference manager and academic social network that can help you organize your research, collaborate with others online, and discover the latest research. Use Mendeley to: Automatically generate bibliographies. Collaborate easily with other researchers online.

## Install Mendeley Reference Manager

### Step 1: Install Flatpak

First, you need to install Flatpak on your Ubuntu system. Open your terminal and run the following command:

```bash
sudo apt install flatpak -y
```

### Step 2: Add Flathub Repository

Next, you'll add the Flathub repository, which hosts a large collection of Flatpak applications:

```bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### Step 3: Install Mendeley Desktop

Now, you can install Mendeley Desktop using Flatpak:

```bash
sudo flatpak install flathub com.elsevier.MendeleyDesktop -y
```

### Step 4: Launching Mendeley Desktop

To launch Mendeley Desktop, you can use the following command:

```bash
flatpak run com.elsevier.MendeleyDesktop
```

**NOTE:** When you reboot your system, Mendeley Icon will be shown on your apps list.

**Ref:** [Linux Made Simple](https://www.linuxmadesimple.info/2024/08/how-to-install-mendeley-desktop-on.html)
