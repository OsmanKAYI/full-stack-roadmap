# Changing Disk Permissions in Linux

```bash
lsblk
sudo mount -o remount,rwx <mountpoint>
```

- Ex:

`lsblk`

```bash
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0    7:0    0     4K  1 loop /snap/bare/5
loop1    7:1    0    55M  1 loop /snap/core18/1705
loop2    7:2    0 248,8M  1 loop /snap/gnome-3-38-2004/99
loop3    7:3    0 164,8M  1 loop /snap/gnome-3-28-1804/161
loop4    7:4    0 247,9M  1 loop /snap/gnome-3-38-2004/87
loop5    7:5    0  43,6M  1 loop /snap/snapd/14978
loop6    7:6    0   219M  1 loop /snap/gnome-3-34-1804/77
loop7    7:7    0  55,5M  1 loop /snap/core18/2284
loop8    7:8    0  54,2M  1 loop /snap/snap-store/558
loop9    7:9    0  60,9M  1 loop /snap/gmail-desktop/16
loop10   7:10   0  65,2M  1 loop /snap/gtk-common-themes/1519
loop11   7:11   0 240,8M  1 loop /snap/gnome-3-34-1804/24
loop12   7:12   0  61,9M  1 loop /snap/core20/1270
loop13   7:13   0  62,1M  1 loop /snap/gtk-common-themes/1506
loop14   7:14   0  49,8M  1 loop /snap/snap-store/433
loop15   7:15   0  61,9M  1 loop /snap/core20/1328
sda      8:0    0 111,8G  0 disk
├─sda1   8:1    0   512M  0 part /boot/efi
└─sda2   8:2    0 111,3G  0 part /
sdb      8:16   0 698,7G  0 disk
├─sdb1   8:17   0   549M  0 part
└─sdb2   8:18   0 698,1G  0 part /media/osman/Yeni Birim
```

`sudo mount -o remount,rwx /media/osman/Yeni Birim -R`
