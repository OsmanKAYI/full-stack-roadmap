#!/bin/bash

# Antigravity Extension Installer

echo "🚀 Antigravity Uzantı Kurulumu Başlıyor..."

# Mevcut uzantılar
antigravity --install-extension alefragnani.bookmarks
antigravity --install-extension alefragnani.project-manager
antigravity --install-extension amiralizadeh9480.laravel-extra-intellisense
antigravity --install-extension bierner.markdown-mermaid
antigravity --install-extension bmewburn.vscode-intelephense-client
antigravity --install-extension cardinal90.multi-cursor-case-preserve
antigravity --install-extension christian-kohler.path-intellisense
antigravity --install-extension davidanson.vscode-markdownlint
antigravity --install-extension dbaeumer.vscode-eslint
antigravity --install-extension editorconfig.editorconfig
antigravity --install-extension esbenp.prettier-vscode
antigravity --install-extension evilz.vscode-reveal
antigravity --install-extension gruntfuggly.todo-tree
antigravity --install-extension hediet.vscode-drawio
antigravity --install-extension janisdd.vscode-edit-csv
antigravity --install-extension johnpapa.vscode-peacock
antigravity --install-extension kisstkondoros.vscode-gutter-preview
antigravity --install-extension mechatroner.rainbow-csv
antigravity --install-extension mhutchie.git-graph
antigravity --install-extension mikestead.dotenv
antigravity --install-extension ms-azuretools.vscode-docker
antigravity --install-extension ms-vscode.vscode-typescript-next
antigravity --install-extension notzaki.pandocciter
antigravity --install-extension oderwat.indent-rainbow
antigravity --install-extension onecentlin.laravel-blade
antigravity --install-extension shufo.vscode-blade-formatter
antigravity --install-extension tomoki1207.pdf
antigravity --install-extension usernamehw.errorlens
antigravity --install-extension vue.volar
antigravity --install-extension wakatime.vscode-wakatime
antigravity --install-extension wallabyjs.console-ninja
antigravity --install-extension wayou.vscode-todo-highlight
antigravity --install-extension xdebug.php-debug
antigravity --install-extension yandeu.five-server
antigravity --install-extension yoavbls.pretty-ts-errors
antigravity --install-extension yzane.markdown-pdf
antigravity --install-extension yzhang.markdown-all-in-one

# Alternatifler (orijinal bulunamadı)
antigravity --install-extension llvm-vs-code-extensions.vscode-clangd  # ms-vscode.cpptools alternatifi
antigravity --install-extension donjayamanne.githistory               # pomber.git-file-history alternatifi

echo ""
echo "✅ Kurulum tamamlandı!"
echo ""
echo "⚠️  Aşağıdaki 3 uzantı Antigravity marketplace'te bulunamadı:"
echo "   - vsls-contrib.gistfs (GitHub Gist dosya sistemi)"
echo "   - gregorbiswanger.json2ts (JSON → TypeScript)"
echo "   - platformio.platformio-ide (Gömülü sistemler IDE)"
