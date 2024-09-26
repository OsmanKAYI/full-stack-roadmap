# How to Merge Rows in MySQL?

To merge rows in MySQL, use `GROUP_CONCAT()`.

- First, create a table.

```sql
create table DemoTable123 (
   Id int,
   Name varchar(100)
);
```

- Insert some records in the table using `insert` command.

```sql
insert into DemoTable123 values(101,'Osman');
insert into DemoTable123 values(102,'Osman');
insert into DemoTable123 values(103,'Furkan');
insert into DemoTable123 values(104,'Furkan');
insert into DemoTable123 values(105,'Furkan');
insert into DemoTable123 values(106,'Veysel');
insert into DemoTable123 values(107,'Veysel');
insert into DemoTable123 values(108,'Nuri');
insert into DemoTable123 values(109,'Nuri');
insert into DemoTable123 values(110,'Nuri');
```

- Display all records from the table using `select` command.

```sql
select * from DemoTable123;
```

- The result will be like the following.

```
+------+---------+
| Id   | Name    |
+------+---------+
| 101  | Osman   |
| 102  | Osman   |
| 103  | Furkan  |
| 104  | Furkan  |
| 105  | Furkan  |
| 106  | Veysel  |
| 107  | Veysel  |
| 108  | Nuri    |
| 109  | Nuri    |
| 110  | Nuri    |
+------+---------+
```

- Following is the query to merge rows.

```sql
select Name,group_concat(Distinct Id SEPARATOR ',') from DemoTable123 group by Name;
```

- The result will be like the following.

```
+---------+-----------------------------------------+
| Name    | group_concat(Distinct Id SEPARATOR ',') |
+---------+-----------------------------------------+
| Nuri    | 108,109,110                             |
| Veysel  | 106,107                                 |
| Furkan  | 103,104,105                             |
| Osman   | 101,102                                 |
+---------+-----------------------------------------+
```

**Ref:** https://www.tutorialspoint.com/how-to-merge-rows-in-mysql
