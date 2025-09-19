# MariaDB Connection Refused

## Summary

- The application and Adminer could not connect to MariaDB because the database service was down and the system tables were missing or corrupted.
- The MariaDB system tables were re-initialized, the service was started, credentials were configured, and connectivity was verified. The issue is resolved.

## Symptoms

- “Connection refused” reported by Adminer and the application.
- `systemctl status mariadb` indicated the service failed to start due to missing system tables:
  - “Table 'mysql.plugin' does not exist.”
  - “Table 'mysql.servers' does not exist.”
  - “Table 'mysql.db' does not exist.”

## Root Cause

- The MariaDB data directory (`/var/lib/mysql`) did not contain initialized system tables (the `mysql.*` schema was incomplete). Without these, the server cannot start and therefore refuses TCP connections on `127.0.0.1:3306`.

## Diagnostics Performed

- **Service status**
  - `sudo systemctl status mariadb`.
- **Failure confirmation**
  - Verified errors indicating missing system tables.
- **Port availability**
  - After re-initialization, confirmed the listener on `127.0.0.1:3306` via `sudo ss -ltnp | grep 3306`.
- **Client connectivity validation**
  - Executed `mysql -h 127.0.0.1 -P 3306 -u root -proot -e "SELECT 1;"`.

## Remediation Steps

1. **Stopped MariaDB and inspected the data directory**

   - `sudo systemctl stop mariadb`
   - `sudo ls -la /var/lib/mysql`
   - Ensured ownership:
     - `sudo chown -R mysql:mysql /var/lib/mysql`

2. **Initialized MariaDB system tables (creates `mysql.*`)**

   - `sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql`

3. **Started the service and verified it is listening**

   - `sudo systemctl start mariadb`
   - `sudo systemctl status mariadb`
   - `sudo ss -ltnp | grep 3306` → listening on `127.0.0.1:3306`

4. **Configured credentials and created the application database**

   - Entered the shell:
     - `sudo mysql`
   - In MariaDB prompt:
     - `ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';`
     - `CREATE USER IF NOT EXISTS 'root'@'127.0.0.1' IDENTIFIED BY 'root';`
     - `FLUSH PRIVILEGES;`
     - `CREATE DATABASE IF NOT EXISTS muhasebe_api CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`

5. **Verified connectivity as used by the application**
   - `mysql -h 127.0.0.1 -P 3306 -u root -proot -e "SELECT 1;"`

## Rationale

- `mariadb-install-db` populated the missing system tables (`mysql.*`), allowing MariaDB to boot correctly.
- Starting the service made it listen on `127.0.0.1:3306`, so TCP connections stopped being refused.
- Setting the root password for both `localhost` (socket) and `127.0.0.1` (TCP) made authentication consistent with your `.env`.
- Creating the `muhasebe_api` database ensured Adminer and the app had a valid target schema.

## Adminer Configuration (Non‑Docker)

- **System:** MySQL
- **Server:** `127.0.0.1`
- **Username:** `root`
- **Password:** `root`
- **Database:** `muhasebe_api`

## Laravel `.env` (reference)

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=muhasebe_api
DB_USERNAME=root
DB_PASSWORD=root
```

## Recommended Hardening (Optional)

- **Create a dedicated app user instead of using root over TCP:**
  - In MariaDB:
    - `CREATE USER IF NOT EXISTS 'muhasebe_user'@'127.0.0.1' IDENTIFIED BY 'strong_password';`
    - `GRANT ALL PRIVILEGES ON muhasebe_api.* TO 'muhasebe_user'@'127.0.0.1';`
    - `FLUSH PRIVILEGES;`
  - Update `.env` and Adminer to use this user.

## Prevention Checklist

- **Service health:** `sudo systemctl is-active mariadb` should be “active”.
- **Port listening:** `sudo ss -ltnp | grep 3306` should show `127.0.0.1:3306`.
- **Backups:** Regularly back up `/var/lib/mysql` or individual databases (`mysqldump`).
- **Avoid accidental deletion:** Do not delete `mysql` system schema contents in `/var/lib/mysql`.
- **Preferred auth:** For TCP clients (Adminer/app), use users defined with `'127.0.0.1'` host and a password.
