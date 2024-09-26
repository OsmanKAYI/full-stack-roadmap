# A Beginner's Guide to LVM in Linux

**TL;DR:** Learn the basics of LVM (Logical Volume Manager) in Linux to efficiently manage disk space with flexible, dynamic storage options.

The **Logical Volume Manager (LVM)** is a powerful storage management tool in Linux that abstracts physical storage into virtual disks. LVM allows you to easily resize logical volumes, making it a flexible alternative to traditional partitioning.

## What is LVM in Linux?

LVM, introduced by Red Hat in 2001, is now a standard feature in many Linux distributions. It allows you to manage physical storage as virtual disks (logical volumes) that can be resized and managed with ease. LVM works similarly to RAID by pooling multiple physical disks into virtual storage devices.

### Components of LVM

- **Physical Volume (PV):** Actual storage devices like hard drives.
- **Volume Group (VG):** A pool of multiple PVs.
- **Logical Volume (LV):** Virtual partitions within a VG.
- **Physical Extent (PE):** Smallest storage unit in a PV.
- **Logical Extent (LE):** Similar to PEs, but within LVs.
- **Metadata:** Describes the configuration of PVs, VGs, and LVs.

## Installing LVM

To install LVM on Ubuntu or Debian-based systems:

```bash
sudo apt update
sudo apt install lvm2
```

## Creating Partitions

Using `lsblk`, check your disk details. For partitioning, use the `parted` command:

```bash
sudo parted /dev/sdb
```

Commands inside `parted`:

```bash
mklabel gpt
unit GB
mkpart primary 0 8GB
mkpart primary 8GB 16GB
print
quit
```

## Creating Physical Volumes (PV)

To create physical volumes on your partitions:

```bash
sudo pvcreate /dev/sdb1
sudo pvcreate /dev/sdb2
```

List all PVs:

```bash
sudo pvs
```

## Creating a Volume Group (VG)

Create a volume group named `foss_vg`:

```bash
sudo vgcreate foss_vg /dev/sdb1 /dev/sdb2
```

List volume groups:

```bash
sudo vgs
```

To extend a VG with a new drive:

```bash
sudo vgextend foss_vg /dev/sdb3
```

## Creating Logical Volumes (LV)

Create logical volumes:

```bash
sudo lvcreate -L 2048 -n foss_lv_01 foss_vg
sudo lvcreate -L 4096 -n foss_lv_02 foss_vg
```

View LVs:

```bash
sudo lvdisplay
```

## Creating a Filesystem on Logical Volumes

Format the LV with an ext4 filesystem:

```bash
sudo mkfs.ext4 -m 0 /dev/foss_vg/foss_lv_01
```

Mount the filesystem:

```bash
sudo mount /dev/foss_vg/foss_lv_01 /mnt
```

### Extend a Logical Volume

To extend the LV size:

```bash
sudo lvextend -L +1200 /dev/foss_vg/foss_lv_01
sudo resize2fs /dev/foss_vg/foss_lv_01
```

### Remove a Logical Volume

To delete an LV:

```bash
sudo lvremove /dev/foss_vg/foss_lv_01
```

## Auto-Mounting LVs on Boot

Edit `/etc/fstab` to automatically mount the LV at boot:

```bash
sudo nano /etc/fstab
```

Add the following line:

```bash
/dev/foss_vg/foss_lv_01    /mnt    ext4    defaults    0    2
```

Reload systemd:

```bash
sudo systemctl daemon-reload
```

## Conclusion

LVM simplifies storage management in Linux by providing flexible and dynamic disk management capabilities. It allows for easy resizing and management of storage, making it a valuable tool for system administrators and power users alike.

**Ref:** [Abhishek Kumar - It's Foss](https://itsfoss.com/lvm-guide/#creating-physical-volumes-pv)
