# Backup and Versioning with `cp` Command

**TLDR:** The `cp` command in Linux supports versioning through options like `--backup` and `--suffix`, allowing users to create backups with incremental numbers or custom suffixes.

## Built-in Versioning Capabilities

The `cp` command provides two main options for file versioning:

1. `--backup`: Creates a backup of the destination file before overwriting.
2. `--suffix`: Defines a custom suffix for the backup file.

## Basic Backup

To create a simple backup:

```bash
cp --backup=numbered /path/to/source/file /path/to/destination/
```

This command generates a backup with a default tilde (~) suffix and an incrementing number.

## Custom Suffix Backup

For more descriptive backups:

```bash
cp --backup=numbered --suffix=.bak /path/to/source/file /path/to/destination/
```

This command creates backups with a `.bak` suffix and an incrementing number.

## Practical Example: Backing Up SSH Configuration

To manage the SSH configuration file `/etc/ssh/sshd_config`:

1. Create a numbered backup:

    ```bash
    cp --backup=numbered /etc/ssh/sshd_config /data/backup/
    ```

    This produces backups such as `sshd_config.~1~`, `sshd_config.~2~`, etc.

2. Create a numbered backup with a custom suffix:

    ```bash
    cp --backup=numbered --suffix=.bak /etc/ssh/sshd_config /data/backup/
    ```

    This results in backups like `sshd_config.bak.1`, `sshd_config.bak.2`, etc.

## Benefits

- Keeps a history of file changes
- Prevents accidental overwriting of important files
- Provides a simple versioning system without complex tools

![Image](https://pbs.twimg.com/media/GUShQH1a4AERQus?format=jpg&name=small)

**Ref:** [sysxplore - X](https://x.com/sysxplore/status/1820757466654941532?t=YBNPSncrV-UzeHntXZjxNg&s=35)
