# Data Recovery

Data recovery is the process of retrieving lost or deleted data from various storage devices such as hard disk drives, solid-state drives, USB flash drives, memory cards, and other electronic storage media. The data recovery process involves accessing and extracting data that has been lost, corrupted, or deleted due to various reasons such as hardware failures, software errors, accidental deletion, and virus infections.

## How to Recover Deleted Files

It is important to note that data recovery is not always possible, especially if the data has been overwritten or the storage device is severely damaged. Therefore, it is always recommended to backup important data regularly to prevent data loss.

**Ref:** https://askubuntu.com/questions/3883/how-to-recover-deleted-files

**What can I do to recover deleted files from my USB drive?**

To recover your deleted files, you can follow these steps:

- Stop using the USB drive immediately and do not perform any actions on it. If you write new data on it, you may overwrite the deleted files, making the recovery process more difficult.
- Install file recovery software on Ubuntu. You can use free tools like "testdisk" or "photorec" for this purpose. These tools are usually available in the Ubuntu package manager, so you can install them by using the following command in the terminal: `sudo apt install testdisk`
- Reconnect the USB drive and run testdisk or photorec. These tools will scan the USB drive for deleted files and show recoverable files.
- Select the files to be recovered and start the recovery process. The recovery of files may take a few minutes or hours, so be patient.
- Store the recovered files in a different location as saving them back to the same USB drive may risk deleting the previously lost files.

It is possible to recover your files using this method. However, it should be noted that some files may not be recoverable, or the recovered files may be corrupted. Additionally, the importance of backing up data on USB drives has been emphasized once again.

**What programs can be used to recover deleted files on Ubuntu?**

There are several different programs available to recover deleted files on Ubuntu. Some of these programs are listed below:

- [TestDisk](#detailed-information-for-testdisk) -- [Project Website](https://www.cgsecurity.org/wiki/TestDisk)
- [PhotoRec](#detailed-information-for-photorec) -- [Project Website](https://www.cgsecurity.org/wiki/PhotoRec)
- [Scalpel](#detailed-information-for-scalpel) -- [Project Website](https://github.com/sleuthkit/scalpel)
- [Foremost](#detailed-information-for-foremost) -- [Project Website](https://github.com/gerryamurphy/Foremost)
- [extundelete](#detailed-information-for-extundelete) -- [Project Website](https://github.com/cherojeong/extundelete)

Among these programs, TestDisk and PhotoRec are the most popular. Besides these, Ubuntu may have other file recovery tools that you can use. However, an important point to remember is that deleted files should not be overwritten. If overwritten, recovering deleted files may become much more difficult or unrecoverable.

## TestDisk & PhotoRec

```BASH
# testdisk package contains PhotoRec and TestDisk packages
sudo apt install testdisk
```

## Foremost

I have used foremost to recover damaged hard disk both under NTFS (windows), FAT32 (Flashcard from a Nokia phone), and ext3 with great results. Command-line only, but quite it's easy, something like this:

```BASH
# Installing the package
sudo apt install foremost

# Recover all deleted files in the specified .img file
foremost img_file.img

# Recover a disk with everything inside of it
sudo foremost -i /dev/sda -o /path/to/output/diretory/directoryname

# Recovering deleted mp4 and jpg files in the specified .img file
foremost -i img_file.img -t mp4,jpg  -o /path/to/output/diretory/directoryname

# Recovering deleted png, mp4 and pdf files in a disk
sudo foremost -v -t png,mp4,pdf -i /dev/sda1  -o /path/to/output/diretory/directoryname -T
```

**Refs:**

- https://github.com/jonstewart/foremost
- https://linuxconfig.org/how-to-recover-deleted-files-with-foremost-on-linux
- https://www.section.io/engineering-education/recover-deleted-files-with-foremost/

## Scalpel

- You can find **Scalpel Type Signatures** [here](https://gist.github.com/cfgnunes/134c0e9bf6553fad62770f82a3c1e652).

```BASH
# create the .IMG file of the USB content that we will recover
sudo dd if=/dev/sdb of=~/$filename.img status=progress

# install the Scalpel package
sudo apt install scalpel

# open the Scalpel configuration file
# delete the '#' character at the beginning of the lines for the file types we want to perform recovery on
# save the file and exit
sudo vi /etc/scalpel/scalpel.conf

# recover the desired file types from the .IMG file using the configuration file
# -o is the folder name where the recovered files will be written (be sure that it is empty)
cd /path/to/output/diretory/
scalpel -c /etc/scalpel/scalpel.conf -o /path/to/output/diretory/ /path/to/location/of/img/file/$filename.img
```

#### mp4 Video Recovery Settings for Scalpel (for ~9.5GB File)

**/etc/scalpel/scalpel.conf** file content:

```
mp4 y 9500000000 # MPEG-4 video files
mp4 y 9500000000 \x00\x00\x00\x18\x66\x74\x79\x70\x69\x73\x6F\x6D # MPEG-4 video files
asf y 9500000000 \x30\x26\xB2\x75\x8E\x66\xCF\x11\xA6\xD9\x00\xAA\x00\x62\xCE\x6C
mpg y 9500000000 \x00\x00\x01\xb3 \x00\x00\x01\xb7
mpg y 9500000000 \x00\x00\x01\xba \x00\x00\x01\xb9
avi y 9500000000 RIFF????AVI\x20LIST
flv y 9500000000 FLV\x01
mp4 y 9500000000 ????ftypM4A
mp4 y 9500000000 ????ftypisom
mp4 y 9500000000 ????ftypmp42
m4v y 9500000000 ????ftypqt
3gp y 9500000000 ????ftyp3gp
```

**Ref:** https://www.linux-magazine.com/Online/Features/Recovering-Deleted-Files-with-Scalpel
