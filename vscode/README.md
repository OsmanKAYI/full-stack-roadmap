# VISUAL STUDIO CODE

Visual Studio Code is a free and open-source code editor developed by Microsoft. It is used by developers to write, debug, and deploy applications for a variety of platforms.

## Getting Started

To get started with Visual Studio Code, you can follow these steps:

- Download and install Visual Studio Code from [code.visualstudio.com](code.visualstudio.com).
- Set up your editor by installing any necessary extensions and customizing your settings.
- Create a new project or open an existing project folder.
- Write your code, and use Visual Studio Code's powerful debugging and code navigation features to improve your workflow.

## Installing Visual Studio Code

To install Visual Studio Code on your Ubuntu system, you can follow these steps:

```bash
sudo rm /etc/apt/sources.list.d/vscode.list
sudo rm /usr/share/keyrings/vscode.gpg
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
```

## Extensions

Visual Studio Code has a large and active extension marketplace, which allows developers to extend the functionality of the editor. These extensions can be found in the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/).

## Documentation

The Visual Studio Code documentation is available online at [Visual Studio Code](https://code.visualstudio.com/docs). This documentation includes guides, tutorials, and reference material for learning Visual Studio Code and using it effectively.

- [Introduction to Visual Studio Code (VSCode)](./vscode.md)
- [Usefull VSCode Extensions](./extensions.md)
  - [Usefull VSCode Extensions(.sh)](./extensions.sh)
  - [Usefull VSCode Extensions for Front-End Developers(.sh)](./extensions.front.end.sh)
  - [Usefull VSCode Extensions for PHP Developers(.sh)](./extensions.php.sh)
- [18 Awesome VSCode Extensions for Front-End Developers 🚀](./18.awesome.vscode.extensions.for.front-end.md)
- [5 Unnecessary VS Code Extensions You Should Uninstall Now](./5.unnecessary.vscode.extension.md)
- [Boost Your Productivity with 31 Mind-Blowing Custom VSCode Shortcuts](./31.custom.vscode.shortcuts.md)
- [Settings](./settings.md)
  - [Settings for Front-End Developers](./settings.front.end.md)
  - [ESLint and Prettier Settings to Use in Projects](./eslint.prettier.settings.md)
- [Keybindings](./keybindings.md)
- [Keyboard Shortcuts](./shortcuts.md)
- [VSCode Productivity Tips & Hacks](./productivity.tips.md)
- [10 Essential Tips to Supercharge VSCode and Code Faster](./10.tips.md)
