# Basic vim Codes

- `vim /etc/hosts` # enables us to change the IP numbers of websites.

**NOTE:** `vi` or `vim` is an editor.

- <kbd>ESC</kbd> + <kbd>:</kbd><kbd>q</kbd><kbd>!</kbd> + <kbd>Enter</kbd> # to quit.
- `yy` # copy 1 row
- `y4y` # copy 4 rows
- `p` # paste
- `dd` # delete 1 row
- `d3d` # deete 3 rows
- `i` # insert
- `:wq` # save and quit
- `:q!` # cancel and quit
- `:q` # quit

- `/etc/hosts`: file content:<br>

  - `127.0.0.1 localhost` : Making a site unusable in your computer.<br>
  - `127.0.0.1 mysite.com`: Making a site unusable in your computer.<br>

- `/phrase/to/search` + <kbd>ENTER</kbd> # to search anything in a document
  - Use <kbd>N</kbd> to search forward
  - <kbd>SHIFT</kbd> + <kbd>N</kbd> to search backward

## On Terminal Connection Freeze:

- <kbd>ENTER</kbd> + <kbd>~</kbd> + <kbd>.</kbd> # to close the connection

### Example: Add Domain To Apache Config File

```BASH
ssh root@IPADDRESS
ssh root@domain.name
ssh [user]@[server]
ls /etc/apache2/
ll /etc/apache2/.tr
ll /etc/apache2/sites-available/
cd /etc/apache2/sites-available/
sudo cp 000-default.conf mysite.com.conf
sudo vim mysite.com.conf
sudo a2ensite mysite.com.conf
sudo service apache2 restart
ping mysite.com
sudo vim /etc/hosts
ping mysite.com
sudo a2dissite mysite.com.conf
sudo service apache2 restart
```
