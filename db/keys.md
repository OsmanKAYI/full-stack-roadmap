# What are KEYS?

Keys in a database are like labels or tags that help you quickly find and organize information. They ensure that each piece of information is unique and can be linked to other related information.

## Types of Keys

**1. Primary Key**

- A primary key is a unique identifier for each record (row) in a table.
- It ensures that each row in the table has a unique value for the primary key column.
- The primary key enforces entity integrity and is used to establish relationships between tables through foreign keys.
- It can consist of one or multiple columns.
- Think of it as a special ID card for each row in a table. This ID card must be unique for every row, and it's used to easily identify and find each row. Imagine in a school, every student gets a unique student ID.

**2. Unique Key**

- A unique key, also known as a unique constraint, enforces uniqueness but does not necessarily serve as the primary identifier for a record.
- Unlike the primary key, it allows for NULL values (in the case of single-column unique keys).
- A table can have multiple unique keys.
- Similar to a primary key, but it doesn't have to be the main ID. It's like having a special ticket to enter an event. Each ticket is unique, but it's not your personal ID.

**3. Foreign Key**

- A foreign key establishes a relationship between two tables by linking a column in one table to the primary key or unique key column of another table.
- It helps maintain referential integrity by ensuring that values in the foreign key column correspond to valid values in the referenced table's primary key or unique key column.
- This is like a reference to another table. Let's say you have a list of students in one table, and another table for their courses. The foreign key in the courses table connects each course to a student by using the student's ID.

**4. Candidate Key**

- A candidate key is a set of columns in a table that could potentially serve as a primary key because they are unique and can uniquely identify each row.
- From the candidate keys, one is chosen to be the primary key.
- These are like backup keys. They could be used as primary keys, but you choose one to be the main key.

**5. Super Key**

- A super key is a set of one or more columns in a table that can be used to identify rows uniquely. It may contain more columns than necessary to uniquely identify rows.
- A super key can be used to create multiple candidate keys.
- Imagine you have a box with multiple keys, and any of them can open it. Each key can unlock the box, but you only need one key to do it.

**6. Composite Key**

- A composite key, also known as a compound key, consists of two or more columns used together to uniquely identify records in a table.
- It is often used when no single column can provide a unique identifier.
- This is when you need two or more things together to unlock something. It's like needing both your username and password to log into an account.

**7. Surrogate Key**

- A surrogate key is an artificial key created solely for the purpose of being a primary key. It does not have any business meaning and is often an auto-incremented integer.
- Surrogate keys are used to simplify database operations and improve performance.
- It's an extra, made-up key. Imagine you have a toy that came with a secret code printed on it. You use this code to identify the toy, even though it doesn't have any special meaning.

**8. Alternate Key**

- An alternate is a secondary candidate key that is capable of identifying a row uniquely. However, such a key is not used as a primary key because, out of all the generated candidate keys, only one key is selected as the primary key.
- Think of an alternate key as a backup key or a spare key for a locked door. If you have a door that can be opened with a main key (which is like a primary key), the alternate key is another key that can also open the same door. It's an alternative way to access the same thing. So, in a database, it's a different method to identify and find specific pieces of data, just like having a spare key to unlock the same information.

<div style="text-align: center;">
  <img src="https://pbs.twimg.com/media/F8UJo0HXUAAsgW-?format=jpg&name=small">
</div>

**Ref:** https://twitter.com/maybeshalinii/status/1712785840454152665?t=4Gvpczol-bLbX4_ko46MTA&s=35
