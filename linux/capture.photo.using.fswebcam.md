# Capturing Photos Using `fswebcam` in Linux

## Introduction

In the Linux environment, there are several tools available for capturing images from cameras, and one such lightweight and simple-to-use tool is `fswebcam`. This tool allows you to take photos directly from the terminal.

## Installation of `fswebcam`

To install `fswebcam` on Debian-based distributions, you can use the following command:

```bash
sudo apt-get install fswebcam
```

## Automating Photo Capture with Bash Script

Below is a Bash script that captures a photo every 3 seconds and saves it to a specified directory:

```bash
#!/bin/bash

output_directory="/path/to/save/directory"
interval=3  # interval in seconds for capturing photos

while true; do
    timestamp=$(date +"%Y%m%d%H%M%S")
    output_filename="$output_directory/photo_$timestamp.jpg"

    # Capture photo using fswebcam
    fswebcam --no-banner "$output_filename"

    echo "[$(date)] Photo captured: $output_filename"
    sleep $interval
done
```

## Running the Script

1. **Adjust Directory and Permissions:**

   - Modify the `output_directory` to an existing directory of your choice.
   - Ensure the script is executable by running:

     ```bash
     chmod +x script_name.sh
     ```

2. **Run the Script:**

   - Execute the script using:

     ```bash
     ./script_name.sh
     ```

3. **Stopping the Script:**

   - To stop the script, use the `Ctrl + C` key combination in the terminal.
