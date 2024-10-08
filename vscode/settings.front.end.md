# Content of setting.json File

My prefered extensions and special settings for them in VSCode.

```json
///////////////////////// VISUAL STUDIO CODE /////////////////////////
///////////////////////// VISUAL STUDIO CODE /////////////////////////
///////////////////////// VISUAL STUDIO CODE /////////////////////////
{
  // The number of spaces a tab is equal to. This setting is overridden
  // based on the file contents when `editor.detectIndentation` is true.
  "editor.tabSize": 2,

  // Insert spaces when pressing Tab. This setting is overriden
  // based on the file contents when `editor.detectIndentation` is true.
  "editor.insertSpaces": true,

  // When opening a file, `editor.tabSize` and `editor.insertSpaces`
  // will be detected based on the file contents. Set to false to keep
  // the values you've explicitly set, above.
  "editor.detectIndentation": false,
  "editor.fontSize": 18,

  // Shows the nested current scopes during the scroll at the top of the editor.
  "editor.stickyScroll.enabled": true,

  // Defines the border of focused and unfocused tabs and background of focused tab
  "workbench.colorCustomizations": {
    "tab.activeBorder": "#ff0000",
    "tab.unfocusedActiveBorder": "#000000",
    "tab.activeBackground": "#009688"
  },

  // VSCode Session Protection Settings
  "files.hotExit": "onExitAndWindowClose",

  // Enable bracket pair colorization and highlighting
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": true,

  // Enable HTML formatter to split html attributes
  "html.format.wrapAttributes": "force-expand-multiline",

  ///////////////////////// Alignment /////////////////////////
  ///////////////////////// Alignment /////////////////////////
  ///////////////////////// Alignment /////////////////////////
  // Chars to align
  "alignment.chars": {
    ":": {
      "spaceBefore": 0,
      "spaceAfter": 0
    },
    "::": {
      "spaceBefore": 0,
      "spaceAfter": 0
    },
    "=": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    "===": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    "==": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    "=>": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    "+=": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    "-=": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    "*=": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    "/=": {
      "spaceBefore": 1,
      "spaceAfter": 1
    },
    ",": {
      "spaceBefore": 1,
      "spaceAfter": 1
    }
  },

  ///////////////////////// Code Runner /////////////////////////
  ///////////////////////// Code Runner /////////////////////////
  ///////////////////////// Code Runner /////////////////////////
  "code-runner.executorMap": {
    "javascript": "node",
    "php": "C:\\php\\php.exe",
    "python": "python",
    "perl": "perl",
    "ruby": "C:\\Ruby23-x64\\bin\\ruby.exe",
    "go": "go run",
    "html": "\"C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe\"",
    "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
    "c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
  },

  ///////////////////////// GitHub Pull Requests and Issues /////////////////////////
  ///////////////////////// GitHub Pull Requests and Issues /////////////////////////
  ///////////////////////// GitHub Pull Requests and Issues /////////////////////////
  "githubPullRequests.queries": [
    {
      "label": "Waiting For My Review",
      "query": "is:open review-requested:${user}"
    },
    {
      "label": "Assigned To Me",
      "query": "is:open assignee:${user}"
    },
    {
      "label": "Created By Me",
      "query": "is:open author:${user}"
    },
    {
      "label": "Mentioned Me",
      "query": "is:open mentions:${user}"
    }
  ],

  ///////////////////////// Incrementor /////////////////////////
  ///////////////////////// Incrementor /////////////////////////
  ///////////////////////// Incrementor /////////////////////////
  "incrementor.enums.values": [
    ["false", "true"],
    ["let", "const"],
    ["public", "private", "protected"]
  ],

  ///////////////////////// indent-rainbow /////////////////////////
  ///////////////////////// indent-rainbow /////////////////////////
  ///////////////////////// indent-rainbow /////////////////////////
  // For which languages indent-rainbow should be activated (if empty it means all).
  "indentRainbow.includedLanguages": [], // for example ["nim", "nims", "python"]

  // For which languages indent-rainbow should be deactivated (if empty it means none).
  "indentRainbow.excludedLanguages": ["plaintext"],

  // The delay in ms until the editor gets updated.
  "indentRainbow.updateDelay": 100, // 10 makes it super fast but may cost more resources

  // Defining custom colors instead of default "Rainbow" for dark backgrounds.
  "indentRainbow.colors": [
    "rgba(255,255,64,0.07)",
    "rgba(127,255,127,0.07)",
    "rgba(255,127,255,0.07)",
    "rgba(79,236,236,0.07)"
  ],

  // The indent color if the number of spaces is not a multiple of "tabSize".
  "indentRainbow.errorColor": "rgba(128,32,32,0.6)",

  // The indent color when there is a mix between spaces and tabs.
  // To be disabled this coloring set this to an empty string.
  "indentRainbow.tabmixColor": "rgba(128,32,96,0.6)",

  ///////////////////////// Inline fold /////////////////////////
  ///////////////////////// Inline fold /////////////////////////
  ///////////////////////// Inline fold /////////////////////////
  "inlineFold.regex": "(class|className)=[`'{\"](https://github.com/moalamri/vscode-inline-fold/blob/HEAD/[^`'\"}]{30,})[`'\"}]",
  "inlineFold.regexFlags": "g",
  "inlineFold.regexGroup": 2,
  "inlineFold.unfoldedOpacity": 0.6,
  "inlineFold.maskChar": "…",
  "inlineFold.maskColor": "#000",
  "inlineFold.supportedLanguages": ["javascriptreact", "typescriptreact"],
  "inlineFold.unfoldOnLineSelect": true,
  "inlineFold.autoFold": true,

  ///////////////////////// Marp for VS Code /////////////////////////
  ///////////////////////// Marp for VS Code /////////////////////////
  ///////////////////////// Marp for VS Code /////////////////////////
  "markdown.marp.themes": [
    "https://example.com/foo/bar/custom-theme.css",
    "./themes/your-theme.css"
  ],

  ///////////////////////// Matertial Icon Theme /////////////////////////
  ///////////////////////// Matertial Icon Theme /////////////////////////
  ///////////////////////// Matertial Icon Theme /////////////////////////
  "material-icon-theme.folders.color": "#ef5350",
  "material-icon-theme.folders.theme": "specific",
  "material-icon-theme.opacity": 1,
  "material-icon-theme.saturation": 1,
  "explorer.confirmDelete": false,
  "editor.unicodeHighlight.allowedLocales": {
    "tr": true
  },
  "terminal.integrated.enableMultiLinePasteWarning": false,
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "workbench.startupEditor": "none",
  "editor.mouseWheelZoom": true,

  ///////////////////////// Material Theme /////////////////////////
  ///////////////////////// Material Theme /////////////////////////
  ///////////////////////// Material Theme /////////////////////////
  "git.confirmSync": false,
  "workbench.iconTheme": "material-icon-theme",
  "security.workspace.trust.untrustedFiles": "open",
  "workbench.colorTheme": "Material Theme Darker High Contrast",
  //"editor.lineHeight": 25,

  ///////////////////////// Prettier-Code formatter /////////////////////////
  ///////////////////////// Prettier-Code formatter /////////////////////////
  ///////////////////////// Prettier-Code formatter /////////////////////////
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.formatOnSave": true
  },

  ///////////////////////// Todo Highlight /////////////////////////
  ///////////////////////// Todo Highlight /////////////////////////
  ///////////////////////// Todo Highlight /////////////////////////
  "todohighlight.isEnable": true,
  "todohighlight.isCaseSensitive": true,
  "todohighlight.keywords": [
    "DEBUG:",
    "REVIEW:",
    {
      "text": "NOTE:",
      "color": "#ff0000",
      "backgroundColor": "yellow",
      "overviewRulerColor": "grey"
    },
    {
      "text": "HACK:",
      "color": "#000",
      "isWholeLine": false
    },
    {
      "text": "TODO:",
      "color": "red",
      "border": "1px solid red",
      "borderRadius": "2px", //NOTE: using borderRadius along with `border` or you will see nothing change
      "backgroundColor": "rgba(0,0,0,.2)"
      //other styling properties goes here ...
    }
  ],
  "todohighlight.keywordsPattern": "TODO:|FIXME", //highlight `TODO:`,`FIXME`
  //add following :|\\(([^)]+)\\) code after FIXME to highlight the content between parentheses
  "todohighlight.defaultStyle": {
    "color": "red",
    "backgroundColor": "#00BCD4",
    "overviewRulerColor": "#ffab00",
    "cursor": "pointer",
    "border": "1px solid #006064",
    "borderRadius": "2px",
    "isWholeLine": true
    //other styling properties goes here ...
  },
  "todohighlight.include": [
    "**/*.js",
    "**/*.jsx",
    "**/*.ts",
    "**/*.tsx",
    "**/*.html",
    "**/*.php",
    "**/*.css",
    "**/*.scss"
  ],
  "todohighlight.exclude": [
    "**/node_modules/**",
    "**/bower_components/**",
    "**/dist/**",
    "**/build/**",
    "**/.vscode/**",
    "**/.github/**",
    "**/_output/**",
    "**/*.min.*",
    "**/*.map",
    "**/.next/**"
  ],
  "todohighlight.maxFilesForSearch": 5120,
  "todohighlight.toggleURI": false,

  ///////////////////////// Todo Tree /////////////////////////
  ///////////////////////// Todo Tree /////////////////////////
  ///////////////////////// Todo Tree /////////////////////////
  "todo-tree.highlights.defaultHighlight": {
    "icon": "alert",
    "type": "text",
    "foreground": "#ff0000",
    "background": "#fdfdfd",
    "opacity": 50,
    "iconColour": "#004cff"
  },
  "todo-tree.highlights.customHighlight": {
    "TODO": {
      "icon": "check",
      "type": "line"
    },
    "FIXME": {
      "foreground": "#000000",
      "iconColour": "#e3eb00",
      "gutterIcon": true
    },

    ///////////////////////// END /////////////////////////
    ///////////////////////// END /////////////////////////
    ///////////////////////// END /////////////////////////

    "editor.linkedEditing": true,
    "liveServer.settings.donotShowInfoMsg": true,
    "editor.formatOnType": true,
    "editor.formatOnPaste": true,
    "projectManager.git.baseFolders": ["/home/osman/source", "/var/www/html"],
    "editor.formatOnSave": true,
    "[html]": {
      "editor.defaultFormatter": "vscode.html-language-features"
    },
    "[php]": {
      "editor.defaultFormatter": "bmewburn.vscode-intelephense-client",
      "editor.formatOnSave": true
    },
    "[vue]": {
      "editor.defaultFormatter": "Vue.volar"
    },
    "git.openRepositoryInParentFolders": "always",
    "editor.multiCursorModifier": "ctrlCmd",
    "editor.unicodeHighlight.nonBasicASCII": false,
    "notebook.cellToolbarLocation": {
      "default": "right",
      "jupyter-notebook": "right"
    },
    "explorer.confirmDragAndDrop": false,
    "vetur.validation.template": false,
    "git.suggestSmartCommit": false,
    "chronicler.ffmpeg-binary": "/usr/bin/ffmpeg",
    "githubPullRequests.createOnPublishBranch": "never",
    "tabnine.experimentalAutoImports": true,
    "codeium.enableConfig": {
      "*": true,
      "markdown": true
    },
    "codeium.enableCodeLens": false,
    "terminal.integrated.env.linux": {},
    "console-ninja.featureSet": "Community",
    "console-ninja.showWhatsNew": false,
    "[markdown]": {
      "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "hediet.vscode-drawio.resizeImages": null,
    "javascript.updateImportsOnFileMove.enabled": "always",
    "git.ignoreRebaseWarning": true,
    "diffEditor.ignoreTrimWhitespace": false,
    "explorer.confirmPasteNative": false
  }
}
```
