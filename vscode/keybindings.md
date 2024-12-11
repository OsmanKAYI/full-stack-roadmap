# Content of keybindings.json File

My prefered keybindings in VSCode.

```config
///////////////////////// KEYBINDINGS /////////////////////////
///////////////////////// KEYBINDINGS /////////////////////////
///////////////////////// KEYBINDINGS /////////////////////////
// Place your key bindings in this file to override the defaultsauto[]
[
  {
    "key": "ctrl+j",
    "command": "editor.action.joinLines"
  },
  {
    "key": "",
    "command": "workbench.action.toggleMultiCursorModifier"
  },
  {
    "key": "ctrl+a",
    "command": "-extension.vim_ctrl+a",
    "when": "editorTextFocus && vim.active && vim.use<C-a> && !inDebugRepl"
  },
  {
    "key": "ctrl+x",
    "command": "-extension.vim_ctrl+x",
    "when": "editorTextFocus && vim.active && vim.use<C-x> && !inDebugRepl"
  },
  {
    "key": "ctrl+c",
    "command": "-extension.vim_ctrl+c",
    "when": "editorTextFocus && vim.active && vim.overrideCtrlC && vim.use<C-c> && !inDebugRepl"
  },
  {
    "key": "ctrl+z",
    "command": "-extension.vim_ctrl+z",
    "when": "editorTextFocus && vim.active && vim.use<C-z> && !inDebugRepl"
  },
  {
    "key": "ctrl+y",
    "command": "-extension.vim_ctrl+y",
    "when": "editorTextFocus && vim.active && vim.use<C-y> && !inDebugRepl"
  },
  {
    "key": "backspace",
    "command": "-extension.vim_backspace",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "meta+a",
    "command": "-extension.vim_cmd+a",
    "when": "editorTextFocus && vim.active && vim.use<D-a> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "shift+alt+down",
    "command": "-extension.vim_cmd+alt+down",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "shift+alt+up",
    "command": "-extension.vim_cmd+alt+up",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "meta+c",
    "command": "-extension.vim_cmd+c",
    "when": "editorTextFocus && vim.active && vim.overrideCopy && vim.use<D-c> && !inDebugRepl"
  },
  {
    "key": "meta+d",
    "command": "-extension.vim_cmd+d",
    "when": "editorTextFocus && vim.active && vim.use<D-d> && !inDebugRepl"
  },
  {
    "key": "meta+left",
    "command": "-extension.vim_cmd+left",
    "when": "editorTextFocus && vim.active && vim.use<D-left> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "meta+right",
    "command": "-extension.vim_cmd+right",
    "when": "editorTextFocus && vim.active && vim.use<D-right> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "meta+v",
    "command": "-extension.vim_cmd+v",
    "when": "editorTextFocus && vim.active && vim.use<D-v> && !inDebugRepl && vim.mode == 'CommandlineInProgress' || editorTextFocus && vim.active && vim.use<D-v> && !inDebugRepl && vim.mode == 'SearchInProgressMode'"
  },
  {
    "key": "ctrl+6",
    "command": "-extension.vim_ctrl+6",
    "when": "editorTextFocus && vim.active && vim.use<C-6> && !inDebugRepl"
  },
  {
    "key": "ctrl+b",
    "command": "-extension.vim_ctrl+b",
    "when": "editorTextFocus && vim.active && vim.use<C-b> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+backspace",
    "command": "-extension.vim_ctrl+backspace",
    "when": "editorTextFocus && vim.active && vim.use<C-BS> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+d",
    "command": "-extension.vim_ctrl+d",
    "when": "editorTextFocus && vim.active && vim.use<C-d> && !inDebugRepl"
  },
  {
    "key": "ctrl+down",
    "command": "-extension.vim_ctrl+down",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+e",
    "command": "-extension.vim_ctrl+e",
    "when": "editorTextFocus && vim.active && vim.use<C-e> && !inDebugRepl"
  },
  {
    "key": "ctrl+end",
    "command": "-extension.vim_ctrl+end",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+f",
    "command": "-extension.vim_ctrl+f",
    "when": "editorTextFocus && vim.active && vim.use<C-f> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+g",
    "command": "-extension.vim_ctrl+g",
    "when": "editorTextFocus && vim.active && vim.use<C-g> && !inDebugRepl"
  },
  {
    "key": "ctrl+h",
    "command": "-extension.vim_ctrl+h",
    "when": "editorTextFocus && vim.active && vim.use<C-h> && !inDebugRepl"
  },
  {
    "key": "ctrl+home",
    "command": "-extension.vim_ctrl+home",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+i",
    "command": "-extension.vim_ctrl+i",
    "when": "editorTextFocus && vim.active && vim.use<C-i> && !inDebugRepl"
  },
  {
    "key": "ctrl+j",
    "command": "-extension.vim_ctrl+j",
    "when": "editorTextFocus && vim.active && vim.use<C-j> && !inDebugRepl"
  },
  {
    "key": "ctrl+k",
    "command": "-extension.vim_ctrl+k",
    "when": "editorTextFocus && vim.active && vim.use<C-k> && !inDebugRepl"
  },
  {
    "key": "ctrl+left",
    "command": "-extension.vim_ctrl+left",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+m",
    "command": "-extension.vim_ctrl+m",
    "when": "editorTextFocus && vim.active && vim.use<C-m> && !inDebugRepl || vim.active && vim.use<C-m> && !inDebugRepl && vim.mode == 'CommandlineInProgress' || vim.active && vim.use<C-m> && !inDebugRepl && vim.mode == 'SearchInProgressMode'"
  },
  {
    "key": "ctrl+n",
    "command": "-extension.vim_ctrl+n",
    "when": "editorTextFocus && vim.active && vim.use<C-n> && !inDebugRepl || vim.active && vim.use<C-n> && !inDebugRepl && vim.mode == 'CommandlineInProgress' || vim.active && vim.use<C-n> && !inDebugRepl && vim.mode == 'SearchInProgressMode'"
  },
  {
    "key": "ctrl+o",
    "command": "-extension.vim_ctrl+o",
    "when": "editorTextFocus && vim.active && vim.use<C-o> && !inDebugRepl"
  },
  {
    "key": "ctrl+p",
    "command": "-extension.vim_ctrl+p",
    "when": "suggestWidgetVisible && vim.active && vim.use<C-p> && !inDebugRepl || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'CommandlineInProgress' || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'SearchInProgressMode'"
  },
  {
    "key": "ctrl+pagedown",
    "command": "-extension.vim_ctrl+pagedown",
    "when": "editorTextFocus && vim.active && vim.use<C-pagedown> && !inDebugRepl"
  },
  {
    "key": "ctrl+pageup",
    "command": "-extension.vim_ctrl+pageup",
    "when": "editorTextFocus && vim.active && vim.use<C-pageup> && !inDebugRepl"
  },
  {
    "key": "ctrl+r",
    "command": "-extension.vim_ctrl+r",
    "when": "editorTextFocus && vim.active && vim.use<C-r> && !inDebugRepl"
  },
  {
    "key": "ctrl+right",
    "command": "-extension.vim_ctrl+right",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+s",
    "command": "-extension.vim_ctrl+s",
    "when": "editorTextFocus && vim.active && vim.use<C-s> && !inDebugRepl"
  },
  {
    "key": "ctrl+shift+2",
    "command": "-extension.vim_ctrl+shift+2",
    "when": "editorTextFocus && vim.active && vim.use<C-shift+2>"
  },
  {
    "key": "ctrl+space",
    "command": "-extension.vim_ctrl+space",
    "when": "editorTextFocus && vim.active && vim.use<C-space> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+t",
    "command": "-extension.vim_ctrl+t",
    "when": "editorTextFocus && vim.active && vim.use<C-t> && !inDebugRepl"
  },
  {
    "key": "ctrl+u",
    "command": "-extension.vim_ctrl+u",
    "when": "editorTextFocus && vim.active && vim.use<C-u> && !inDebugRepl"
  },
  {
    "key": "ctrl+up",
    "command": "-extension.vim_ctrl+up",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "ctrl+v",
    "command": "-extension.vim_ctrl+v",
    "when": "editorTextFocus && vim.active && vim.use<C-v> && !inDebugRepl"
  },
  {
    "key": "ctrl+w",
    "command": "-extension.vim_ctrl+w",
    "when": "editorTextFocus && vim.active && vim.use<C-w> && !inDebugRepl"
  },
  {
    "key": "delete",
    "command": "-extension.vim_delete",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "down",
    "command": "-extension.vim_down",
    "when": "editorTextFocus && vim.active && !inDebugRepl && !parameterHintsVisible && !suggestWidgetVisible"
  },
  {
    "key": "end",
    "command": "-extension.vim_end",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "escape",
    "command": "-extension.vim_escape",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "home",
    "command": "-extension.vim_home",
    "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "insert",
    "command": "-extension.vim_insert",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "left",
    "command": "-extension.vim_left",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "ctrl+l",
    "command": "-extension.vim_navigateCtrlL",
    "when": "editorTextFocus && vim.active && vim.use<C-l> && !inDebugRepl"
  },
  {
    "key": "right",
    "command": "-extension.vim_right",
    "when": "editorTextFocus && vim.active && !inDebugRepl"
  },
  {
    "key": "shift+backspace",
    "command": "-extension.vim_shift+backspace",
    "when": "editorTextFocus && vim.active && vim.use<S-BS> && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "shift+tab",
    "command": "-extension.vim_shift+tab",
    "when": "editorFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "tab",
    "command": "-extension.vim_tab",
    "when": "editorFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  },
  {
    "key": "up",
    "command": "-extension.vim_up",
    "when": "editorTextFocus && vim.active && !inDebugRepl && !parameterHintsVisible && !suggestWidgetVisible"
  },
  {
    "key": "ctrl+q",
    "command": "-extension.vim_winCtrlQ",
    "when": "editorTextFocus && vim.active && vim.use<C-q> && !inDebugRepl"
  },
  {
    "key": "backspace",
    "command": "-markdown.extension.onBackspaceKey",
    "when": "editorTextFocus && !editorHasMultipleSelections && !editorReadonly && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && vim.mode != 'CommandlineInProgress' && vim.mode != 'EasyMotionInputMode' && vim.mode != 'EasyMotionMode' && vim.mode != 'Normal' && vim.mode != 'Replace' && vim.mode != 'SearchInProgressMode' && vim.mode != 'SurroundInputMode' && vim.mode != 'Visual' && vim.mode != 'VisualBlock' && vim.mode != 'VisualLine' && editorLangId =~ /^markdown$|^rmd$|^qmd$/"
  },
  {
    "key": "enter",
    "command": "-markdown.extension.onEnterKey",
    "when": "editorTextFocus && !editorHasMultipleSelections && !editorReadonly && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && vim.mode != 'CommandlineInProgress' && vim.mode != 'EasyMotionInputMode' && vim.mode != 'EasyMotionMode' && vim.mode != 'Normal' && vim.mode != 'Replace' && vim.mode != 'SearchInProgressMode' && vim.mode != 'SurroundInputMode' && vim.mode != 'Visual' && vim.mode != 'VisualBlock' && vim.mode != 'VisualLine' && editorLangId =~ /^markdown$|^rmd$|^qmd$/"
  },
  {
    "key": "space",
    "command": "-breadcrumbs.revealFocused",
    "when": "breadcrumbsActive && breadcrumbsVisible"
  },
  {
    "key": "space",
    "command": "-debug.toggleBreakpoint",
    "when": "breakpointsFocused && !inputFocus"
  },
  {
    "key": "space",
    "command": "-list.toggleExpand",
    "when": "listFocus && !inputFocus"
  },
  {
    "key": "space",
    "command": "-notification.toggle",
    "when": "notificationFocus"
  },
  {
    "key": "space",
    "command": "-refactorPreview.toggleCheckedState",
    "when": "listFocus && refactorPreview.enabled && !inputFocus"
  },
  {
    "key": "space",
    "command": "-filesExplorer.openFilePreserveFocus",
    "when": "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsFolder && !inputFocus"
  },
  {
    "key": "escape",
    "command": "-breadcrumbs.selectEditor",
    "when": "breadcrumbsActive && breadcrumbsVisible"
  },

  {
    "key": "ctrl+shift+d",
    "command": "-workbench.view.debug",
    "when": "viewContainer.workbench.view.debug.enabled"
  },
  {
    "key": "ctrl+shift+d",
    "command": "editor.action.duplicateSelection"
  },
  {
    "key": "ctrl+[Backquote]",
    "command": "workbench.action.terminal.toggleTerminal"
  },

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
    "key": "f2",
    "command": "bookmarks.jumpToNext",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+alt+l",
    "command": "-bookmarks.jumpToNext",
    "when": "editorTextFocus"
  },
  {
    "key": "shift+f2",
    "command": "bookmarks.jumpToPrevious",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+alt+j",
    "command": "-bookmarks.jumpToPrevious",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+f3",
    "command": "bookmarks.toggle",
    "when": "editorTextFocus"
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
  },
  {
    "key": "ctrl+numpad_subtract",
    "command": "-workbench.action.zoomOut"
  },
  {
    "key": "ctrl+numpad_add",
    "command": "-workbench.action.zoomIn"
  },
  {
    "key": "ctrl+numpad_subtract",
    "command": "workbench.action.navigateBack"
  },
  {
    "key": "ctrl+numpad_add",
    "command": "workbench.action.navigateForward",
    "when": "canNavigateForward"
  },
  {
    "key": "ctrl+shift+-",
    "command": "-workbench.action.navigateForward",
    "when": "canNavigateForward"
  },
  {
    "key": "ctrl+numpad_divide",
    "command": "editor.action.addCommentLine",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+k ctrl+c",
    "command": "-editor.action.addCommentLine",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+shift+numpad_divide",
    "command": "editor.action.removeCommentLine",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+k ctrl+u",
    "command": "-editor.action.removeCommentLine",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+shift+down",
    "command": "workbench.action.terminal.scrollDown",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  },
  {
    "key": "ctrl+shift+down",
    "command": "-workbench.action.terminal.scrollDown",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  },
  {
    "key": "shift+pagedown",
    "command": "workbench.action.terminal.scrollDownPage",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  },
  {
    "key": "shift+pagedown",
    "command": "-workbench.action.terminal.scrollDownPage",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  },
  {
    "key": "ctrl+shift+up",
    "command": "workbench.action.terminal.scrollUp",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  },
  {
    "key": "ctrl+shift+up",
    "command": "-workbench.action.terminal.scrollUp",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  },
  {
    "key": "shift+pageup",
    "command": "workbench.action.terminal.scrollUpPage",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  },
  {
    "key": "shift+pageup",
    "command": "-workbench.action.terminal.scrollUpPage",
    "when": "terminalFocusInAny && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocusInAny && terminalProcessSupported && !terminalAltBufferActive"
  }
]
```
