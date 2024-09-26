# Manage Disk Storage with LVM

Linux operating systems use a storage management system called LVM (Logical Volume Manager). LVM allows you to manage disk partitions and logical volumes. This facilitates operations such as disk expansion, size changes and data management.

The scenario is as follows; There is a Virtual Machine(VM) with a 60GB disk on Ubuntu. There is 60GB of space available and it is in LVM.

**NOTE:** There is a difference between LVM expansion and expanding a non-LVM disk.

We want to increase the 60GB space to 100GB. First, since the scenario is a VM, we add 40GB to the existing disk and start the VM. We open the VM and log in.

- The first command is `cfdisk`.
- Hover over the disk to be extended and select **Resize** below.
- The disk was expanded to 100G. After this operation the change is saved using the menu below by selecting **Write**.
- This is followed by the following command. This command extends the physical volume.
  - `pvresize $discName`
- Checking with the `vgdisplay` command shows that disk expansion is not yet reflected here.
- Using the `Lvextend` command, additional disk space can be added to the LVM logical volume, thus increasing the size of the logical volume. This is done with the following command.
  - `lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv`
- The last command `resize2fs` is a command used in Linux operating systems and is used to resize EXT2, EXT3 or EXT4 file systems.
  - `resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv`
- Checking with the `df -h` command shows that the disk is expanding.

**Ref:** https://www.cozumpark.com/linuxta-disk-genisletme-kilavuzu-lvm-ile-depolama-alaninizi-yonetme/
