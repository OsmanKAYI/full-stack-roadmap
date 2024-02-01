# MySQL Foreign Key

## MySQL FOREIGN KEY syntax

```sql
[CONSTRAINT constraint_name]
FOREIGN KEY [foreign_key_name] (column_name, ...)
REFERENCES parent_table(colunm_name,...)
[ON DELETE reference_option]
[ON UPDATE reference_option]
```

In this syntax:

- First, specify the name of foreign key constraint that you want to create after the CONSTRAINT keyword. If you omit the constraint name, MySQL automatically generates a name for the foreign key constraint.

- Second, specify a list of comma-separated foreign key columns after the FOREIGN KEY keywords. The foreign key name is also optional and is generated automatically if you skip it.

- Third, specify the parent table followed by a list of comma-separated columns to which the foreign key columns reference.

- Finally, specify how foreign key maintains the referential integrity between the child and
  parent tables by using the ON DELETE and ON UPDATE clauses. The reference_option determines
  action which MySQL will take when values in the parent key columns are deleted (ON DELETE)
  or updated (ON UPDATE).

MySQL has five reference options: CASCADE, SET NULL, NO ACTION, RESTRICT, and SET DEFAULT.

- `CASCADE`: if a row from the parent table is deleted or updated, the values of the matching rows in the child table automatically deleted or updated.
- `SET NULL`: if a row from the parent table is deleted or updated, the values of the
  foreign key column (or columns) in the child table are set to NULL.
- `RESTRICT`: if a row from the parent table has a matching row in the child table, MySQL
  rejects deleting or updating rows in the parent table.
- `NO ACTION`: is the same as RESTRICT.
- `SET DEFAULT`: is recognized by the MySQL parser. However, this action is rejected by
  both InnoDB and NDB tables.

In fact, MySQL fully supports three actions: `RESTRICT`, `CASCADE` and `SET NULL`.

If you don’t specify the `ON DELETE` and `ON UPDATE` clause, the default action is `RESTRICT`.

## Drop MySQL foreign key constraints

```sql
ALTER TABLE table_name
DROP FOREIGN KEY constraint_name;
```

In this syntax:

- First, specify the name of the table from which you want to drop the foreign key after the ALTER TABLE keywords.
- Second, specify the constraint name after the DROP FOREIGN KEY keywords.

Notice that constraint_name is the name of the foreign key constraint specified when you
created or added the foreign key constraint to the table.

To obtain the generated constraint name of a table, you use the SHOW CREATE TABLE statement:

```sql
SHOW CREATE TABLE table_name;
```

## Disabling foreign key checks

Sometimes, it is very useful to disable foreign key checks e.g., when you import data from a CSV file into a table. If you don’t disable foreign key checks, you have to load data into a
proper order i.e., you have to load data into parent tables first and then child tables, which can be tedious. However, if you disable the foreign key checks, you can load data into tables in any order.

To disable foreign key checks, you use the following statement:

```sql
SET foreign_key_checks = 0;
```

And you can enable it by using the following statement:

```sql
SET foreign_key_checks = 1;
```

**Ref:** https://www.mysqltutorial.org/mysql-foreign-key/
