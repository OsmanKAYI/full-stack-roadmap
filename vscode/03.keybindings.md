# Content of keybindings.json File

My prefered keybindings in VSCode.

```CONFIG
  ///////////////////////// MY SETTINGS /////////////////////////
  ///////////////////////// MY SETTINGS /////////////////////////
  ///////////////////////// MY SETTINGS /////////////////////////
  {
    "key": "ctrl+shift+l",
    "command": "editor.action.insertCursorAtEndOfEachLineSelected",
    "when": "editorTextFocus"
  },
  {
    "key": "shift+alt+[KeyI]",
    "command": "-editor.action.insertCursorAtEndOfEachLineSelected",
    "when": "editorTextFocus"
  },

  ///////////////////////// Bookmarks /////////////////////////
  ///////////////////////// Bookmarks /////////////////////////
  ///////////////////////// Bookmarks /////////////////////////
  {
    "key": "ctrl+f3",
    "command": "bookmarks.toggle",
    "when": "editorTextFocus"
  },
  {
    "key": "f3",
    "command": "bookmarks.jumpToNext"
  },
  {
    "key": "shift+f3",
    "command": "bookmarks.jumpToPrevious"
  },

  ///////////////////////// Incrementor /////////////////////////
  ///////////////////////// Incrementor /////////////////////////
  ///////////////////////// Incrementor /////////////////////////
  {
    "command": "incrementor.incrementByOne",
    "key": "ctrl+up"
  },
  {
    "command": "incrementor.decrementByOne",
    "key": "ctrl+down"
  },
  {
    "command": "incrementor.incrementByTenth",
    "key": "ctrl+shift+alt+up"
  },
  {
    "command": "incrementor.decrementByTenth",
    "key": "ctrl+shift+alt+down"
  },
  {
    "command": "incrementor.incrementByTen",
    "key": "ctrl+shift+up"
  },
  {
    "command": "incrementor.decrementByTen",
    "key": "ctrl+shift+down"
  },

  ///////////////////////// DOM Selection /////////////////////////
  ///////////////////////// DOM Selection /////////////////////////
  ///////////////////////// DOM Selection /////////////////////////
  {
    "key": "ctrl+alt+b",
    "command": "editor.emmet.action.balanceOut",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+alt+v",
    "command": "editor.emmet.action.balanceIn",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+shift+b",
    "command": "editor.action.toggleMinimap"
  },
  {
    "key": "ctrl+shift+b",
    "command": "-workbench.action.tasks.build",
    "when": "taskCommandsRegistered"
  }
```
