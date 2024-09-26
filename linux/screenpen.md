# ScreenPen

Screen annotation software which allows drawing directly on the screen. It is an open source and multiplatform (all systems that support Python) alternative to tools such as Epic Pen. Supported shapes:

- line,
- rectangle,
- chart (using matplotlib).

The behavior of the program depends on the Window System you use:

- if the system supports "live transparency then a transparent background is used (you can see a video playing in the background),
- if not then the screenshot is taken, and the user draws on the captured image (you see a static image of the screen),
- sometimes your WM may be detected as not supporting "live transparency". In that case try running with -t parameter to force it.

## Usage

### Installation and Execution

To run the program you need to have Python installed and execute following:

```bash
pip install screenpen
screenpen                # or python -m screenpen
```

**NOTE:** Your WM may be detected as not supporting "live transparency". In that case try running with -t parameter:

`screenpen -t`

### Controls

- Left mouse button - drawing.
- Right mouse button - quit.
- Keyboard shortcuts:
  - <kbd>Ctrl</kbd> + <kbd>Z</kbd> - undo,
  - <kbd>Ctrl</kbd> + <kbd>Y</kbd> - redo,
  - Hold <kbd>Shift</kbd> - change mouse cursor icon to arrrow.

### Configuration

There are a few configuration options that can be set using config file:

- **icon_size** - size of the icons (default: 50)
- **hidden_menus** - to hide menus on start (default: False)

The config should look like below:

```bash
[screenpen]
; Possible values for areas: topToolBarArea, bottomToolBarArea, leftToolBarArea, rightToolBarArea
penbar_area = topToolBarArea
boardbar_area = topToolBarArea
actionbar_area = leftToolBarArea
hidden_menus = False
icon_size = 50
```

**Ref:** [rsusik/screenpen - GitHub](https://github.com/rsusik/screenpen)