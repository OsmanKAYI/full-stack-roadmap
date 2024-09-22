# xdotool

xdotool is a cross-platform utility for programmatically controlling the mouse and keyboard.

## Installation

```bash
sudo apt install xdotool
```

## Examples

- To move the mouse to the position (500, 500) and right click

  ```bash
  xdotool mousemove 500 500 click 3
  ```

- To move the mouse from top left to bottom right

  ```bash
  for i in $(seq 1 200); do xdotool mousemove --sync  $(($i * 5)) $(($i * 3)); sleep 0.01; done
  ```

- To type "merhaba"

  ```bash
  xdotool type "merhaba"
  ```

- To type "merhaba" while waiting for 1 second between each character

  ```bash
  for char in m e r h a b a; do xdotool type "$char"; sleep 1; done
  ```
