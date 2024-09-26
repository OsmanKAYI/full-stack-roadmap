# f3write & f3read

It tests real flash memory capacity.

## Synopsis

```bash
f3write [--start-at=NUM] <PATH>
f3read [--start-at=NUM] <PATH>
```

## Description

- F3 (Fight Flash Fraud or Fight Fake Flash) tests the full capacity of a flash card (flash drive, flash disk, pendrive).
- It writes to the card and then checks if can read it. It will assure you haven't been sold a card with a smaller capacity than stated.
- When writing to flash drive, f3write fills the filesystem with 1GB files named N.fff, where N is a number (i.e. /[0-9]+/).

**WARNING:** All data on the tested disk will be lost!!!

## Options

```bash
--start-at=NUM
# initial number to files names. Default value is 1.
```

## Example

```bash
# to write over a flash drive mounted at /media/TEST:
f3write /media/TEST

# to read this flash drive:
f3read /media/TEST
```

**Ref:** https://manpages.ubuntu.com/manpages/trusty/man1/f3read.1.html
