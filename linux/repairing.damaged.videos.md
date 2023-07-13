# Repair Damaged Video Files

Repairing damaged video files involves the process of restoring the content of a video file that has been corrupted or damaged in some way, making it unplayable or difficult to view. This can happen due to a variety of reasons such as power outages, interruptions during the recording process, virus infections, or incomplete downloads.

To repair a damaged video file, specialized software tools are used to scan and repair the corrupted portions of the file. These tools can detect and fix errors in the video file's header, file structure, or encoding, allowing it to be playable once again. However, it is important to note that not all video files can be repaired, especially if the damage is severe or the file has been overwritten. Therefore, it is recommended to always backup important video files to prevent permanent loss.

In this page, there are few examples (not cover all the topics).

## Repairing with ffmpeg

`ffmpeg -i 1.mp4 -c copy $filename.mp4`

## Codec Changing (Slow)

`ffmpeg -i 1.mp4 -c:v libx264 -c:a aac -strict -2 -b:a 128k -preset slow $filename.mp4`

## Codec Changing (with GPU acceleration)

`ffmpeg -hwaccel cuda -i 1.mp4 -c:v h264_nvenc -preset fast $filename.mp4`

## Codec Changing (Fast)

```BASH
# both lines produce the same result file
ffmpeg -i 1.mp4 -c:v libx264 -crf 23 -preset fast $filename.mp4
ffmpeg -i 1.mp4 -c:v libx264 -preset fast $filename2.mp4
```

## Extracting Photo Frames of Every Second of a Video File into a Separate Directory

```BASH
mkdir videoFrames
ffmpeg -i $filename.mp4 -q:v 1 -vf fps=1 videoFrames/v%04d.jpg
```
