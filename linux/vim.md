# Vim Editor

`vi` or `vim` is an editor which uses cli interface for editing files interactively.

## Vim Configuration (~/.vimrc)

```bash
vi ~/.vimrc
```

```vim
" Basic settings
set number            " Show line numbers
set ruler             " Show line/column
set showcmd           " Show (partial) command in status line
set incsearch         " Incremental search
set hlsearch          " Highlight search matches
syntax on

" Colors and appearance
set t_Co=256          " 256-color support
set termguicolors     " True color support (for modern terminals)
```

- `vim /etc/hosts` # enables us to change the IP numbers of websites.

- `ESC` + `q` + `Enter` # to quit.
- `yy` # copy 1 row
- `y4y` # copy 4 rows
- `p` # paste
- `dd` # delete 1 row
- `d3d` # delete 3 rows
- `i` # insert
- `:wq` # save and quit
- `:q!` # cancel and quit
- `:q` # quit

- `/etc/hosts`: file content:

  - `127.0.0.1 localhost` : Making a site unusable in your computer.
  - `127.0.0.1 mysite.com`: Making a site unusable in your computer.

- `/phrase/to/search` + `ENTER` # to search anything in a document
  - Use `N` to search forward
  - `SHIFT` + `N` to search backward

## On Terminal Connection Freeze

- `ENTER` + `+` # to close the connection

### Example: Add Domain To Apache Config File

```bash
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
