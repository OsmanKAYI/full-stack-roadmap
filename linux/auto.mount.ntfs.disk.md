# Auto-Mounting an NTFS Disk at Boot on Ubuntu

## TL;DR

To automatically mount an NTFS disk at startup on Ubuntu, you need to configure `/etc/fstab` with the correct UUID and settings. Below are the steps to achieve this.

## Steps

1. **Find the Disk's UUID**  
   Run the following command to find the UUID of your NTFS partition:

   ```bash
   sudo blkid
   ```

   Locate the UUID for your disk (e.g., `/dev/sda1`) from the output.

2. **Create a Mount Point**  
   Create a directory where the disk will be mounted. For example:

   ```bash
   sudo mkdir /media/$USER
   ```

3. **Edit `/etc/fstab`**  
   Open the `/etc/fstab` file to add the new mount entry:

   ```bash
   sudo nano /etc/fstab
   ```

4. **Add the Disk to `/etc/fstab`**  
    Add the following line to `/etc/fstab` to ensure your NTFS disk mounts at boot:

   ```bash
   UUID=F272D12672D0F079 /media/$USER ntfs-3g defaults,nofail,x-systemd.automount 0 0
   ```

   - `F272D12672D0F079`: UUID of the disk.
   - `/media/$USER`: The mount point you created.
   - `ntfs-3g`: NTFS file system type.
   - `defaults,nofail,x-systemd.automount`: Mount options to ensure safe mounting and boot process.

   **NOTE:** If it's an ext4 partition, use `ext4` instead of `ntfs-3g` and remove `x-systemd.automount`:

   ```bash
   UUID=xxxx-xxxx /mnt/mydisk ext4 defaults,nofail 0 2
   ```

5. **Test the Configuration**  
   Run the following command to test if the configuration works:

   ```bash
   sudo mount -a
   ```

   If there are no errors, the disk should now mount automatically on boot.

6. **Reboot the System**  
   Reboot the system:

   ```bash
   sudo reboot
   ```

Now, the disk should be automatically mounted when the system starts, and any bookmarks pointing to that disk will work right away without manually mounting it.
