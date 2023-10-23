# Linux Permissions

Linux is a multi-user OS that has robust built-in user and group permissions.

These permissions provide the ability to limit who has access to a file or directory and what actions (read, write, or execute) they are allowed to perform.

There are **three permission types** for each file and directory:

| Statement       | Description                                                                             |
| --------------- | --------------------------------------------------------------------------------------- |
| **Read (r)**    | Allows reading of a file or listing of the directory's contents.                        |
| **Write (w)**   | Allows you to modify the contents of a file or create or delete files from a directory. |
| **Execute (x)** | Allows a file to be run as a program, or a directory to be entered into.                |

There are **three types of user** to whom permissions are assigned:

| Statement      | Description                                                    |
| -------------- | -------------------------------------------------------------- |
| **Owner (u)**  | The owner of the file or directory.                            |
| **Group (g)**  | Other users who are members of the file's group.               |
| **Others (o)** | All other users who are not the owner or members of the group. |

To **view permissions**, you can use the `ls -l` command, which displays a string of 10 characters. The first character indicates the filetype; d for directory, - for regular file. This is followed by three sets of r, w, x, or - if that permission isn't granted. Each set is for User, Group, and Others (in order).

A **file or directory's permissions can be changed** with the `chmod` command (CHange MODe). Symbolic mode (u/g/o/a +/- r/w/x) or numeric mode (octal representation: read=4, write=2, execute=1) can be used to change permissions.

**Example:** `chmod u+w file` adds write permission for the user, and `chmod 744 file` sets read, write, and execute for the user, and read for group and others.

**Files and directories can also have ownership changed** using the `chown` and `chgrp` commands.

Understanding Linux permissions is key in several aspects of software development, from managing system security to deployment & operations. A key principle to keep in mind when working with permissions is it's usually better to start with more restrictive permissions, then gradually add more as needed.

## Changing File Permissions

The (+) operator is used to add a permission to a user, group or other user and the (-) operator is used to remove a permission.

To change the permission of a file, the `chmod` command is used.

`sudo chmod o-rw filename` - removes read ( r ) and write ( w ) permissions from others in filename.

`sudoc chmod g+rw filename` - adds read ( r ) and write ( w ) permissions to the group to which filename belongs.

<div style="text-align: center;">
  <img src="https://pbs.twimg.com/media/F8wVTEyaAAAr3oJ?format=jpg&name=4096x4096">
</div>

**Ref:**

- https://github.com/nuriakman/PHP-Egitimi/blob/master/konular/dosya.izinleri.md
- https://twitter.com/ChrisStaud/status/1714769708401218030?t=CQ8Afjhf0MY4zJtCYIkk-w&s=35
