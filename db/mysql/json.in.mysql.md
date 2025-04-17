# Fearlessly Using JSON in MySQL

It will be discussed the benefits of using JSON in MySQL and why there's no need to fear it. Especially for new developers, questions like these often come up when they first encounter JSON:

- I can do a simple INSERT, but will I face issues with UPDATE?
- How can I SEARCH within JSON?
- Can I delete object X from a JSON node?
- Can I UPDATE only object X and value Z under Y, without affecting everything else?
- And more…

All will be tried to answer in the continuation of this article.

![JSON](https://miro.medium.com/v2/resize:fit:700/1*lHvYwhJ_HM0kgss2UIMRwQ.png)

## JSON Data Type

MySQL has supported the **_JSON_** data type since **_version 5.7.8_** (with new features added in every version, some of which will be covered in this article from **_MySQL 8_**). JSON allows you to store documents more efficiently and functionally than the **_TEXT_** format used in previous versions.

It allows searching directly by keys or arrays within the JSON structure, making it extremely fast.

Storing data as JSON is roughly equivalent to storing **_LONGBLOB_** or **_LONGTEXT_** data.

You should only use the JSON data type if it’s really necessary, as it takes up storage space in the database.

## Creating a Table with JSON

In a typical **CREATE** or **ALTER** query, simply adding a JSON column is enough. Since this is a well-known topic, I’ll skip over it quickly.

```sql
CREATE TABLE `settings` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT UNSIGNED NOT NULL,
  `config` JSON DEFAULT NULL,
  PRIMARY KEY (`id`)
);
```

### When to Use It?

Imagine a data structure that multiple customers can customize, update, and use according to their preferences. If you need a structure that will be used frequently, you can do so using the JSON data type. For instance, think about the settings of a chat application with hundreds of parameters. Without JSON, you’d need to create individual fields for each, write migrations, and more. With JSON, you can achieve all this in seconds.

After adding JSON data to the database, you don't need to worry about how to update, delete, or add keys. JSON functions allow you to handle this easily. Let’s now examine how these operations can be performed.

## JSON Validation

Before adding JSON data to the table, you should validate it. **_JSON_VALID_** returns 1 if the structure is valid JSON and 0 if it's not. Here's a simple code block demonstrating this check:

```sql
SELECT JSON_VALID('{"color": "#1F71EA"}') AS Result;
+--------+
| Result |
+--------+
|      1 |
+--------+
```

## Creating JSON Fields

Now that we have validated JSON data, let’s see how to add it to the database.

```sql
INSERT INTO `settings` (`company_id`, `config`)
VALUES (
  1,
  JSON_OBJECT("color", "#1F71EA", "background_color", "#FFFFFF", ...)
);
+----------------------------+
| Query 1 OK: 1 row affected  |
+----------------------------+
```

## Adding JSON Data

There are multiple ways to create JSON data, depending on your needs. The functions below can be used in both **INSERT** and **UPDATE** queries. Their primary purpose is to help create a JSON set by adding variables directly, rather than manually constructing the JSON structure.

### JSON_ARRAY

This function returns the values passed to it as a JSON array. Be cautious when using it: if you add multiple key/value pairs, only the first is preserved. Additionally, keys are sorted, and extra spaces between pairs are removed.

### _JSON_OBJECT_

This returns the values passed to it as a JSON object. However, you can't define a key as NULL when creating the object.

### _JSON_QUOTE_

It takes a string value and returns it as a quoted JSON string. This is typically used to construct a JSON string for inclusion in another JSON structure.

```sql
SELECT JSON_ARRAY(1, "test", NULL, TRUE, CURTIME());
+---------------------------------------------+
| [1, "test", null, true, "11:30:24.000000"]  |
+---------------------------------------------+

SELECT JSON_OBJECT('id', 87, 'name', 'ufuk');
+-----------------------------------------+
| {"id": 87, "name": "ufuk"}              |
+-----------------------------------------+

SELECT JSON_QUOTE('A'), JSON_QUOTE("B"), JSON_QUOTE('"C"');
+-----------------+-----------------+-------------------+
| JSON_QUOTE('A') | JSON_QUOTE("B") | JSON_QUOTE('"C"')  |
+-----------------+-----------------+-------------------+
| "A"             | "B"             | "\"C\""            |
+-----------------+-----------------+-------------------+
```

## JSON_TYPE

You can check the type of a JSON structure (ARRAY, OBJECT, scalar, etc.) using **_JSON_TYPE_**.

```sql
SELECT JSON_TYPE('[1, 2, "abc"]');
+-------+
| ARRAY |
+-------+

SELECT JSON_TYPE('{"a": 1, "b": 2}');
+--------+
| OBJECT |
+--------+

SELECT JSON_TYPE('{"a": 1, "b": 2');
+---------------+
| Query 1 ERROR |
+---------------+
```

## Searching JSON Data

It’s possible to search for values within JSON. MySQL allows for searches similar to a **_LIKE_** query, with multiple search options available.

### JSON_CONTAINS

This checks if a value exists within a JSON key and returns 1 or 0.

> The path to the key uses the “_$._” syntax.

### JSON_SEARCH

This is similar to a **_LIKE_** query. It can use **one** or **all** parameters to specify whether all or just one condition must be met. It returns 1 for a match and 0 for no match.

### JSON_EXTRACT

This allows you to specify key paths and conditions within JSON data. If desired, you can use it in a **SELECT** query to display values from JSON.

```sql
SELECT *
  FROM `settings`
  WHERE JSON_CONTAINS(config, '"#1F71EA"', '$.color');

SELECT *
  FROM `settings`
  WHERE JSON_SEARCH(config, 'one', '#FFFFFF') IS NOT NULL;

SELECT JSON_EXTRACT(config, '$.color') AS `Color`
  FROM `settings`;
```

Instead of using **JSON_EXTRACT**, you can use the shorthand **->** operator introduced in MySQL **8**.

```sql
SELECT company_id, config->"$.color" AS `Color`
  FROM `chat_settings`;

SELECT
  company_id, config->"$.general.background_color" AS `Color`
FROM `chat_settings`
WHERE
  config->"$.general" IS NOT NULL;
```

## Updating JSON Data

You can use **JSON_INSERT**, **JSON_REPLACE**, and **JSON_SET** to update JSON values. These functions require a path index, denoted by **$.,** to specify which part of the JSON object to update.

### JSON_INSERT

This adds new key/value pairs to an existing JSON object.

### JSON_REPLACE

This replaces existing key/value pairs. If the key exists, it is updated; otherwise, nothing happens.

### JSON_SET

This combines **INSERT** and **REPLACE** by adding new key/value pairs if they don’t exist, or updating them if they do.

```sql
UPDATE `settings`
SET `config` = JSON_INSERT(
  `config`,
  '$.name',
  'Ufuk'
)
WHERE
  `id` = 1;

UPDATE `settings`
SET `config` = JSON_REPLACE(
    `config`,
    '$.general.name',
    'Ufuk Özcan'
)
WHERE
    `id` = 1;

UPDATE `settings`
SET `config` = JSON_SET(
    `config`,
    '$.general.surname',
    'Özcan'
)
WHERE
    `id` = 1;
```

## Deleting JSON Data

To delete specific key/value pairs or rows using JSON data, you can use the following queries:

```sql
UPDATE `settings`
SET `config` = JSON_REMOVE(`config`, '$.name')
WHERE
  `id` = 1;

DELETE
FROM `chat_settings`
WHERE
  `id` = 42 AND
  JSON_EXTRACT(`config`, '$.name') = 'Ufuk' AND
  JSON_EXTRACT(`config`, '$.surname') = 'Özcan';
```

## BONUS

For more information on additional JSON functions like **JSON Table Functions**, **JSON Schema Validation**, and **JSON Utility Functions**, check out the [**official MySQL documentation**](https://dev.mysql.com/doc/refman/8.0/en/json-functions.html).

**Ref:** [Ufuk Özcan - Medium](https://engineering.teknasyon.com/korkusuzca-mysql-de-json-da0285addf6f)
