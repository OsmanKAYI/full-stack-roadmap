# Image Processing on Linux

## Bash Script to Resize and Move Images

### Overview

This Bash script continuously monitors a specified directory using `inotifywait`. When new image files are added, it resizes them to a specified dimension (1024x768), renames them with a timestamp, and moves them to a destination directory (`Resimler`). If non-image files are added, they are deleted.

### Requirements

```bash
# Install the `inotify-tools` package for `inotifywait`.
sudo apt install inotify-tools -y
```

### Bash Script

```bash
#!/bin/bash

src_directory="/path/to/source/directory"
dest_directory="/path/to/destination/directory/Resimler"
max_width=1024
max_height=768

while true; do
    inotifywait -e create "$src_directory"

    for file in "$src_directory"/*; do
        if [[ -f "$file" && $(file --mime-type -b "$file") == image/* ]]; then
            timestamp=$(date +"%Y%m%d%H%M%S")
            new_filename="${timestamp}_$(basename "$file")"
            convert "$file" -resize "${max_width}x${max_height}" "$dest_directory/$new_filename"
            rm "$file"
            echo "[$(date)] $file resized and moved."
        elif [[ -f "$file" ]]; then
            rm "$file"
            echo "[$(date)] $file deleted as it is not an image."
        fi
    done
done
```

### Usage

1. Modify the `src_directory` and `dest_directory` variables according to your requirements.
2. Optionally adjust `max_width` and `max_height` for the desired image dimensions.
3. Run the script.

---

## Bash Script to Upload Resized Images

### Overview

This Bash script extends the previous script by adding functionality to upload resized images to a specified URL using `curl`.

### Requirements

```bash
# Install the `inotify-tools` package for `inotifywait`.
sudo apt install inotify-tools -y
# Install the `curl` command.
sudo apt install curl -y
```

### Bash Script

```bash
#!/bin/bash

src_directory="/path/to/source/directory"
dest_directory="/path/to/destination/directory/Resimler"
max_width=1024
max_height=768
upload_url="https://example.com/upload"  # Replace with your upload URL

while true; do
    inotifywait -e create "$src_directory"

    for file in "$src_directory"/*; do
        if [[ -f "$file" && $(file --mime-type -b "$file") == image/* ]]; then
            timestamp=$(date +"%Y%m%d%H%M%S")
            new_filename="${timestamp}_$(basename "$file")"

            convert "$file" -resize "${max_width}x${max_height}" "$dest_directory/$new_filename"

            curl -X POST -F "file=@$dest_directory/$new_filename" "$upload_url"

            rm "$file"
            echo "[$(date)] $file resized, moved, and uploaded."
        elif [[ -f "$file" ]]; then
            rm "$file"
            echo "[$(date)] $file deleted as it is not an image."
        fi
    done
done
```

### Usage

1. Modify the `src_directory`, `dest_directory`, `max_width`, `max_height`, and `upload_url` variables according to your requirements.
2. Run the script.

---

## PHP Script to Receive and Save Uploaded Files

```php
<?php
// File Upload Script

// Specify the directory where the file will be saved
$uploadDirectory = '/path/to/upload/directory/';

// Create the path and name of the uploaded file
$uploadedFile = $uploadDirectory . basename($_FILES['file']['name']);

// Save the file to the specified directory
if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadedFile)) {
    echo 'File uploaded and saved successfully.';
} else {
    echo 'An error occurred while uploading the file.';
}
?>
```

### Usage

1. Modify the `$uploadDirectory` variable according to your requirements.
2. Deploy this PHP script to your server where you want to receive and save uploaded files.
