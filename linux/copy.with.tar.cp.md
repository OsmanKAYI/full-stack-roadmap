# Linux Copy Commands

## Copy Files with tar

```bash
# Create a target folder
mkdir [/target/path/]

# Move into source folder
cd [/source/path/]

# Copy current directory (with subdirectories) to the target
tar cf - . | tar xvf - -C [/target/path/]

# NOTE:
# [/source/path/] directory will be created under [/target/path/] if you copy as follows,
# tar cf - [/source/path/] | tar xvf - -C [/target/path/]
# To prevent this action, `cd [/source/path/]` is used
```

## Copy Files with cp

```bash
cp -unvr [/source/path/] [/target/path/]
# u: copy only when the SOURCE file is newer than the destination file or when the destination file is missing
# n: do not overwrite an existing file
# v: explain what is being done
# r: copy directories recursively
```

## Copy Files with nc and tar Between Two Different Server

- This way is ideal for too many files with small sizes.

```bash
# WARNING: Requires netcat (or ncat) on both servers
# DİKKAT: Her iki bilgisayarda da netcat (veya ncat) kurulu olmalıdır

# Command which will be written in target server
# - Put port 2342 on listen with the nc command
# - Send incoming packets to the tar command
nc -l -p 2342 | tar -C [/target/path/] -xzf -

# Command to write on the source server
# - Prepare the directory and files to be copied with tar.
# - Send the output to the server with known IP on the other side waiting for listening
cd [/source/path/]
tar -cz . | nc [targetServerIP] 2342

# NOTE: The "z" parameter should not be used if the files are not suitable for compression!
# Example:
# nc -l -p 2342 | tar -C [/target/path] -xf -
# tar -c . | nc [targetServerIP] 2342
```
