# Import '.txt' File To MySQL Database From Command Line

```
time mysql -u `username` -p`password` < import.sql
```

- Say that data is
  - in the direction of '/tmp/1.txt'
  - in the `test` database and `stat` table
  - seperated by ','

#### File Content of `import.sql`

```
TRUNCATE TABLE test.stat;

LOAD DATA INFILE '/tmp/1.txt'
INTO TABLE test.stat
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```
