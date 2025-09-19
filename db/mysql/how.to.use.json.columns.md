# How to Work with JSON Data in MySQL

**TLDR:** MySQL offers native support for JSON data with optimized storage and access. This guide covers extracting data from JSON fields using basic functions and aggregating data into JSON arrays or objects for convenient application use.

MySQL’s native JSON data type supports validation and optimized access to JSON documents. Though JSON data is typically stored in NoSQL databases like MongoDB, it is still possible to encounter JSON fields in MySQL. This guide introduces the extraction of data from JSON fields in MySQL, followed by methods to aggregate data into JSON arrays or objects for use in applications.

## Setting Up MySQL in Docker

To start, set up a local MySQL server within a Docker container:

```bash
# Create a volume to persist the data
$ docker volume create mysql8-data

# Create the container for MySQL
$ docker run --name mysql8 -d -e MYSQL_ROOT_PASSWORD=root -p 13306:3306 -v mysql8-data:/var/lib/mysql mysql:8

# Connect to the MySQL server
$ docker exec -it mysql8 mysql -u root -proot
mysql> SELECT VERSION();
```

## Extracting Data from JSON Fields

MySQL recognizes two JSON value types:

- **JSON Array:** A list of values inside square brackets `[]`.
- **JSON Object:** A set of key-value pairs inside curly brackets `{}`.

### JSON_EXTRACT Function

To extract data, use `JSON_EXTRACT(json_doc, path)`:

- Extracting from an array:
  `sql
mysql> SELECT JSON_EXTRACT('[10, 20, 30, 40]', '$[0]');
`

- Extracting from an object:
  `sql
mysql> SELECT JSON_EXTRACT('{"name": "John", "age": 30}', '$.name');
`

### -> Operator

The `->` operator serves as a shorthand for `JSON_EXTRACT`. Create a table with JSON data and extract using this operator:

```sql
CREATE DATABASE IF NOT EXISTS `data`;

CREATE TABLE `data`.`student_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `log` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_name` (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
```

```sql
SELECT
    id AS student_id,
    name,
    `log` -> '$.test_id' AS test_id
FROM `data`.`student_logs`;
```

## Removing Quotes with JSON_UNQUOTE

The `->>` operator, an alias for `JSON_UNQUOTE(JSON_EXTRACT(...))`, removes quotes from the extracted data:

```sql
SELECT
    id AS student_id,
    JSON_UNQUOTE(JSON_EXTRACT(`log`, '$.test_name')) AS test_name,
    `log` ->> '$.test_id' AS test_id
FROM `data`.`student_logs`;
```

## Extracting Nested JSON Values

To handle nested arrays or objects, `JSON_EXTRACT` must be used:

```sql
SELECT
    JSON_EXTRACT(`log` -> '$.scores', '$[0]') AS listening
FROM `data`.`student_logs`;
```

## Aggregating Data into JSON Arrays or Objects

MySQL provides the `JSON_ARRAYAGG` and `JSON_OBJECTAGG` functions to aggregate data:

```sql
SELECT
    JSON_ARRAYAGG(listening) AS listening_scores
FROM `data`.`ielts_scores`;
```

```sql
SELECT
    JSON_OBJECTAGG(name, ROUND((listening+reading+writting+speaking)/4, 1)) AS ielts_scores
FROM `data`.`ielts_scores`;
```

## Summary of Key Points

- **$.key** extracts values from JSON objects.
- **$[index]** extracts values from JSON arrays.
- **->** is a shortcut for `JSON_EXTRACT`, while **->>** is for `JSON_UNQUOTE(JSON_EXTRACT(...))`.
- **JSON_EXTRACT** is needed for extracting from nested structures.

**NOTE:** For further reading visit: [Fearlessly Using JSON in MySQL](json.in.mysql.md).

**Ref:** [Lynn G. Kwong - Medium](https://towardsdatascience.com/how-to-work-with-json-data-in-mysql-11672e4da7e9)
