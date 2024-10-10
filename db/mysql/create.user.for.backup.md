# Creating a Read-Only User for MySQL Backups

**TLDR:** Backup MySQL databases securely using a user with minimal privileges to avoid risks with root credentials in automated tasks like cronjobs.

Normally, a command like the one below can be used to back up MySQL databases:

```bash
mysqldump --all-databases > backup.sql -u root -p
```

However, this command is not suitable for cronjobs or automated systems because it will prompt for the MySQL root password, causing the process to halt until the password is manually entered. Including the password in the command (e.g., `-u root -pPASSWORD`) may solve this issue, but it's unsafe to store credentials of a highly privileged user in plain text for cronjobs.

To reduce security risks, create a user with limited permissions, specifically for backup purposes:

```sql
GRANT LOCK TABLES, SELECT ON *.* TO 'BACKUPUSER'@'%' IDENTIFIED BY 'PASSWORD';
FLUSH PRIVILEGES;
```

Now, add this user to the cronjob for backups:

```bash
mysqldump --all-databases > backup.sql -u BACKUPUSER -pPASSWORD
```

**Ref:** [Eray Alakese - Medium](https://medium.com/@erayalakese/mysql-yedeklemeleri-i%CC%87%C3%A7in-sadece-okuma-i%CC%87zni-olan-bir-kullan%C4%B1c%C4%B1-olu%C5%9Fturun-b1a9392bf356)
