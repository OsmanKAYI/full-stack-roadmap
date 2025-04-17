# Automate iPhone Mounting and Photo Sync with `ifuse` and `rsync`

This guide details the setup and automation process for mounting an iPhone on Ubuntu and syncing its photos to a designated directory.

---

## 1. Install Required Packages

First, ensure the required tools are installed:

```bash
sudo apt install libimobiledevice-utils -y
sudo apt install ifuse -y
sudo apt install rsync -y
```

## 2. Automate iPhone Mounting

Create a shell script that will:

1. Detect the connected iPhone's Unique Device Identifier (UDID).
2. Mount the iPhone to the specified directory.
3. Sync photos from the iPhone to a local directory using `rsync`.

### Script: `mount_and_sync_iphone.sh`

```bash
mkdir -p ~/source
cat << 'EOF' > ~/source/mount_and_sync_iphone.sh
#!/bin/bash

# Step 1: Prompt for User Selection
echo "Select user:"
echo "1. Osman"
echo "2. Şeyma"
read -p "Enter 1 or 2: " user_choice

# Set names based on selection
if [ "$user_choice" == "1" ]; then
    USER_NAME="Osman"
elif [ "$user_choice" == "2" ]; then
    USER_NAME="Seyma"
else
    echo "Invalid choice. Exiting."
    exit 1
fi

# Step 2: Get the UDID of the connected iPhone
UDID=$(idevice_id -l)

# Step 3: Check if a UDID was found
if [ -z "$UDID" ]; then
    echo "No iPhone detected. Please connect an iPhone and try again."
    exit 1
fi

# Step 4: Define the mount point and destination based on user choice
MOUNT_POINT=~/iPhone_"$USER_NAME"
DESTINATION_DIRECTORY=~/photo_"$USER_NAME"

# Step 5: Mount the iPhone to the specified directory
mkdir -p "$MOUNT_POINT"
ifuse --udid "$UDID" "$MOUNT_POINT"
echo "iPhone mounted at $MOUNT_POINT"

# Step 6: Sync Photos to Destination Directory
mkdir -p "$DESTINATION_DIRECTORY"
rsync -avz --progress "$MOUNT_POINT"/DCIM/ "$DESTINATION_DIRECTORY"

echo "Photos synced to $DESTINATION_DIRECTORY"
EOF
```

### 3. Make the Script Executable

```bash
chmod +x ~/source/mount_and_sync_iphone.sh
```

### 4. Run the Script

To mount your iPhone and sync its photos, simply run:

```bash
~/source/mount_and_sync_iphone.sh
```

## Explanation of the Script

- **UDID Detection**: Uses `idevice_id -l` to get the iPhone’s UDID.
- **Mount Directory**: Mounts the iPhone’s filesystem to `~/iPhone`.
- **Photo Sync**: Uses `rsync` to sync the contents of the iPhone’s `DCIM` folder to the specified destination directory (`~/foto`).

---

This automated approach ensures your iPhone photos are regularly backed up with minimal manual effort.

**Ref:** [Kevin - KPW](https://kevinpwhite.com/blog/how-to-transfer-images-and-videos-from-ios-device-using-ubuntu/)
