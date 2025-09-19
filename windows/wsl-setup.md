# WSL (Windows Subsystem for Linux)

WSL is a feature of Windows that allows you to run Linux distributions directly on Windows. This provides a real Linux environment on Windows.

## 🛠️ WSL Installation (Windows 10/11)

1. Open PowerShell or CMD as Administrator
2. Run the following command to install WSL:

   ```bash
   wsl --install
   ```

3. Install a Linux distribution (e.g., Ubuntu):

   ```bash
   wsl --install -d Ubuntu
   ```

   This will install WSL and a Linux distribution. Wait for the process to complete.

4. Restart your computer when prompted.
5. Open the "Ubuntu" application from the Start menu.
6. You can now use Linux commands like `apt`, `bash`, `wormhole`, `git`, `curl`, `nano`, etc.

## 🚀 Benefits of WSL

- ✅ Real Linux terminal
- ✅ Package management with `apt`
- ✅ Tools like `bash`, `ssh`, `curl`, `nano`, `vim`
- ✅ Easy file sharing between Windows and Linux
- ✅ Doesn't affect your Windows installation

### Example Commands

```bash
apt update
snap install wormhole
```

### Accessing Windows Files

```bash
/mnt/c/Users/$USER/Desktop
```

## Example: Sending Files with Wormhole

```bash
wormhole send /mnt/c/Users/$USER/Desktop/example.txt
```

## 📌 Summary

- 📦 WSL installs like a regular program and doesn't modify system settings
- 🗑️ You can uninstall it anytime:

  ```bash
  wsl --unregister <distro>  # e.g., wsl --unregister Ubuntu
  ```

Or disable it via Windows Features.
