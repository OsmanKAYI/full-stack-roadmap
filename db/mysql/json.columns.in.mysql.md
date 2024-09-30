# Don’t Use JSON Columns in MySQL Here’s Why

**TLDR:** Storing data in JSON fields may seem convenient, but it introduces significant limitations in terms of query performance, validation, and data structure enforcement. Traditional columns offer better optimization, validation, and scalability.

Storing data in separate columns takes advantage of the features that relational databases offer. Using individual columns enables efficient aggregation and filtering without the overhead of parsing non-relational structures, which often requires third-party tools or custom functions.

JSON data lacks a fixed structure, making consistency checks impossible without parsing and writing custom validations. Though storing variable or complex structures is easier, it introduces several issues.

## Drawbacks of Storing Data in JSON Fields

- Queries become more complex compared to traditional SQL queries.
- JSON fields introduce a steep learning curve, especially when sorting or searching data.
- Storing multiple pieces of data in a single field prevents the use of:
  - Constraints on embedded fields.
  - Data type definitions.
  - Indexing.
  - Aggregation or search functions.
  - Enforcing valid ranges and values for fields.
  - Easy scalability.

The database server struggles to:

- Maintain index statistics for each field.
- Optimize queries, as string manipulation is needed to extract data.
- Store data optimally for each embedded field.

## What Is Gained?

- Some field names.
- Flexibility in the database, but at the cost of more complex application functions, as validations must be handled both when writing and reading data.
- Potential headaches when fixing JSON field issues.

## General Guideline

Use traditional columns whenever possible, especially if performing calculations on parts of the data. MySQL, with well-designed indexes, can manage hundreds of millions of rows efficiently. Problems generally arise when tables exceed one billion rows.

## When to Use JSON

JSON is suitable when consistency enforcement isn't critical, or when the data is not used for statistical queries or filtering. However, even in these cases, the assumption of never needing such functionality often proves false. JSON can be advantageous when dealing with rarely changed information or applications that expect JSON, optimizing for read and load performance.

**NOTE:** For further reading visit: [How to Work with JSON Data in MySQL](how.to.use.json.columns.md) and [Get JSON from table with PHP PDO](https://onelinerhub.com/php-pdo/get-json-from-table-with-php-pdo)

**Ref:** [Code Axion The Security Breach - Medium](https://medium.com/@codeaxion77/dont-use-json-columns-in-mysql-here-s-why-efbb82aafffd)
