# Import Multiple gzip/gz/sql Files into MySQL Database

## Using zcat

zcat is a command that can be used to decompress gzip files.

```bash
# if it is not installed
sudo apt install zcat -y

# using username and password from ~/.my.cnf file if it is available
zcat *.gz | mysql $dbname

# if .my.cnf file is not created or special username or password is required (dbname is your database name)
zcat *.gz | mysql -u root -p $dbname
```

## Using cat

cat is a command that can be used to decompress gzip files.

```bash
# if it is not installed
sudo apt install cat -y

# using username and password from ~/.my.cnf file if it is available
cat *.sql | mysql $dbname

# if .my.cnf file is not created or special username or password is required (dbname is your database name)
cat *.sql | mysql -u root -p $dbname
```
