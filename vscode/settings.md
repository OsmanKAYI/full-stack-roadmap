# Content of setting.json File

My prefered extensions and special settings for them in VSCode.

```json
///////////////////////// VISUAL STUDIO CODE /////////////////////////
///////////////////////// VISUAL STUDIO CODE /////////////////////////
///////////////////////// VISUAL STUDIO CODE /////////////////////////
{
  // VSCode session protection settings.
  "files.hotExit": "onExitAndWindowClose",

  // Tab Size and Indentation
  "editor.tabSize": 2, // Number of spaces a tab is equal to.
  "editor.insertSpaces": true, // Detect indentation based on file contents.
  "editor.fontSize": 18, // Font size in the editor.

  // Editor Behavior
  "editor.linkedEditing": true,
  "editor.formatOnType": true,
  "editor.formatOnPaste": true,
  "editor.formatOnSave": true,
  "editor.detectIndentation": false,
  "editor.unicodeHighlight.nonBasicASCII": false,
  "editor.multiCursorModifier": "ctrlCmd",
  "editor.mouseWheelZoom": true, // Enable mouse wheel zoom.
  "editor.stickyScroll.enabled": false, // Sticky scroll feature.
  "diffEditor.ignoreTrimWhitespace": false, // Diff editor trim whitespace.

  // Bracket Pair Colorization
  "editor.bracketPairColorization.enabled": true, // Enable bracket pair colorization.
  "editor.guides.bracketPairs": true, // Show bracket guides.

  // Explorer
  "explorer.confirmDelete": false, // Confirm delete action in explorer.
  "explorer.confirmDragAndDrop": false,
  "explorer.confirmPasteNative": false,

  // Workbench Customizations
  "workbench.startupEditor": "none", // Startup editor settings.
  "workbench.colorCustomizations": {
    "tab.activeBorder": "#ffffff", // Border color of active tab.
    "tab.activeBackground": "#02eeff7c" // Background color of active tab.
  },

  // Format
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "html.format.wrapAttributes": "force-expand-multiline", // HTML formatter settings.
  "[html]": {
    "editor.defaultFormatter": "vscode.html-language-features"
  },
  "[php]": {
    "editor.defaultFormatter": "bmewburn.vscode-intelephense-client",
    "editor.formatOnSave": true
  },
  "javascript.updateImportsOnFileMove.enabled": "always",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode" // Formatter for JavaScript.
  },
  "[json]": {
    "editor.defaultFormatter": "vscode.json-language-features",
    "editor.formatOnSave": true
  },
  "[typescript]": {
    "editor.defaultFormatter": "vscode.typescript-language-features",
    "editor.formatOnSave": true
  },
  "[vue]": {
    "editor.defaultFormatter": "Vue.volar"
  },

  // Terminal
  "terminal.integrated.env.linux": {},
  "terminal.integrated.enableMultiLinePasteWarning": "never", // Terminal multiline paste warning.
  "terminal.integrated.defaultProfile.windows": "Git Bash", // Default terminal profile on Windows.

  // Git
  "git.openRepositoryInParentFolders": "always",
  "git.suggestSmartCommit": true,
  "git.ignoreRebaseWarning": true,

  ///////////////////////// Alignment /////////////////////////
  ///////////////////////// Alignment /////////////////////////
  ///////////////////////// Alignment /////////////////////////
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

  ///////////////////////// Chronicler /////////////////////////
  ///////////////////////// Chronicler /////////////////////////
  ///////////////////////// Chronicler /////////////////////////
  "chronicler.ffmpeg-binary": "/usr/bin/ffmpeg",

  ///////////////////////// Codeium /////////////////////////
  ///////////////////////// Codeium /////////////////////////
  ///////////////////////// Codeium /////////////////////////
  "codeium.enableConfig": {
    "*": true,
    "markdown": true
  },
  "codeium.enableCodeLens": false,

  ///////////////////////// Community Material Theme /////////////////////////
  ///////////////////////// Community Material Theme /////////////////////////
  ///////////////////////// Community Material Theme /////////////////////////
  "git.confirmSync": false, // Git sync confirmation settings.
  "workbench.iconTheme": "material-icon-theme", // Material icon theme.
  "editor.lineHeight": 30, // Editor line height.

  ///////////////////////// Console Ninja /////////////////////////
  ///////////////////////// Console Ninja /////////////////////////
  ///////////////////////// Console Ninja /////////////////////////
  "console-ninja.featureSet": "Community",
  "console-ninja.showWhatsNew": false,

  ///////////////////////// Draw.io Integration /////////////////////////
  ///////////////////////// Draw.io Integration /////////////////////////
  ///////////////////////// Draw.io Integration /////////////////////////
  // Associate `.svg` files with Draw.io extension (uncomment if needed)
  //"workbench.editorAssociations": {
  //  "*.svg": "hediet.vscode-drawio-text"
  //},
  //"hediet.vscode-drawio.resizeImages": null,

  ///////////////////////// GitHub Pull Requests and Issues /////////////////////////
  ///////////////////////// GitHub Pull Requests and Issues /////////////////////////
  ///////////////////////// GitHub Pull Requests and Issues /////////////////////////
  "githubPullRequests.createOnPublishBranch": "never",
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
  "indentRainbow.includedLanguages": [], // Languages for which indent-rainbow should be activated.
  "indentRainbow.excludedLanguages": ["plaintext"], // Languages for which indent-rainbow should be deactivated.
  "indentRainbow.updateDelay": 100, // Delay for editor update.
  "indentRainbow.colors": [
    "rgba(255,255,64,0.07)",
    "rgba(127,255,127,0.07)",
    "rgba(255,127,255,0.07)",
    "rgba(79,236,236,0.07)"
  ],
  "indentRainbow.errorColor": "rgba(128,32,32,0.6)", // Color for indent errors.
  "indentRainbow.tabmixColor": "rgba(128,32,96,0.6)", // Color for mixed tabs and spaces.

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

  ///////////////////////// Jupyter Notebook /////////////////////////
  ///////////////////////// Jupyter Notebook /////////////////////////
  ///////////////////////// Jupyter Notebook /////////////////////////
  "notebook.cellToolbarLocation": {
    "default": "right",
    "jupyter-notebook": "right"
  },

  ///////////////////////// Live Server /////////////////////////
  ///////////////////////// Live Server /////////////////////////
  ///////////////////////// Live Server /////////////////////////
  "liveServer.settings.donotShowInfoMsg": true,

  ///////////////////////// Marp for VS Code /////////////////////////
  ///////////////////////// Marp for VS Code /////////////////////////
  ///////////////////////// Marp for VS Code /////////////////////////
  "markdown.marp.themes": ["https://example.com/foo/bar/custom-theme.css", "./themes/your-theme.css"],

  ///////////////////////// Material Icon Theme /////////////////////////
  ///////////////////////// Material Icon Theme /////////////////////////
  ///////////////////////// Material Icon Theme /////////////////////////
  "material-icon-theme.folders.color": "#ef5350", // Color for folder icons.
  "material-icon-theme.folders.theme": "specific", // Folder icon theme.
  "material-icon-theme.opacity": 1, // Icon opacity.
  "material-icon-theme.saturation": 1, // Icon saturation.
  "editor.unicodeHighlight.allowedLocales": {
    "tr": true // Allow Unicode highlight for Turkish locale.
  },

  ///////////////////////// PHP Debug /////////////////////////
  ///////////////////////// PHP Debug /////////////////////////
  ///////////////////////// PHP Debug /////////////////////////
  "debug.allowBreakpointsEverywhere": true, // Allow breakpoints everywhere.

  ///////////////////////// Prettier-Code formatter /////////////////////////
  ///////////////////////// Prettier-Code formatter /////////////////////////
  ///////////////////////// Prettier-Code formatter /////////////////////////
  "editor.defaultFormatter": "esbenp.prettier-vscode", // Default code formatter.
  "prettier.tabWidth": 2, // Tab width.
  "prettier.printWidth": 120,
  "prettier.useTabs": false,
  "prettier.semi": true,
  "prettier.singleQuote": true,
  "prettier.trailingComma": "none",
  "prettier.bracketSpacing": true,
  "prettier.arrowParens": "avoid",
  "prettier.htmlWhitespaceSensitivity": "ignore",

  ///////////////////////// Prettier-Code formatter /////////////////////////
  ///////////////////////// Prettier-Code formatter /////////////////////////
  ///////////////////////// Prettier-Code formatter /////////////////////////
  "projectManager.git.baseFolders": ["/home/osman/source", "/var/www/html"],

  ///////////////////////// Todo Highlight /////////////////////////
  ///////////////////////// Todo Highlight /////////////////////////
  "todohighlight.isEnable": true, // Enable TODO highlight.
  "todohighlight.isCaseSensitive": true, // Case sensitivity for TODO highlight.
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
      "borderRadius": "5px", // NOTE: using borderRadius along with `border` or you will see nothing change
      "backgroundColor": "rgba(0,255,0,0.2)"
    }
  ],
  "todohighlight.keywordsPattern": "TODO:|FIXME", // Highlight TODO: and FIXME.
  "todohighlight.defaultStyle": {
    "color": "red",
    "backgroundColor": "#E0E0E0",
    "overviewRulerColor": "#ffab00",
    "cursor": "pointer",
    "border": "1px solid #006064",
    "borderRadius": "10px",
    "isWholeLine": false
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
  "todohighlight.maxFilesForSearch": 5120, // Max files for search.
  "todohighlight.toggleURI": false, // URI toggle for TODO highlight.

  ///////////////////////// Todo Tree /////////////////////////
  ///////////////////////// Todo Tree /////////////////////////
  ///////////////////////// Todo Tree /////////////////////////
  "todo-tree.highlights.defaultHighlight": {
    "type": "text",
    "background": "#000000",
    "opacity": 80,
    "gutterIcon": true
  },
  "todo-tree.highlights.customHighlight": {
    "TODO": {
      "icon": "alert",
      "foreground": "#fbff00",
      "iconColour": "#fbff00"
    },
    "FIXME": {
      "icon": "error",
      "foreground": "#ff0000",
      "iconColour": "#ff0000"
    }
  }

  ///////////////////////// END /////////////////////////
  ///////////////////////// END /////////////////////////
  ///////////////////////// END /////////////////////////
}
```
