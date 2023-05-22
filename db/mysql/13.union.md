# MySQL UNION

## What is a Union?

Unions combine the results from multiple SELECT queries into a consolidated result set. Suppose we have two tables as follows

<img src="https://www.guru99.com/images/Table1%281%29.png" title="Table1"><br>
<img src="https://www.guru99.com/images/Table2%281%29.png" title="Table2"><br>

Let’s now create a UNION query to combines both tables using DISTINCT

```SQL
SELECT column1, column2 FROM `table1`
UNION DISTINCT
SELECT  column1,column2  FROM `table2`;
```

<img src="https://www.guru99.com/images/Table1UnionTable2Distinct.png" title="Union-Distinct">

**NOTE:** MySQL uses the DISTINCT clause as default when executing UNION queries if nothing is specified.

Let’s now create a UNION query to combines both tables using ALL

```SQL
SELECT `column1`,` column2` FROM `table1`
UNION ALL
SELECT ` column1`,` column2`  FROM `table2`;
```

<img src="https://www.guru99.com/images/Table1UnionTable2ALL.png" title="Union-ALL"><br>

## Why use Unions?

Suppose there is a flaw in your database design and you are using two different tables meant for the same purpose. You want to consolidate these two tables into one while omitting any duplicate records from creeping into the new table. You can use UNION in such cases.

## Summary

- The UNION command is used to combine more than one SELECT query results into a single query contain rows from all the select queries.
- The number of columns and data types in the SELECT statements must be the same in order for the UNION command to work.
- The DISTINCT clause is used to eliminate duplicate values from the UNION query result set. MySQL uses the DISTINCT clause as the default when executing UNION queries if nothing is specified.
- The ALL clause is used to return all even the duplicate rows in the UNION query.

**Ref:** For more informations and examples follow the link: https://www.guru99.com/unions.html
