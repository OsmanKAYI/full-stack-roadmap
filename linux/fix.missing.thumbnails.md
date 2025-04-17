# Fix for Missing Video Thumbnails in Nautilus

To resolve the issue of missing video thumbnails in Nautilus on Ubuntu, follow these steps to install the necessary plugins and clear the thumbnail cache.

## Steps

1. **Install Ubuntu Restricted Extras**  
   This package includes essential codecs and tools for media playback and compatibility.

   ```bash
   sudo apt install ubuntu-restricted-extras
   ```

2. **Install Required GStreamer Plugins**  
   These plugins add further support for video codecs and thumbnail generation.

   ```bash
   sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav
   ```

3. **Clear Thumbnail Cache**  
   Removing old cached thumbnails can fix display issues caused by corrupted or outdated files.

   ```bash
   rm -rf ~/.cache/thumbnails/*
   ```

After completing these steps, video thumbnails should display correctly in Nautilus.
