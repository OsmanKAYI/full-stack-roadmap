# Working with CSV Files in Terminal

When working with CSV files in the terminal, you can make them readable by aligning columns neatly using the `column` command:

```bash
cat inventory.csv | column -t -s,
```

| Flag | Description                          |
| ---- | ------------------------------------ |
| `-s` | Specifies the delimiter (comma here) |
| `-t` | Formats output into a clean table    |

This is perfect for quick data inspection without opening a spreadsheet application.

## Example

```bash
# Sample CSV content
cat inventory.csv
#name,quantity,price
#Apple,100,1.50
#Banana,200,0.75
#Orange,150,2.00

# Formatted output
cat inventory.csv | column -t -s,
#name    quantity  price
#Apple   100       1.50
#Banana  200       0.75
#Orange  150       2.00
```
