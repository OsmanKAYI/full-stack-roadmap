# Screen Command to Keep SSH Sessions Alive Between Connections

GNU Screen is a window manager that multiplexes a physical terminal between several processes, typically interactive shells. It allows you to start, retain, attach and detach to a session across different connections.

## Screen Basics

The good thing about screen is, you just need to know a handful of things initially to get going. Once you’ve gotten a hang of these basic stuffs, you can always pick up more things as and when you need them.

Screen is not installed by default in most distributions, so you must use apt or yum or brew to install it.

Not surprisingly, you start a screen session by using the screen command on a shell.

```bash
screen
```

## Screen Key Bindings

Once you hit screen, you are inside a screen session. The key binding prefix for screen is <kbd>Ctrl</kbd> + <kbd>a</kbd>. Any character followed by this sequence is interpreted as a command to screen.

For example, to detach from the session, you will have to press <kbd>Ctrl</kbd> + <kbd>a</kbd>, and then press <kbd>d</kbd>. The screen documents refer to this sequence with `C-a d`. This is of the form, `C-a <command-character>`.

## List, Attach and Detach Screen Sessions

You can use `screen -ls` to see the screen sessions that are active. Since we have started only one session so far, your output will list only one session. The following is an example of a screen listing.

```bash
There is a screen on:
	22137.pts-1.osmankayi	(25-09-2023 10:48:06)	(Detached)
1 Sockets in /run/screen/S-osman.
```

Currently there is only one screen running in my computer, so the listing returns only one socket. You can create as many screen sessions as you wish and when you do a `screen -ls` you will notice that there are more sockets listed in `/var/run/screen/`.

To reattach to the session we earlier detached from, you can do,

```bash
screen -x
```

If there are more than one screen sessions, you will not be able to do 'screen -x' directly to attach to a session. You have to add the screen’s name to the reattach command to explicitly state which screen you want to attach to. In this case you will have to do a `screen -x 22137` to reattach to that session.

## Screen Window Management

The best thing about screen is, it’s ability to spawn of more than one TTY (TeleTYpewriter which is the command of the linux terminal and basically prints the file name of the terminal connected to standard input). In the same session, you can start off may windows. Screen starts one window when you create a session. After this you can use `C-a c` to create another. And move between those windows by using `C-a C-a`.

Now you can be in one directory in one and another in the other window. To see the list of windows, you hit `C-a "` and move up and down in the list to choose one. Once you are done, you can kill that window with `C-a k`, you will be asked for a confirmation to kill the current window. Here is a small subset of key bindings that you need to know to get started with screen.

| Key Binding | Description                       |
| ----------- | --------------------------------- |
| C-a c       | Create new window                 |
| C-a C-a     | Switch between the last window    |
| C-a NUM     | Change to window by number, NUM   |
| C-a n       | Change to next window in list     |
| C-a p       | Change to previous window in list |
| C-a "       | See window list                   |
| C-a k       | Kill current window               |
| C-a \       | Kill all windows                  |
| C-a A       | Rename current window             |

This is not a full list of key bindings. There is an overwhelming number of [key bindings in the screen manual](https://www.gnu.org/software/screen/manual/screen.html) do have a look at it once you have internalised the basics.

## Customizing Screen with Screenrc

Like vim and bash, the runtime behavior of screen can be customized with a screenrc file in the home directory. The following code block is the contents of my screenrc file, I have been using for years and it works like a charm.

If you are a screen beginner, then this is a good starting point. Copy the following lines to `~/.screenrc` and checkout its effects.

```config
startup_message off
term screen-256color
setenv LC_CTYPE en_US.UTF-8
defutf8 on
setenv DISPLAY ':0'
nonblock on
vbell on
msgwait 3
defscrollback 10000
altscreen on

bind = resize =
bind + resize +1
bind - resize -1
bind _ resize max
bind x remove

hardstatus on
sorendition kw
hardstatus alwayslastline
hardstatus string "%{= ky}%-Lw%{=r}%20>%n %t%{= ky}%+Lw %{= ky}%-=| %{= kw}%M%d %c%{-} %{=r} ${USER}@%H "
```

## How to Start Screen Soon After Login?

As you familiarize yourself with screen, you will notice that most of the time `screen` is the first command that you run after ssh-ing into the machine. The easiest way to achieve this is to add an `exec screen -d -RR` as the last line in `~/.bashrc`. That works, but if there is some issue with screen and for some reason it won’t start, then adding this line prevents you from logging into your machine, causing a lot of trouble.

Alternatively, you could add the machine details to your `~/.ssh/config` and add a `RemoteCommand` section to indicate that you would like to attach-to/create a screen session after login.

```config
host my_machine
	HostName 10.10.10.1
	User sid
	RequestTTY yes
	RemoteCommand screen -d -RR
```

Now you could just do `ssh my_machine` to login to `sid@10.10.10.1`.

**Ref:** https://embedjournal.com/screen-keep-ssh-sessions-alive-between-connections/
