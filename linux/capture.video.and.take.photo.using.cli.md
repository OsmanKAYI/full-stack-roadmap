# Video Capture and Take Photo Using CLI

## Checking Video Sources

```bash
# List loaded kernel modules and filter for uvcvideo
lsmod | grep uvcvideo
```

- This command checks if the UVCVideo kernel module is loaded and loaded video sources.

## Installing v4l-utils and guvcview

```bash
# Install v4l-utils and guvcview
sudo apt install v4l-utils -y
sudo apt install guvcview -y
```

- These commands install the necessary packages for handling video devices.

## Listing Video Devices

```bash
# List available video devices
v4l2-ctl --list-devices
```

- This command lists the available video devices on the system.

## Capturing Video

### Capturing Video with guvcview

```bash
# Capture video using guvcview and save to ~/.config/guvcview2
guvcview --video /dev/video0 --format=yuv420 --resolution=640x480 --capture=read
```

- This command captures video using guvcview and saves it to the default location (~/.config/guvcview2).

### Capturing Video with guvcview

```bash
# Use ffmpeg to capture video from /dev/video0, encode with libx264, and save to ~/Pictures/output.mp4
ffmpeg -f v4l2 -i /dev/video0 -c:v libx264 -preset ultrafast ~/Pictures/output.mp4
```
