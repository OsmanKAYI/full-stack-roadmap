# Find Command on Linux

The find command is used in Linux and Unix-based operating systems to search for files and directories. The `-name` option is particularly used to search for files based on specific criteria, specifically, to search for file names matching a certain pattern. For instance, to find files containing the words "log" or "archive" in their names, you can use a command like this:

```bash
find /path/to/search -type f \( -name "*log*" -o -name "*archive*" \)
```

This command will search within the `/path/to/search` directory for files (`-type f` indicates files) that have "log" or "archive" in their names.

Here are some operators and conjunctions that can be used with the find command:

`-name:` Used for file name searches.
`-type:` Finds files of a specific type (for example, f for files, d for directories).
`-iname:` Performs a case-insensitive file name search.
`-size:` Searches based on a specific file size.
`-exec:` Executes specified commands on the found files.
`-delete:` Deletes the found files.
`-maxdepth:` Sets the maximum directory depth for the search.

There are more options and functionalities available with the find command. You can refer to its documentation using `man find` command for more detailed information.
