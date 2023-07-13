# Connect MySQL from CLI without Password

- As usual, you can connect MySQL from CLI with using `mysql` command.
- But it will ask you to enter your username and password.
- To prevent it to happen, use the following commands.

```BASH
# create ".my.cnf" file and edit it
vi .my.cnf
```

```CONFIG
# paste the following lines inside of ".my.cnf" file
[client]
user=root
password="root"
```
