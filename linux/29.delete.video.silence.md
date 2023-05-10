# How to Cut Video Silence

A tool for removing silences from a video is the [python-video-silence-cutter](https://github.com/OsmanKAYI/python-video-silence-cutter).

## Dependencies

- python3
- ffmpeg
- ffprobe

### Install Dependencies

```BASH
sudo apt install python3 -y
sudo apt install ffmpeg -y
sudo apt install ffprobe -y
```

## Example Usage

```BASH
# easiest command:
python3 silence_cutter.py [your video]

# show **help** and suggestions:
python3 silence_cutter.py --help

# more options:
python3 silence_cutter.py [your video] [outfile] [silence dB border]
# silence dB border
# Default: -30
# A suitable value might be around -50 to -35.
# The lower the more volume will be defined as 'silent'
# -30: Cut Mouse clicks and mouse movent; cuts are very recognizable.
# -35: Cut inhaling breath before speaking; cuts are quite recognizable.
# -40: Cuts are almost not recognizable.
# -50: Cuts are almost not recognizable.
#      Cuts nothing, if there is background noise.
```

**IMPORTANT** You need to specify the directory of the `python-video-silence` project which includes `silence_cutter.py`. If you don't, it will tell you

```
python3: can't open file '/silence_cutter.py': [Errno 2] No such file or directory
```

**NOTE:** When I use it for a video having a time of

- 37:00, it decreases the time of 33:13.
- 35:07, it decreases the time of 33:23.
