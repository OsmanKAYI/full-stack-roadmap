# Zabbix 5.0 Overview

## TLDR

Zabbix 5.0 introduces numerous features and improvements, including enhanced monitoring capabilities, new visualization tools, and expanded support for various technologies. It emphasizes scalability and flexibility for complex IT environments.

## Introduction

For an IT professional, having up-to-date information on physical or virtual servers and applications is crucial. This highlights the importance of monitoring applications. There are many monitoring applications available. In this article, we will examine one of them, “Zabbix.” This open-source application comes with excellent documentation, making it a valuable resource for improving our system once installations are done correctly.

### Topology

As seen in the graph above, Zabbix can monitor through its own agent or any port you choose. This allows you to track the status of your application through ports you define.

### Server Installation

#### Installation Details

- CentOS 7
- Zabbix Server 5.0
- PostgreSQL

#### Zabbix Repo Installation

```bash
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
npm clean all
```

#### Install Zabbix Server and Agent

```bash
npm install zabbix-server-pgsql zabbix-agent
```

#### Install Zabbix Frontend

Activate Red Hat Software Collections.

```bash
npm install centos-release-scl
```

Edit the `/etc/npm.repos.d/zabbix.repo` file to enable the frontend repository.

```bash
[zabbix-frontend]
...
enabled=1
...
```

Install the frontend packages.

```bash
npm install zabbix-web-pgsql-scl zabbix-apache-conf-scl
```

#### PostgreSQL Database and PHP Installation

```bash
npm update -y
npm install -y php postgresql-server postgresql-contrib php-pgsql dejavu-sans-fonts php-bcmath php-gd php-ldap php-mbstring php-xml wget
```

Start the service:

```bash
service postgresql initdb
systemctl start postgresql
```

Add it to the restart list:

```bash
systemctl enable postgresql
service postgresql restart
```

#### Database Configuration

```bash
# Create a user named 'zabbix'
sudo -u postgres createuser --pwprompt zabbix

# Create a database named 'zabbix' owned by 'zabbix'
sudo -u postgres createdb -O zabbix -E Unicode -T template0 zabbix

# Import database templates
zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix
```

#### Zabbix Server Configuration

Edit the `/etc/zabbix/zabbix-server.conf` file to include:

```bash
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=zabbix1234
```

For Zabbix frontend PHP configuration, edit `/etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf`:

```bash
php_value[date.timezone] = Europe/Istanbul
```

#### Firewall Configuration

For Linux firewall:

```bash
firewall-cmd --permanent --add-port=10050/tcp
firewall-cmd --permanent --add-port=10051/tcp
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
systemctl restart firewalld
```

For IP Tables:

```bash
iptables -I INPUT 5 -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -I INPUT 5 -p tcp -m tcp --dport 10050 -j ACCEPT
iptables -I INPUT 5 -p tcp -m tcp --dport 10051 -j ACCEPT
```

Note: I disabled SELinux and firewalld on the server where I performed the installation, so I did not apply the above firewall configurations. If you encounter any issues, feel free to comment.

If you've made it this far successfully, it’s time to access Zabbix from your browser:

```link
http://<server_address>/zabbix
```

Check if all requirements are OK.

Check the database configurations.

Enter the Zabbix Server details.

Finally, review the configuration summary and click "Next Step" if everything is correct.

After completing the installation, you should see a screen like this.

Congratulations if you’ve made it this far; your monitoring application is now ready. The next step is to install agents on the servers you wish to monitor.

#### Client Installation

Client installation is much simpler compared to server installation. Download the appropriate Zabbix agent executable file for your system and run it on the server you want to monitor.

After installation, you only need to configure the configuration file, which varies depending on the operating system. On Linux distributions, it is located at `/etc/zabbix/zabbix_agent.conf`. On Windows machines, it is located at `C:\zabbix\zabbix_agent.conf`.

#### Basic Configuration Changes

```bash
Server=127.0.0.1,serveraddress.com
ServerActive=127.0.0.1
HostName=Zabbix
```

You can either use the server’s IP address or DNS name for `Server`, and `ServerActive` should be the same as `Server`. Set the hostname to the name you want the server to use in discovery. You can also use `HostnameItem=system.hostname` to ensure the server is discovered based on its hostname.

#### Adding Hosts

To add new servers, go to Configuration → Hosts in the left panel. You have two options: "Create Host" or "Import."

- **Create Host**: Allows you to add a new server manually.
- **Import**: Lets you use a pre-prepared JSON file to add servers.

In the "Create Host" menu:

- **Templates**: Use templates to avoid manually adding items and triggers.
- **IPMI**: If you monitor servers via IPMI, you can view those data here.
- **Tags**: Add tags to classify hosts.
- **Macros**: Define macros for item and trigger details.
- **Inventory**: Manually enter or automatically populate inventory details.
- **Encryption**: Configure encryption if used.

#### Host Groups

Host groups allow you to categorize your servers. Each server must belong to at least one group. You can create a new group from Configuration → Host Groups or add a new group when defining a host.

#### Item Definition

Items are objects that gather data based on parameters for monitoring. They can be viewed under the Items section in the host information.

To create an item:

- **Name**: Provide a meaningful name.
- **Type**: Select the method of check (e.g., Zabbix Agent, SNMP).
- **Key**: Define what the item will check.
- **Host Interface**: Choose the connection interface.
- **Type of Information**: Specify the result type (e.g., numeric, text).
- **Units**: Define units for results (e.g., GB).
- **Update Interval**: Set how often checks occur.
- **Custom Interval**: Define specific check intervals.
- **History Storage Period**: Define how long detailed and trend data is stored.

#### Trigger Definition

Triggers are crucial as they interpret the data collected by items. Define triggers based on threshold values and their significance.

To create a trigger:

- **Name**: Give a descriptive name.
- **Operational Data**: Define what data to show.
- **Severity**: Set the importance of the trigger.
- **Expression**: Define the conditions for triggering an alert.
- **OK Event Generation**: Specify conditions for when the issue is resolved.
- **Allow Manual Close**: Optionally allow manual acknowledgment of issues.
- **Description**: Provide a description of the trigger.

#### Action Definition

Actions notify you of issues or perform tasks based on triggers. With Zabbix 5.0, you can send notifications via email or integrate with other platforms like JIRA, MS Teams, Slack, Telegram, etc.

To create an action:

- **Operation Type**: Define the type of notification or command.
- **Send to User Groups**: Specify which user groups receive notifications.
- **Send to Users**: Specify individual users.
- **Send Only To**: Choose the notification method.
- **Custom Message**: Customize the notification message.

For recovery notifications, configure similar settings to inform you when an issue is resolved.

#### Dashboard Creation

Dashboards visualize the data and configurations you’ve set up.

### Creating Dashboards

Dashboards are where you visualize the configurations you've set up. The default Zabbix installation provides a basic dashboard, but you can customize it or create new ones.

![Default Dashboard](img/yazilar/zabbix-5-0/zbbx37.png)

To create a new dashboard:

1. Click on the three lines next to the **Edit Dashboard** button at the top right and select **Create New**.

    Alternatively, navigate to the **All dashboards** page under the **Global View** heading at the top left.

    ![Create New Dashboard](img/yazilar/zabbix-5-0/zbbx38.png)

2. Assign ownership to the dashboard. Only one person can own the dashboard, but you can share it with others by clicking the three lines button and selecting **Share**. You can then grant **Read-only** or **Read-Write** permissions to other users. Here, I am creating a screen named **Operator**.

   ![Dashboard Ownership](img/yazilar/zabbix-5-0/zbbx39.png)

   ![Share Dashboard](img/yazilar/zabbix-5-0/zbbx40.png)

3. Add widgets to visualize the objects on the dashboard. In edit mode, click on an empty area to add a new widget.

   ![Add Widget](img/yazilar/zabbix-5-0/zbbx41.png)

   - **Type**: Choose from various options like Action Log, Problems, and URL monitoring widgets.
   - **Refresh interval**: Determines how often the widget updates.
   - **Show**: Select the problems to display. Options include Recent Problems (current unresolved problems), Problems (all open problems), and History (past problems).
   - **Host groups**: Select the host groups from which problems will be shown.
   - **Exclude host groups**: Exclude specific host groups from the display.
   - **Hosts**: Add individual hosts.
   - **Severity**: Choose the severity levels (e.g., High, Disaster) for which issues should be shown.
   - **Tags**: Filter problems by tags.
   - **Show unacknowledged problems**: Display problems that have not been acknowledged. Unacknowledged problems will appear on the screen.
   - **Show lines**: Specify the number of problems to display at once. Additional pages will be created if the number exceeds the limit.

   After configuring the widget, click **Add** to add it to your dashboard.

   ![Widget Configuration](img/yazilar/zabbix-5-0/zbbx42.png)

   ![Save Widget](img/yazilar/zabbix-5-0/zbbx43.png)

4. Save your changes by clicking **Save Changes** at the top right.

   ![Save Changes](img/yazilar/zabbix-5-0/zbbx44.png)

Now you can view problems on your servers as shown below. When a problem is resolved, it will briefly display as RESOLVED before disappearing.

![Resolved Problem](img/yazilar/zabbix-5-0/zbbx45.png)

### Errors and Solutions

#### DB Connection

![DB Connection Error](img/yazilar/zabbix-5-0/zbbx46.png)

1. Edit `/var/lib/pgsql/data/postgresql.conf` to include:

   ```bash
   listen_addresses = '*'
   ```

   This line may be commented out by default. Uncomment it or add it if it's missing.

2. Add the following line to the end of `/var/lib/pgsql/data/pg_hba.conf`:

   ```bash
   # TYPE  DATABASE        USER            ADDRESS                 METHOD
   host    all             all             0.0.0.0/0                 md5
   ```

3. Restart the PostgreSQL service:

   ```bash
   systemctl restart postgresql
   ```

#### Charset Mismatch

![Charset Mismatch Error](img/yazilar/zabbix-5-0/zbbx47.png)

If you encounter a charset mismatch error, unfortunately, it can't be fixed easily. Follow these steps:

1. Switch to the `postgres` user and drop the existing database:

   ```bash
   sudo -u postgres dropdb zabbix
   ```

   If prompted for a password, change the `md5` lines in `/var/lib/pgsql/data/pg_hba.conf` to `ident`, then restart PostgreSQL:

   ```bash
   systemctl restart postgresql
   ```

2. After dropping the database, create a new one with the appropriate charset and import the schema:

   ```bash
   createdb -O zabbix -E Unicode -T template0 zabbix
   zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix
   ```

**Ref:** [Burak Kıymaz](https://burakkiymaz.com/zabbix-5-0/)
