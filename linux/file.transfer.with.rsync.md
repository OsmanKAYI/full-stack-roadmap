# File Transfer Between Linux Computers (rsync)

## SSH Setup

First, ensure that the SSH service is installed and running on the target machine:

```bash
# Install SSH server
sudo apt-get install openssh-server
# Start SSH service
sudo systemctl start ssh
# Check SSH service status (optional)
sudo systemctl status ssh
```

## File Transfer with rsync

You can use the rsync command to transfer files:

```bash
rsync -rv /source/directory/ user@target_ip:/destination/directory/
```

- Parameters:
  - -r: Recursive (include subdirectories)
  - -v: Verbose (detailed output)

### Example

```bash
rsync -rv /var/www/html/project_folder/ user@192.168.1.100:/var/www/html/project_folder/
```

## Notes

- Make sure SSH service is installed and running
- Test the connection by pinging the target IP
- Ensure correct write permissions on the destination directory
- You may need to accept the SSH key when connecting for the first time

## Security

- Be careful when sharing sensitive information (IP address, username, etc.)
- Use SSH when transferring over unsecured networks
- Use custom SSH port if necessary
