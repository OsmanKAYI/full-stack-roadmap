# DATABASE (DB)

A database is an organized collection of data that is stored and accessed electronically. Databases are used to store and manage data for a variety of applications, including websites, mobile apps, and enterprise systems.

## Types of Databases

There are several types of databases, each with their own strengths and weaknesses. Here are some common types of databases:

- Relational Databases: These databases store data in tables with rows and columns. Examples include MySQL, PostgreSQL, and SQLite.
- NoSQL Databases: These databases do not use the traditional table-based structure of relational databases. Instead, they use a variety of data models, such as key-value pairs or document-based data. Examples include MongoDB, Cassandra, and Redis.
- Graph Databases: These databases are designed to store and manage highly interconnected data, such as social networks or recommendation engines. Examples include Neo4j and OrientDB.

## Security

Security is an important consideration when using databases. You should take steps to secure your database environment by implementing firewalls, access controls, and other security measures.

## Documentation

Each database management system will have its own documentation and support resources available. This site mostly cover the MySQL Database.

### MySQL

MySQL is an open-source relational database management system. Its name is a combination of "My", the name of co-founder Michael Widenius's daughter My, and "SQL", the acronym for Structured Query Language.

- [SQL Tutorial for Beginners](https://www.youtube.com/watch?v=-fW2X7fh7Yg)
- [Increase Maximum Upload File Size](./mysql/00.increase.max.upload.file.size.md)
- [What is SQL](./mysql/01.sql.md)
- [Basic MySQL Command Examples](./mysql/02.temel.mysql.komutlari.ornekleri.md)
- [MySQL String Commands](./mysql/03.mysql.string.komutlari.md)
- [MySQL Time Functions](./mysql/04.mysql.tarih.fonksiyonlari.md)
- [MySQL Funtions](./mysql/05.mysql.functions.md)
- [Top 27 SQL Syntax for Developers](https://morioh.com/p/27dd41b0d365?f=5c21fb01c16e2556b555ab32)
- [SQLi (SQL Injection Weakness)](./mysql/06.sqli.sql.injection.zaafiyeti.md)
- [SQL Foreign Key Constraint](./mysql/07.sql.foreign.key.constraint.md)
- [MySQL Foreign Key](./mysql/08.mysql.foreign.key.md)
- [MySQL Engines](./mysql/09.mysql.engines.md)
- [Import Text File to MySQL](./mysql/10.import.text.file.to.mysql.md)
- [CLI Connection Without Password](./mysql/11.cli.connection.without.password.md)
- [Merge Rows in MySQL](./mysql/12.group.concat.md)

#### Basic MySQL

- [Basic SQL Commands](./mysql/socratica/01.create.alter.drop.insert.select.update.delete.sql)
- [Select](./mysql/socratica/02.select.sql)
- [Inser Into](./mysql/socratica/03.insert.into.sql)
- [Update](./mysql/socratica/04.update.sql)
- [Delete](./mysql/socratica/05.delete.sql)
- [Join](./mysql/socratica/06.join.sql)
- [Join Examples](./mysql/socratica/07.join.examples.sql)
- [View Concat Coalesce](./mysql/socratica/08.view.concat.coalesce.sql)
- [Index](./mysql/socratica/09.index.sql)

#### Examples

- [Wordle](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/mysql/examples/kelimeler.db)
- [Referendum](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/mysql/examples/referandum)
- [Sakila](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/mysql/examples/sakila.db)

#### Examples with Socratica

[Socratica](https://www.youtube.com/@Socratica) is a kind of usefull channel which can be followed by anyone who wants to learn something. You can watch the video series prepared for [SQL](<[Socratica](https://www.youtube.com/watch?v=nWyyDHhTxYU&list=PLi01XoE8jYojRqM4qGBF1U90Ee1Ecb5tt)>).

- [Earthquake](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/mysql/socratica/earthquake)
- [Martian](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/mysql/socratica/martian)
- [Person](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/mysql/socratica/person)
- [Song](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/mysql/socratica/song)
- [Bonus: How to Create 10000 Data with Python](./mysql/socratica/create.10000.data.py)

### SQLite

SQLite is a database engine written in the C programming language. It is not a standalone app; rather, it is a library that software developers embed in their apps. As such, it belongs to the family of embedded databases.

- [Install SQLite Browser on Ubuntu](./sqlite/00.install.sqlite.browser.ubuntu.md)
- [How to Change Date Format (SQL File)](./sqlite/01.change.date.format.sql)
- [Lux Temperature Humidity Example](https://github.com/OsmanKAYI/osmankayi.com/tree/main/db/sqlite/lux-temperature-humidity)
