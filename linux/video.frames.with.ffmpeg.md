# Extract, Filter, and Compile Video Frames with FFmpeg

This guide explains how to:

1. Extract every 20th frame from a video.
2. Filter out duplicate frames with 90% or greater similarity.
3. Compile the filtered frames into a playable video file.

## Step 1: Extract Frames from Video

Using `ffmpeg`, extract every 20th frame from a video file (`video.mov`), saving each frame as an image file. Adjust the `20` to change the frame extraction frequency.

```bash
ffmpeg -i video.mov -vf "select='not(mod(n\,20))'" -vsync vfr frame-%04d.png
```

- **`-vf "select='not(mod(n,20))'"`**: Extracts every 20th frame.
- **`-vsync vfr`**: Maintains a variable frame rate to avoid duplicating frames.
- **`frame-%04d.png`**: Saves extracted frames as `frame-0001.png`, `frame-0002.png`, etc.

## Step 2: Remove Duplicate Frames

Use `findimagedupes` to detect and delete frames that are 90% similar or more.

```bash
findimagedupes -t 90 foto_directory | while read -r line; do
    set -- $line             # Split line into words
    shift 1                  # Skip the first image (original frame)
    for foto in "$@"; do
        echo "$foto found similar, deleting..."
        rm "$foto"
    done
done
```

- **`-t 90`**: Sets the threshold for similarity at 90%.
- **`rm "$foto"`**: Deletes frames similar to the first frame in each group.

> **Note:** Replace `foto_directory` with the directory containing extracted frames.

## Step 3: Compile Frames into Video

Finally, use `ffmpeg` to create a video from the filtered frames, setting the frame rate to 6 FPS and encoding with H.264 for compatibility.

```bash
ffmpeg -framerate 6 -pattern_type glob -i 'frame-*.png' -c:v libx264 -pix_fmt yuv420p -crf 23 -preset fast -c:a aac -b:a 192k ../result.mp4
```

- **`-framerate 6`**: Sets output video frame rate to 6 FPS.
- **`-pattern_type glob -i 'frame-*.png'`**: Selects all frames in `frame-` format.
- **`-c:v libx264 -pix_fmt yuv420p`**: Encodes in H.264, standard compatible format.
- **`-crf 23`**: Defines the quality level (lower values = higher quality).
- **`../result.mp4`**: Specifies the output video file.

This process creates `result.mp4`, a video containing selected frames at the specified frame rate.
