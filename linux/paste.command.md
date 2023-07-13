# Paste Command

The paste command merges lines of files horizontally by combining corresponding lines from each file specified as an argument and separating them with tabs.

## How to use the paste Command

The paste command is not as commonly used as other Linux and Unix command-line utilities, but it can be incredibly useful. The paste command has the following syntax:

```BASH
paste [OPTION]... [FILE]...
```

If no input files are specified or if the `-` argument is used, paste will default to using standard input.

## Example Usage

- To illustrate how the command works, let's create two files:

```BASH
vi file1.txt
```

**paste followings inside of file1.txt**

```
1
2
3
4
5
6
7
```

```BASH
vi file2.txt
```

**paste followings inside of file2.txt**

```
One
Two
Three
Four
Five
Six
Seven
```

- When executed without an argument, paste will read all files given as arguments and horizontally merge the corresponding lines, separated by spaces:

```BASH
paste file1.txt file2.txt
```

- Output will be:

```
1	One
2	Two
3	Three
4	Four
5	Five
6	Six
7	Seven
```

- Instead of displaying the output on the screen, use the > or >> operators to redirect it to a file. When using the > operator, the output will overwrite an existing file, whereas the >> operator will append the output to the file. If the file does not already exist, one will be created.

- You can specify a list of delimiters to be used instead of the default <kbd>TAB</kbd> separator using the `-d` or `-delimiters` option. Each delimiter is used consecutively, and the list is repeated from the beginning once it's exhausted.

**For example**, you can use the collon character as a delimiter by typing:

```BASH
paste -d ":" file1.txt file2.txt
```

This will merge corresponding lines of file1.txt and file2.txt using collon as the delimiter and the output will be:

```
1:One
2:Two
3:Three
4:Four
5:Five
6:Six
7:Seven
```

- If you have more than 2 files it's possible to use 2 delimiters. The first character from the delimiters list is used to separate the lines from the first and second files. The second delimiter is used to separate the second and third file lines. If more files are supplied, paste will restart from the beginning of the list. Here is an example of using 2 delimeters:

```BASH
vi file3.txt
```

**paste followings inside of file3.txt**

```
I
II
III
IV
V
VI
VII
```

```BASH
paste -d ":-" file1.txt file2.txt file3.txt
```

- The output will be:

```
1:One-I
2:Two-II
3:Three-III
4:Four-IV
5:Five-V
6:Six-VI
7:Seven-VII
```

- Another great option you can use with the paste comand is the `-s` or `--serial` which option tells paste to display the lines of one file at a time instead of one line from each file.

```BASH
paste -s file2.txt
```

- The output will be:

```
One	Two	Three	Four	Five	Six	Seven
```

- If you specify more than one file as an argument, the paste command will merge all lines from the specified file into separate lines:

```BASH
paste -s file1.txt file2.txt file3.txt
```

- The output will be:

```
1	2	3	4	5	6	7
One	Two	Three	Four	Five	Six	Seven
I	II	III	IV	V	VI	VII
```

- When the `-z` or `--zero-terminated` option is used, paste delimits items with a null character rather than the default newline character. This is useful when using the find `-print0` and `xargs -0` commands to handle file containing special characters.

**For example**, suppose we have two files named demo1.txt and demo2.txt with the following contents:

```BASH
vi demo1.txt
```

**paste followings inside of demo1.txt**

```
Hello, world!
This is the first file.
```

```BASH
vi demo2.txt
```

**paste followings inside of demo2.txt**

```
This is the second file.
It contains special characters like @, #, and $.
```

- If we use the paste command without the `-z` option, notice the output:

```BASH
paste demo1.txt demo2.txt
```

- The output will be:

```
Hello, world!	This is the second file.
This is the first file.	It contains special characters like @, #, and $.
```

- To merge the contents of these files using null characters as delimiters, we can use the following command:

```BASH
paste -z demo1.txt demo2.txt | xargs -0 echo
```

- The paste -z demo1.txt demo2.txt command merges the contents of demo1.txt and demo2.txt using null characters as delimiters. The resulting output is piped to the `| xargs -0 echo` command, which takes each null-delimited item and passes it as an argument to the echo command. The output will be:

```
Hello, world!
This is the first file.
	This is the second file.
It contains special characters like @, #, and $.
```

- Notice that the special characters in the second file name are correctly delimited and passed as an argument to the echo command, thanks to the use of the -z option on the paste command. This technique can be particularly useful when handling large numbers of files with special characters in their names.

**Ref:** https://twitter.com/linuxopsys/status/1654545922636804100?t=97s5tPqYYkXvlS1kyUBITQ&s=35

## Transpose Lines Using `paste` Command

- Say, the content of _transpose.txt_ is like following:

```
1 one
2 two
3 three
4 four
5 five
```

- To transpose the lines, use one of the following command.

```BASH
# with *paste* command
cut -d ' ' -f 1 transpose.txt | paste -d ' ' -s && echo && cut -d ' ' -f 2 transpose.txt | paste -d ' ' -s
# result will be:
# 1 2 3 4 5
#
# one two three four five
```

```BASH
# with *awk* command
awk '{ORS=NR%5?" ":"\n"; print $1}' transpose.txt ; awk '{ORS=NR%5?" ":"\n"; $1=""; print $0}' transpose.txt | sed 's/^ //'
# result will be:
# 1 2 3 4 5
# one  two  three  four  five
```
