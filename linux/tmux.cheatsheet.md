# Tmux 101 Cheat Sheet

## Starting Tmux and Session Management

- `$ tmux`  # Start a new session
- `$ tmux new -s $NAME`  # Start a new session with a name
- `$ tmux ls`  # List active sessions
- `$ tmux a -t $NAME`  # Attach to a specific session
- `Ctrl + b, d`  # Detach from session
- `$ tmux kill-session -t $NAME`  # Kill a specific session

## Windows and Panes

- `Ctrl + b, c`  # Create a new window
- `Ctrl + b, n/p`  # Move to the next/previous window
- `Ctrl + b, [0-9]`  # Switch to a specific window by number
- `Ctrl + b, "`  # Split pane horizontally
- `Ctrl + b, %`  # Split pane vertically
- `Ctrl + b, o`  # Move to the next pane
- `$ exit`  # Close the pane

## Other Commands

- `Ctrl + b, $`  # Rename session
- `Ctrl + b, [arrow keys]`  # Resize panes
- `$ tmux kill-server`  # Kill all sessions

## Shortcuts

- `$ tmux a -t $NUMBER`  # Attach to a session by number
- `$ tmux a`  # Attach to the last session
