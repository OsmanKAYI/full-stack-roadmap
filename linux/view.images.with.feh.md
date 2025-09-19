# feh - A Lightweight Image Viewer for Linux

`feh` is a fast, lightweight image viewer for Linux that runs from the command line. It's particularly useful for viewing images in a minimal environment or through SSH.

## Installation

On Debian/Ubuntu systems:

```bash
sudo apt update
sudo apt install feh -y
```

## Basic Usage

### View a Single Image

```bash
feh image.jpg
```

### View Multiple Images

```bash
feh image1.jpg image2.jpg image3.jpg
```

### View All Images in a Directory

```bash
feh ./
```

## Useful Options

### Slideshow Mode

```bash
feh -D 5 --cycle-once ./
# -D 5: 5 second delay between images
# --cycle-once: Exit after showing all images
```

### Fullscreen Mode

```bash
feh -F image.jpg
```

### Thumbnail View

```bash
feh -t -E 100 -y 100 -W 800 ./
# -t: Thumbnail mode
# -E 100: Thumbnail height (pixels)
# -y 100: Thumbnail width (pixels)
# -W 800: Window width (pixels)
```

### Set as Wallpaper

```bash
feh --bg-fill wallpaper.jpg
# --bg-fill: Fill the screen with the image
# Other options: --bg-center, --bg-scale, --bg-tile
```

### Recursively View Images in Subdirectories

```bash
feh --recursive ./ # --recursive or r
```

## Practical Examples

### View Images with Navigation

```bash
feh --cycle-once --auto-zoom --draw-filename ./
# --auto-zoom: Automatically zoom images to fit window
# --draw-filename: Show filename as overlay
```

### Create a Simple Image Browser

```bash
feh -g 800x600 -d -S filename ./
# -g: Set window geometry (width x height)
# -d: Draw file info
# -S filename: Sort by filename
```

### Delete Unwanted Images

```bash
feh ./
# Press 'd' to mark for deletion
# Press 'D' to delete all marked images
```

## Keybindings

- `←` / `→`: Previous/Next image
- `+` / `-`: Zoom in/out
- `f`: Toggle fullscreen
- `q`: Quit
- `r`: Reload current image
- `d`: Mark for deletion
- `D`: Delete marked images

## Exit Codes

- 0: Success
- 1: Error opening file
- 2: No files matched the given criteria
- 3: User aborted (e.g., pressed q)
- 4: Other error

## Tips

- Use `feh` in scripts to display images in a minimal environment
- Combine with other commands using pipes for image processing workflows
- Use `--info` to display image information
- Check `man feh` for all available options
