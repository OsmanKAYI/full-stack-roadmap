# Character Encoding and Line Ending Conversion Commands in Bash

If you have a text file that contains non-ASCII characters, you can convert it from one character set to another in Bash using the `iconv` command.

```BASH
# List available character sets on the system
iconv -l

# Convert character encoding from ISO-8859-9 to UTF-8 and save to target.ext
iconv -f ISO-8859-9 -t UTF-8 source.ext > target.ext

# Convert line endings from DOS to Unix format in target.ext
dos2unix target.ext
```
