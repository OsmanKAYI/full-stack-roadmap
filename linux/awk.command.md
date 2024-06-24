# Linux Awk Command Examples

AWK is a domain-specific language designed for text processing and typically used as a data extraction and reporting tool. Like sed and grep, it is a filter, and is a standard feature of most Unix-like operating systems.

- `awk '{print $2, $3}' my.txt`
  - Print 2nd & 3rd fields separated by space

- `awk '{print $2 ", " $3}' my.txt`
  - Print 2nd & 3rd fields separated by comma

- `awk '$2 > 100' my.txt`
  - Print lines where 2nd field is > 100

- `awk '$1 == 100' my.txt`
  - Print lines where 1st field equals to 100

- `awk '/error/' my.txt`
  - Print lines containing the word 'error'

- `awk '{sum=$1+$2; print sum}' my.txt`
  - Sum up 1st & 2nd fields of each line

- `awk '{print NR, $0}' my.txt`
  - Add line number to each line and print it

- `awk '{print NF}' my.txt`
  - Print the number of fields in each line

- `awk '{print $1, $NF}' my.txt`
  - Print 1st & last fields

- `awk '{s+=$2; c++} END {print s/c}' my.txt`
  - Compute average of 2nd field

- `awk '$1 > 100 {s+=$2; c++} END {print s/c}' my.txt`
  - Average with condition

- `awk '{print toupper($2)}' my.txt`
  - Print 2nd field in uppercase

- `awk '$1 == "ERR" {print $2}' my.log`
  - Print 2nd field if 1st field is "ERR"

- `awk -F "," '{print $2, $3}' my.csv`
  - Use comma "," as field separator

- `awk '{print substr($2,1,3)}' my.txt`
  - Extract substring from 2nd field

- `awk 'function sq(x) {return x*x} {print sq($2)}' my.txt`
  - Define a function

- `awk '!seen[$1]++' my.txt`
  - Remove duplicate lines based on 1st field

- `awk 'length($2) > 3' my.txt`
  - Print lines where length of 2nd field > 3

- `awk '$1 ~ /ERR/' my.log`
  - Print lines where 1st field matches pattern

- `awk '$1 !~ /ERR/' my.log`
  - Print lines where 1st field doesn't match pattern

- `awk '$1 ~ /^[0-9]+$/' my.log`
  - Print lines where 1st field is a numeric value

**Ref:** [Dan Nanni - X](https://x.com/xmodulo/status/1803385463790809345?t=-z2AF20x9dge6H1TY_Ul3A&s=35)
