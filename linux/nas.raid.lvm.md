# Combine Different Disks into a Single Disk

Hard disks which have different sizes and interfaces (IDE, SATA, etc.) can be merged and used as one disk.

**For example**, instead of having 3 disks with a size of 250GB, 750GB, and 2TB, it is possible to have 1 disk with a size of 3TB.

## What is NAS?

In Linux, NAS stands for "Network Attached Storage". It refers to a type of storage solution that allows multiple users and devices to access shared storage resources over a network.

With a NAS system, a dedicated storage device (often a server or a network-attached storage appliance) is connected to a local network, and it provides file storage services to other devices on the network. This allows users to easily access and share files and folders from anywhere on the network, without the need for physically connecting to the storage device.

NAS systems can be configured in various ways, such as using different network protocols and file systems. Some popular protocols used in NAS systems include NFS (Network File System), SMB/CIFS (Server Message Block/Common Internet File System), and AFP (Apple Filing Protocol). Different file systems like ext4, XFS, or btrfs can also be used to format the storage space in a NAS system.

Overall, NAS provides a convenient and centralized way of managing and sharing files across a network, and it is widely used in both home and enterprise environments.

## What is RAID?

RAID (Redundant Array of Independent Disks) is a method used in Linux (and other operating systems) to increase the performance, reliability, and capacity of data storage.

RAID uses multiple hard drives to create a single logical unit, which appears to the operating system as a single drive. The data is distributed across the drives in a way that improves performance and/or provides redundancy.

There are several RAID levels, including:

1. RAID 0: Also known as striping, this level distributes data evenly across multiple disks to increase performance. However, it does not provide redundancy, so if one disk fails, all data is lost.

2. RAID 1: Also known as mirroring, this level creates an exact copy of data on each disk. This provides redundancy in case one disk fails, but it does not improve performance.

3. RAID 5: This level distributes data and parity information across multiple disks, providing both performance and redundancy. If one disk fails, the parity information can be used to rebuild the missing data.

4. RAID 6: This is similar to RAID 5, but it uses an additional parity block, providing greater redundancy.

In Linux, RAID can be implemented using software or hardware. Software RAID is implemented by the Linux kernel itself, while hardware RAID uses a dedicated RAID controller.

## What is LVM?

LVM (Logical Volume Manager) is a disk management system used in Linux systems. LVM partitions the physical partitions on disks into logical units, making these units more flexible and manageable. This way, partitions on disks can be further improved by adding more features.

Using LVM, you can combine different disks into a single logical unit, creating a larger storage space. Additionally, you can increase, resize or remove the size of logical units.

While making disk management more flexible and manageable, LVM performs a backup process to prevent data loss on disks during the partitioning process. This way, you can safely store and manage your data.

## Example of Using LVM for 3x500GB Disks into Single 1.5TB Disk

For example, you can create a single logical unit (1.5TB in total) using LVM for 3 500GB disks. You can follow the steps below:

- Identify your disks in the system. You can use the `sudo fdisk -l` command for this.
- Convert your disks into physical units. You can do this using the `sudo pvcreate /dev/sda /dev/sdb /dev/sdc` command. Here, **/dev/sda**, **/dev/sdb** and **/dev/sdc** represent your disks.
- Combine the physical units. You can do this using the `sudo vgcreate myvg /dev/sda /dev/sdb /dev/sdc` command. **myvg** represents the name of the unit you have created.
- Create a logical unit. You can do this using the `sudo lvcreate -l 100%VG -n mylv myvg` command. Here, **mylv** represents the name of the logical unit you have created.
- Format the logical unit. You can do this using the `sudo mkfs.ext4 /dev/myvg/mylv` command. Here, **ext4** represents the file system type.
- Mount the logical unit to the system. To do this, create a directory and mount the logical unit to this directory. For example, you can create a directory named **mydata** using the `sudo mkdir /mnt/mydata` command and mount the logical unit to this directory using the `sudo mount /dev/myvg/mylv /mnt/mydata` command.

After completing these steps, you will have created a single logical unit consisting of 3 500GB disks. You can store and manage your files on this unit.

#### Commands Required for This Process:

```bash
sudo fdisk -l # Identifying disks
sudo pvcreate /dev/sda /dev/sdb /dev/sdc   # Creating physical units
sudo vgcreate myvg /dev/sda /dev/sdb /dev/sdc    # Combining physical units
sudo lvcreate -l 100%VG -n mylv myvg    # Creating a logical unit
sudo mkfs.ext4 /dev/myvg/mylv    # Formatting the logical unit
sudo mkdir /mnt/mydata    # Creating a directory
sudo mount /dev/myvg/mylv /mnt/mydata    # Mounting the logical unit to the system
```
