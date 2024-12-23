# VSCode Extensions

## Usefull VSCode Extensions

```bash
# Bookmarks ( <kbd>CTRL</kbd> + <kbd>F2</kbd> & <kbd>F2</kbd> )
## it helps you to navigate in your code, moving between important positions easily and quickly.
code --install-extension alefragnani.bookmarks

# C/C++
## C/C++ extension adds language support for C/C++ to Visual Studio Code, including editing (IntelliSense) and debugging features.
code --install-extension ms-vscode.cpptools

# Codeium
## codeium is an ai coding autocomplete and chat for Python, Javascript, Typescript, Java, Go, and more.
code --install-extension codeium.codeium

# Console Ninja
## console Ninja is a VS Code extension that displays console.log output and runtime errors directly in your editor from your running browser or node application.
code --install-extension wallabyjs.console-ninja
### Console Ninja VSCode Extension - Coding in Public
### https://www.youtube.com/watch?v=OC-_fcJyz_c

# DotENV
## enables support for dotenv file syntax
code --install-extension mikestead.dotenv

# Draw.io Integration
## unofficial extension integrates Draw.io into VS Code.
code --install-extension hediet.vscode-drawio

# Edit csv
## this extensions allows you to edit csv files with an excel like table ui
code --install-extension janisdd.vscode-edit-csv

# EditorConfig for VS Code
##  attempts to override user/workspace settings with settings found in .editorconfig files.
code --install-extension editorconfig.editorconfig

# Error Lens
## improve highlighting of errors, warnings and other language diagnostics.
code --install-extension usernamehw.errorlens

# ESLint
## integrates JavaScript into VSCode.
code --install-extension dbaeumer.vscode-eslint

# GistPad
## a Visual Studio Code extension that allows you to edit GitHub Gists and repositories from the comfort of your favorite editor.
code --install-extension vsls-contrib.gistfs

# Git File History
## quickly browse the history of a file from any git repository
code --install-extension pomber.git-file-history

# Git Graph
## views a Git Graph of your repository, and easily perform Git actions from the graph. Configurable to look the way you want!
code --install-extension mhutchie.git-graph

# GitHub Copilot
## is an AI pair programmer tool that helps you write code faster and smarter.
code --install-extension github.copilot

# GitHub Copilot Chat
## is an AI pair programmer tool that helps you write code faster and smarter.
code --install-extension github.copilot-chat

# Image preview
## shows image preview in the gutter and on hover.
code --install-extension kisstkondoros.vscode-gutter-preview

# indent-rainbow
## this extension colorizes the indentation in front of your text, alternating four different colors on each step. Some may find it helpful in writing code for Python, Nim, Yaml, and probably even filetypes that are not indentation dependent.
code --install-extension oderwat.indent-rainbow

# JavaScript and TypeScript Nightly
## Enables typescript@next to power VS Code's built-in JavaScript and TypeScript support
code --install-extension ms-vscode.vscode-typescript-next

# json2ts
## converts a JSON from clipboard to TypeScript interfaces. (Ctrl+Alt+V)
code --install-extension gregorbiswanger.json2ts

# Live Server (Five Server)
## automatically reloads webpage when you save the code.
code --install-extension yandeu.five-server

# Markdown All in One
## all you need to write Markdown (keyboard shortcuts, table of contents, auto preview and more)
code --install-extension yzhang.markdown-all-in-one

# Markdown Preview Mermaid Support
## adds Mermaid diagram and flowchart support to VS Code's builtin markdown preview
code --install-extension bierner.markdown-mermaid

# markdownlint
## markdown linting and style checking for Visual Studio Code
code --install-extension davidanson.vscode-markdownlint

# Multipe cursor case preserve
## Preserves case when editing with multiple cursors.
code --install-extension cardinal90.multi-cursor-case-preserve

# Pandoc Citer
## autocomplete bibtex citations for markdown/pandoc
code --install-extension notzaki.pandocciter

# Path Intellisense
## autocompletes filenames.
code --install-extension christian-kohler.path-intellisense

# Peacock
## subtly change the color of your Visual Studio Code workspace. Ideal when you have multiple VSCode instances, use VS Live Share, or use VSCode's Remote features, and you want to quickly identify your editor.
code --install-extension johnpapa.vscode-peacock

# PHP Debug
## this extension is a debug adapter between VSCode and Xdebug by Derick Rethans. Xdebug is a PHP extension (a .so file on Linux and a .dll on Windows) that needs to be installed on your server.
code --install-extension xdebug.php-debug

# PHP Intelephense
## is a high performance PHP language server packed full of essential features for productive PHP development.
code --install-extension bmewburn.vscode-intelephense-client

# PlatformIO IDE
## your gateway to embedded software development excellence
code --install-extension platformio.platformio-ide

# Prettier-Code formatter
## an opinionated code formatter. It enforces a consistent style by parsing your code and re-printing it with its own rules that take the maximum line length into account, wrapping code when necessary.
## If extension is not working properly, follow [instructions for Prettier](https://bobbyhadz.com/blog/fix-prettier-not-working-in-vs-code).
code --install-extension esbenp.prettier-vscode

# Pretty TypeScript Errors
## make TypeScript errors prettier and more human-readable in VSCode
code --install-extension yoavbls.pretty-ts-errors

# Project Manager
## it helps you to easily access your projects, no matter where they are located. Don't miss those important projects anymore.
code --install-extension alefragnani.project-manager

# Rainbow CSV
## it makes your codes, writings, files, and etc. more readable with making them colorful.
code --install-extension mechatroner.rainbow-csv

# TODO Highlight
## highlight TODO, FIXME and other annotations within your code.Sometimes you forget to review the TODOs you've added while coding before you publish the code to production. So I've been wanting an extension for a long time that highlights them and reminds me that there are notes or things not done yet. Hope this extension helps you as well.
code --install-extension wayou.vscode-todo-highlight

# Todo Tree
## this extension quickly searches (using ripgrep) your workspace for comment tags like TODO and FIXME, and displays them in a tree view in the activity bar. The view can be dragged out of the activity bar into the explorer pane (or anywhere else you would prefer it to be).
code --install-extension gruntfuggly.todo-tree

# vscode-pdf
## helps you to display pdf in VSCode.
code --install-extension tomoki1207.pdf

# vscode-reveal
## this extension lets you to display a reveal.js presentation directly from an opened markdown document.
code --install-extension evilz.vscode-reveal

# Vue-Official
## this extension provides language support for Vue
code --install-extension vue.volar

# WakaTime
## an open source VSCode plugin for metrics, insights, and time tracking automatically generated from your programming activity.
code --install-extension wakatime.vscode-wakatime
```

### Content of projects.json File for Project Manager

- To configure your settings, click on the `Project Manager: Edit Projects` (its like a pen) and arrange the below codes according to circumtances.

```bash
[
  {
    "name": "full-stack-roadmap",
    "rootPath": "~/source/full-stack-roadmap",
    "paths": [],
    "tags": [],
    "enabled": true
  }
]
```

- To dictate where project manager should be loking for your git projects, click on `Open Settings` and type `projectManager.git.basefolders`.
- Type the paths you have and press `Add Item`.
