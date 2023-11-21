# Log Parsing

The diagram below lists the top 6 log parsing commands.

**1. GREP**

- GREP searches any given input files, selecting lines that match one or more patterns.

**2. CUT**

- CUT cuts out selected portions of each line from each file and writes them to the standard output.

**3. SED**

- SED reads the specified files, modifying the input as specified by a list of commands.

**4. AWK**

- AWK scans each input file for lines that match any of a set of patterns.

**5. SORT**

- SORT sorts text and binary files by lines.

**6. UNIQ**

- UNIQ reads the specified input file comparing adjacent lines and writes a copy of each unique input line to the output file.

These commands are often used in combination to quickly find useful information from the log files.

**For example**; the below commands list the timestamps (column 2) when there is an exception happening for xxService.

`grep “xxService” service.log | grep “Exception” | cut -d” “ -f 2`

<div style="text-align: center;">
  <img src="https://pbs.twimg.com/media/F-bGfPuacAAUxio?format=jpg&name=small">
</div>
