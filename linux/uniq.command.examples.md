# Uniq Command Examples

In Linux, we can use the uniq command that comes in handy when we want to list or remove duplicate lines that present adjacently. Apart from this, we can also use the uniq command to count duplicate entries. It is important to note that, the uniq command works only when duplicate entries are adjacent.

```bash
uniq [OPTIONS] [INPUT] [OUTPUT]
```

All the options and parameters of the uniq command are optional.

## Creating Sample Text File

To begin, first, let’s create a simple text file with a vi editor and add the following duplicate contents located in the adjacent lines.

```bash
vi linux-distributions.txt
```

- add the followings inside of the **linux-distributions.txt** file

```
CentOS
CentOS
CentOS
CENTOS
Ubuntu
Ubuntu
UBUNTU
Red Hat
Red Hat
Red Hat
Alpine
Rocky Linux
Rocky Linux
```

```bash
# remove duplicate lines from a text file
uniq linux-distributions.txt

# count duplicated lines in a text file
uniq -c linux-distributions.txt

# remove duplicates with case insensitive
uniq -i linux-distributions.txt

# print only duplicate lines from a file
uniq -d linux-distributions.txt

# print all duplicate lines from a file
uniq -D linux-distributions.txt

# show duplicate lines by groups in a new line
uniq --all-repeated=separate linux-distributions.txt

# print only unique lines from a file
uniq -u linux-distributions.txt

# remove non-adjacent duplicate lines in file
sort linux-distributions.txt | uniq
```

**Ref:** https://www.tecmint.com/remove-duplicate-lines-linux-files/
