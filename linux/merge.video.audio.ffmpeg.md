# Merge Video and Audio with FFmpeg

FFmpeg is a powerful tool for manipulating multimedia files. Here are some useful commands for merging video and audio files.

## Replace Audio in a Video with MP3

To replace the audio in a video file with an MP3 file:

```bash
ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -map 0:v:0 -map 1:a:0 -shortest output.mp4
```

### Explanation

- `-c:v copy`: Copies the video stream without re-encoding (faster, lossless)
- `-map 0:v:0`: Takes the video stream from the first input file (video.mp4)
- `-map 1:a:0`: Takes the audio stream from the second input file (audio.mp3)
- `-shortest`: Makes the output as long as the shortest input file

## Mix Audio with Existing Video Audio

To mix the new audio with the existing audio in the video:

```bash
ffmpeg -i video.mp4 -i audio.mp3 -filter_complex "[0:a][1:a]amix=inputs=2:duration=shortest" -map 0:v -c:v copy -c:a aac -shortest output.mp4
```

### Explanation

- `-filter_complex "[0:a][1:a]amix=inputs=2:duration=shortest"`: Mixes both audio streams
- `-c:a aac`: Encodes the mixed audio in AAC format (compatible with most players)
- Other parameters are similar to the previous command

## Notes

- Make sure FFmpeg is installed: `sudo apt install ffmpeg`
- The first input file should be the video, and the second should be the audio
- The output format is determined by the file extension (.mp4, .mkv, etc.)
- For best quality, use lossless formats like .wav for audio if possible
