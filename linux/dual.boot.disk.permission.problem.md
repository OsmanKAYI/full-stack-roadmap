# Dual Boot Disk Permission Problem

- If you use dual boot computer with Windows and Linux, and you faced some problem in disk permissions on Ubuntu while trying to reach the disk's content of Windows (Can't Write, Read Only!!!), you should follow the steps below:

- Go to, `Control Panel` | `Hardware and Sound` | `Power Options` | `System Settings` | `Choose What the Power Button Do`.
- Then click on **Change settings that are currently unavailable**.
- Under the **Shut-down settings**, uncheck **Turn on fast start-up (recommended)** option.
  - Why we've done this is to prevent Windows to take control of the disk before Ubuntu while opening. Thanks to this, Ubuntu will get the control on disk and will not be facing any permission problem while writing.

- **If the above itself is not working, go back to your `beautiful :)` ubuntu system.**

## Resolving "Read-only file system" Error

The error `Read-only file system` indicates that the file system mounted at `/mnt/XXX/` is mounted as read-only. To change the permissions, follow these steps:

### 1. Check Current Mount Options

```bash
mount | grep '/mnt/'
```

### 2. Remount the File System with Read-Write Permissions

```bash
sudo mount -o remount,rw /mnt/XXX/
```

### 3. Change the Permissions

```bash
sudo chmod ugo+rwx /mnt/XXX/
```

### 4. Verify the Changes

```bash
ls -ld /mnt/XXX/
```

### Possible Issues if Remounting Fails

- **The underlying device does not support read-write operations** (e.g., a CD-ROM).
- **The file system is configured to be read-only in `/etc/fstab`**.

Check `/etc/fstab` and ensure that the file system is not explicitly set to be read-only. If necessary, edit the file to allow read-write access:

```bash
sudo vi /etc/fstab
```

Find the relevant line and change `ro` to `rw`. Then, remount the file system again:

```bash
sudo mount -o remount /mnt/F272D12672D0F079/
```
