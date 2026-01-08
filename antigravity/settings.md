# Content of setting.json File

My prefered extensions and special settings for them in Antigravity.

```json
///////////////////////// ANTIGRAVITY /////////////////////////
///////////////////////// ANTIGRAVITY /////////////////////////
///////////////////////// ANTIGRAVITY /////////////////////////
{
  "antigravity.autocompleteSpeed": "fast",
  "workbench.colorTheme": "Monokai",
  // Antigravity session protection settings.
  "files.hotExit": "onExitAndWindowClose",

  "editor.unicodeHighlight.allowedLocales": {
    "tr": true // Allow Unicode highlight for Turkish locale.
  },

  "window.zoomLevel": 0,
  "window.titleBarStyle": "custom",

  // Tab Size and Indentation
  "editor.tabSize": 2, // Number of spaces a tab is equal to.
  "editor.insertSpaces": true, // Detect indentation based on file contents.
  "editor.fontSize": 18, // Font size in the editor.

  // Editor Behavior
  "editor.linkedEditing": true,

  // Cascade Settings
  "antigravity.cascade.soundsEnabled": true, // Play sound when Cascade finishes generating a response
  "antigravity.cascade.autoGenerateMemories": false, // Only create memories when explicitly asked
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
    "titleBar.activeBackground": "#6d7edd",
    "titleBar.activeForeground": "#ffffff",
    "titleBar.inactiveBackground": "#4c568d",
    "titleBar.inactiveForeground": "#aaaaaa",
    "tab.activeBorder": "#ffffff",
    "tab.activeBorderTop": "#ffd900",
    "tab.activeBackground": "#3d615f"
  },

  // Format
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "diffEditor.ignoreTrimWhitespace": false
  },
  "markdownlint.config": {
    "MD024": false
  },
  "html.format.wrapAttributes": "force-expand-multiline", // HTML formatter settings.
  "[html]": {
    "editor.defaultFormatter": "vscode.html-language-features",
    "editor.formatOnSave": true
  },
  "[blade]": {
    "editor.defaultFormatter": "shufo.vscode-blade-formatter",
    "editor.formatOnSave": true
  },
  "[blade.php]": {
    "editor.defaultFormatter": "shufo.vscode-blade-formatter",
    "editor.formatOnSave": true
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
  "typescript.inlayHints.enumMemberValues.enabled": false,
  "typescript.inlayHints.functionLikeReturnTypes.enabled": false,
  "typescript.inlayHints.parameterNames.enabled": "none",
  "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName": false,
  "typescript.inlayHints.parameterTypes.enabled": false,
  "typescript.inlayHints.propertyDeclarationTypes.enabled": false,
  "typescript.inlayHints.variableTypes.enabled": false,
  "typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName": false,
  "typescript.tsdk": "",

  "[vue]": {
    "editor.defaultFormatter": "Vue.volar"
  },
  "[cpp]": {
    "editor.defaultFormatter": "ms-vscode.cpptools"
  },

  // Terminal
  "terminal.integrated.env.linux": {},
  "terminal.integrated.enableMultiLinePasteWarning": "never", // Terminal multiline paste warning.
  "terminal.integrated.defaultProfile.windows": "Git Bash", // Default terminal profile on Windows.

  // Git
  "git.openRepositoryInParentFolders": "always",
  "git.suggestSmartCommit": false,
  "git.ignoreRebaseWarning": true,

  ///////////////////////// Community Material Theme /////////////////////////
  ///////////////////////// Community Material Theme /////////////////////////
  ///////////////////////// Community Material Theme /////////////////////////
  "git.confirmSync": false, // Material icon theme.
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
  "workbench.editorAssociations": {
    "*.svg": "hediet.vscode-drawio-text"
  },
  "hediet.vscode-drawio.resizeImages": null,

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

  ///////////////////////// Jupyter Notebook /////////////////////////
  ///////////////////////// Jupyter Notebook /////////////////////////
  ///////////////////////// Jupyter Notebook /////////////////////////
  "notebook.cellToolbarLocation": {
    "default": "right",
    "jupyter-notebook": "right"
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
      "icon": "tools",
      "foreground": "#ff0000",
      "iconColour": "#ff0000"
    }
  },
  "security.workspace.trust.untrustedFiles": "open",
  "editor.unicodeHighlight.invisibleCharacters": false,
  "explorer.fileNesting.patterns": {
    "*.ts": "${capture}.js",
    "*.js": "${capture}.js.map, ${capture}.min.js, ${capture}.d.ts",
    "*.jsx": "${capture}.js",
    "*.tsx": "${capture}.ts",
    "tsconfig.json": "tsconfig.*.json",
    "package.json": "package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lockb",
    "*.sqlite": "${capture}.${extname}-*",
    "*.db": "${capture}.${extname}-*",
    "*.sqlite3": "${capture}.${extname}-*",
    "*.db3": "${capture}.${extname}-*",
    "*.sdb": "${capture}.${extname}-*",
    "*.s3db": "${capture}.${extname}-*"
  },
  "antigravity.autoExecutionPolicy": "off",
  "builder.serverUrl": "http://localhost:9000",
  "builder.command": "quasar dev",
  "builder.openInBrowser": true,
  "editor.minimap.maxColumn": 75,
  "workbench.editor.empty.hint": "hidden",
  "files.autoSaveDelay": 10000,
  "editor.unicodeHighlight.ambiguousCharacters": false

  ///////////////////////// END /////////////////////////
  ///////////////////////// END /////////////////////////
  ///////////////////////// END /////////////////////////
}
```
