# External Harddisk Detected But Not Mounting

If you connect any external harddisk and get an errorof 'External harddisk detected but not mounting', you can solve it by following the commands below.

```BASH
# Install ntfs-3g
sudo apt install ntfs-3g -y

# Run fdisk -l to figure out where the mount point is
sudo fdisk -l

# Run ntfsfix for mount_point Örnek: /dev/sdc
sudo ntfsfix -b /dev/sd[X]
```

**Ref:** https://askubuntu.com/a/1043399/372193
