# Image Operations

**Remove white spaces from an image:**

```BASH
convert input.png -alpha off -fuzz 10% -fill white -opaque "rgb(241,144,105)" -trim +repage output.png
```

- You can see the example and result in [StackOverflow](https://stackoverflow.com/a/52843661).

**After giving 1px Blur to the .JPG files in the directory, crop the empty areas surrounding the image with a 15% tolerance and overwrite the same file:**

```BASH
for f in *.jpg; do echo $f; convert $f -virtual-pixel edge -blur 1x1 -fuzz 15% -trim $f; done;
```

**Reduce the .JPG files in the directory to 40% of the original size with JPG quality 80 and overwrite the same file:**

```BASH
for f in *.jpg; do echo $f; convert $f -format jpg -quality 80 -resize 40% $f; done;
```
