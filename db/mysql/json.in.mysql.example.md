# JSON in MySQL Example

This example demonstrates how to use JSON data in MySQL. It includes table creation, insertion of data with JSON fields, and performing a query to extract specific JSON data. Let’s break it down:

## Table Creation

The following SQL script demonstrates creating a table locations in MySQL, using the utf8mb4 character set for full UTF-8 support and validating a JSON field:

```sql
-- Adminer 4.8.1 MySQL 5.5.5-10.6.18-MariaDB-0ubuntu0.22.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `type` char(1) NOT NULL DEFAULT '',
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `attr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attr`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

### Key Points of Table Creation

- The table uses the `utf8mb4` character set, allowing it to store any UTF-8 characters, including emojis. The collation `utf8mb4_bin` ensures that the `attr` field is handled correctly with binary comparisons.
- The `id` is an auto-incremented unique identifier for each record.
- The `name` stores the name of the location.
- `description` provides an optional brief description.
- The `type` field uses a single character to represent the category (e.g., Restaurant `R`, Attraction `A`, Stadium `S`).
- The `latitude` and `longitude` fields store geographical coordinates.
- The `attr` field is a JSON column, which stores additional dynamic data, and MySQL ensures the data is valid JSON using the `json_valid()` function.

### Inserting Data

This example inserts several rows into the `locations` table. The JSON column `attr` is used to store additional information for each location, such as food type, menu, or events.

```sql
INSERT INTO `locations` (`id`, `name`, `description`, `type`, `latitude`, `longitude`, `attr`) VALUES
(1,  'The Scout',  'A sports bar in South Loop',  'R',  41.865624,  -87.625283,  '{\"details\": {\"foodType\": \"Mexican\", \"menu\": \"http://thescoutchicago.com\"}, \"favorites\": [{\"description\": \"Wrap\", \"price\": \"$9.99\"}]}'),
(2,  'Chicago Cut Steakhouse',  'A steakhoue in River North',  'R',  41.887884,  -87.633075,  '{\"details\": { \"foodType\":\"Steakhouse\", \"menu\":\"http://thescoutchicago.com\"}, \"favorites\": []}'),
(3,  'The Art Institute of Chicago',  'Renowned art museum holding nearly 300,000 works from all over the world, spanning many centuries.',  'A',  41.879585,  -87.623713,  '{\"category\": \"Museum\", \"lastVisitDate\": \"11/5/2019\"}'),
(4,  'United Center',  'NBA stadium - home of the Bulls and Blackhawks',  'S',  41.880691,  -87.674176,  '{\"details\": {\"yearOpened\": 1994, \"capacity\": 23500}, \"events\": [{\"date\": \"10/18/2019\", \"description\": \"Bulls vs Celtics\"}, {\"date\": \"10/21/2019\", \"description\": \"Bulls vs Lakers\"}, {\"date\": \"11/5/2019\", \"description\": \"Bulls vs Bucks\"}, {\"date\": \"11/5/2019\", \"description\": \"Blackhawks vs Blues\"}]}'),
(5,  'Guaranteed Rate Field',  'MLB stadium - home of the White Sox',  'S',  41.829902,  -87.633752,  '{\"details\": {\"yearOpened\": 1991, \"capacity\": 40615}, \"events\": [{\"date\": \"5/1/2020\", \"description\": \"Whitesox vs Royals\"}]}'),
(6,  'Willis Tower',  NULL,  'A',  41.878876,  -87.635915,  '{\"category\": \"Landmark\", \"lastVisitDate\": \"11/11/2019\"}'),
(7,  'Soldier Field',  'NFL stadium - home of the Bears',  'S',  41.862313,  -87.616688,  '{\"details\": { \"yearOpened\": 1922, \"capacity\": 61500}, \"events\": [{\"date\": \"10/20/2019\", \"description\": \"Bears vs Saints\"}, {\"date\": \"10/27/2019\", \"description\": \"Bears vs Chargers\"}]}'),
(8,  'Cloud Gate',  NULL,  'A',  41.882661,  -87.623304,  '{\"category\": \"Landmark\", \"lastVisitDate\": \"11/5/2019\"}'),
(9,  'Navy Pier',  'An outdoor shopping center',  'A',  41.891863,  -87.605094,  '{\"category\": \"Shopping Center\", \"lastVisitDate\": \"11/8/2019\"}'),
(10,  'The Publican',  NULL,  'R',  41.886629,  -87.648851,  '{\"details\": {\"foodType\": \"American\", \"menu\": \"http://www.thepublicanrestaurant.com/\"}, \"favorites\": [{\"description\": \"Burger\", \"price\": \"$12.99\"}, {\"description\": \"Wings\", \"price\": \"$9.99\"}, {\"description\": \"Salad\", \"price\": \"$8.99\"}, {\"description\": \"Wrap\", \"price\": \"$14.99\"}, {\"description\": \"Steak\", \"price\": \"$29.00\"}]}'),
(11,  'Sunda',  'An Asian restaurant in River North',  'R',  41.890952,  -87.631743,  '{\"details\": {\"foodType\": \"Asian\", \"menu\": \"http://sundanewasian.com\"}, \"favorites\": []}'),
(12,  'Chicago French Market',  NULL,  'A',  41.884137,  -87.640973,  '{\"category\": \"Shopping\", \"lastVisitDate\": \"10/31/2019\"}'),
(13,  'The Chicago Theatre',  NULL,  'A',  41.885264,  -87.627647,  '{\"category\": \"Theater\", \"lastVisitDate\": \"11/4/2019\"}'),
(14,  'Giordanos',  NULL,  'R',  41.876388,  -87.647639,  '{\"details\": {\"foodType\": \"Pizza\", \"menu\": \"http://www.giordanos.com/menu\"}, \"favorites\": [{\"description\": \"Chicago Classic\", \"price\": \"$24.99\"}, {\"description\": \"Salad\", \"price\": \"$9.99\"}]}');
```

### Key Points of Inserting Data

- In the `attr` field, JSON objects store various types of information like `foodType`, `menu`, or event details.
- Each location has a unique `id`, and the `type` column indicates whether it is a restaurant (`R`), attraction (`A`), or stadium (`S`).

### Querying JSON Data

We use the `JSON_VALUE()` and `JSON_QUERY()` functions to extract specific data from the `attr` JSON column. Here’s an example query:

```sql
SELECT id, name,
  JSON_VALUE(attr, '$.details.foodType') AS typee,
  JSON_VALUE(attr, '$.details.menu') AS catt,
  JSON_QUERY(attr, '$.details') AS detailss
FROM locations
WHERE type = 'R';
```

### Key Points of Querying JSON Data

- `JSON_VALUE(attr, '$.details.foodType')` extracts the value associated with the `foodType` key in the `details` object.
- `JSON_VALUE(attr, '$.details.menu')` extracts the URL of the menu stored under the `menu` key.
- `JSON_QUERY(attr, '$.details')` returns the entire `details` object as a JSON structure.
- The `WHERE` clause filters the results to show only locations where the `type` is `'R'` (restaurants).

## Explanation of JSON Functions

- **JSON_VALUE()**: Extracts a scalar value from the JSON data based on a path expression. For example, `$.details.foodType` navigates the JSON structure to retrieve the `foodType`.
- **JSON_QUERY()**: Extracts and returns a JSON object or array from the JSON data. This is useful when you want to retrieve a complex JSON structure rather than a single value.

## Conclusion

This example shows how to:

- Create a table with a JSON column in MySQL.
- Insert JSON data into the table.
- Query specific data from the JSON field using JSON functions like `JSON_VALUE()` and `JSON_QUERY()`.

This approach allows flexible storage of dynamic data and provides powerful querying capabilities for JSON-structured data in MySQL, making it easier to handle complex, variable data without needing to constantly change the database schema.
