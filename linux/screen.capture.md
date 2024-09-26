# Video Capture of Screen in Linux

- `-video_size` should be used according to your screen resolution.

  - Screen resolutioon can be found as follows:

  ```bash
  X=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
  Y=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
  echo "$X" x "$Y"
  ```

  - If you use more than one screen, the result will be like this `X1 X2 ... Xn x Y1 Y2 ... Yn` and you should use that as a pair of (X1 x Y1), (X2 x Y2), ..., (Xn x Yn).

- `-framerate` specifies the frame rate, i. e. how many frames of video are recorded in a second. If you need another frame rate, use another number than 30. The lowest allowed framerate is 20.
- `-f x11grab` is what actually tells FFmpeg to record your screen. You shouldn't change that.
- `echo $DISPLAY` command allows you to define what will be written after `-i :`. It can be 0 (zero) or something else.
- `-f pulse` tells FFmpeg to grab the input from PulseAudio, which is your sound server.
- `-ac 2` specifies the number of audio channels. If you receive an error like: "cannot set channel count to 2 (Invalid argument)", you should change that to 1.
- `pacmd list-sources` command allows you to define what will be written after `-ac -2 -i`. It can be 1 (one), 2 (two) or something else.
- `-c:v libx264` is encoding options.
- `-t 00:00:10` determines the record time (in that case it is 10 seconds).
- "`date '+%Y-%m-%d_%H.%M.%S'`.mp4" defines what will be the name (as a datetime format) and the type of the output file.

## With System Sounds

```bash
ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :1.0+0,0 -f pulse -ac 2 -i 1 -c:v libx264 `date '+%Y.%m.%d-%H.%M.%S'`.mp4


ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :1.0+0,0 -f pulse -ac 2 -i 1 -c:v libx264 -t 00:00:10 `date '+%Y.%m.%d-%H.%M.%S'`.mp4
```

## With Microphone

```bash
ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :1.0+0,0 -f pulse -ac 2 -i 2 `date '+%Y.%m.%d-%H.%M.%S'`.mp4
```

# Audio Capture of Screen in Linux

- `pactl list short sources` command allows you to define what will be written after `-i`.

## With System Sounds

```bash
ffmpeg -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -ac 2 `date '+%Y.%m.%d-%H.%M.%S'`.m4a
```

## With Microphone

```bash
ffmpeg -f pulse -i alsa_input.pci-0000_00_1f.3.analog-stereo -ac 2 `date '+%Y.%m.%d-%H.%M.%S'`.m4a
```

**NOTE:** `CTRL` + `C` lets you to stop recording.
**NOTE:** `alsamixer` command lets you to visually arrange sound settings.

**Ref:** https://www.wikihow.com/Record-Your-Desktop-Using-FFmpeg-on-Ubuntu-Linux

**NOTE:** If you face some problem while trying to play captured video or audio on windows, you can visit [Codec Guide](https://codecguide.com/) and download [K-Lite Codec Pack Mega](https://codecguide.com/download_k-lite_codec_pack_mega.htm) on your computer which will most probably solve your problem.
