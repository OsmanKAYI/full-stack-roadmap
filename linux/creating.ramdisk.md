# Creating a RAM Disk on Ubuntu

A RAM disk is a representation of a hard disk using RAM resources, and it can take the form of a hardware device or a virtual disk. In software, it is basically a block of memory that is being treated as if it were a hard disk drive through the use of dedicated software, which takes a block from the RAM pool and uses it as a dedicated storage area as if it were a hard drive, but with exceedingly faster performance compared to a hard disk.

```BASH
# Create a folder which RamDisk will be mounted
sudo mkdir -p /media/ramdiskk

# Create a 2 GB RamDisk and mount it
sudo mount -t tmpfs -o size=2048M tmpfs /media/ramdiskk/

# Dive into RamDisk
cd /media/ramdiskk/

# Create (1Mb x 1500) file
dd if=/dev/urandom bs=1M count=1500 | split -a 4 -b 1m - file
# 1500+0 records in
# 1500+0 records out
# 1572864000 bytes (1,6 GB, 1,5 GiB) copied, 5,31646 s, 296 MB/s

# Dive into a directory in a hard disk (Since it is SSD, it is fast)
cd /home/$user/Downloads/$filename

# Create (1Mb x 1500) file
dd if=/dev/urandom bs=1M count=1500 | split -a 4 -b 1m - file
# 1500+0 records in
# 1500+0 records out
# 1572864000 bytes (1,6 GB, 1,5 GiB) copied, 7,25158 s, 217 MB/s
```

## Unmount and Remove RAM Disk

```BASH
# Unmount RamDisk from the system
sudo umount /mnt/ramdiskk

# Delete unnecessary directory
sudo rm -rf /media/ramdiskk
```

**Refs:**

- https://ixnfo.com/en/creating-a-ramdisk-on-ubuntu.html
- https://medium.com/@gokhansengun/ram-tabanl%C4%B1-dosya-sistemi-nedir-ve-nerelerde-kullan%C4%B1l%C4%B1r-b32b20afbcbc
