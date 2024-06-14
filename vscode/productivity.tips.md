# VSCode Productivity Tips & Hacks

Visual Studio Code is the most popular Integrated Development Environment globally. According to [Stack Overflow’s 2023 Developer Survey](https://survey.stackoverflow.co/2023/#section-most-popular-technologies-integrated-development-environment), ~74% of developers prefer VS Code over others.

![Stack Overflow’s 2023 Developer Survey](https://miro.medium.com/v2/resize:fit:700/1*Thkf9yfadHkYf-YYdYT3ew.png)

[Reference: Stack Overflow’s 2023 Developer Survey](https://survey.stackoverflow.co/2023/#section-most-popular-technologies-integrated-development-environment)

## 1. Open in VS Code

To open a project in VS Code:

- On Linux-based distros like Ubuntu, use the terminal command `code .`.
- On Windows, open a folder by typing `cmd` in the address bar, pressing enter, and then using `code .`.

A simpler method is to enable the **‘open with code’** option during VS Code installation, allowing the right-click context menu to open folders in VS Code.

![Open in VS Code](https://miro.medium.com/v2/resize:fit:700/1*lpuI2c8WKeGOcaS74j83Eg.png)

If this config was missed initially, re-run the VS Code setup and ensure all checkboxes are checked. Previous configurations remain unchanged.

## 2. Renaming

Refactoring is essential for improving project quality and maintainability. VS Code facilitates this with the **Rename Symbol** command (F2). 

- Press F2, type the new name, and press Enter to rename all instances of the symbol across files.

![Renaming in VS Code](https://miro.medium.com/v2/resize:fit:700/1*AeioGjg71sEp-t87SRKjww.png)

## 3. Multi Cursor

Multi-select cursor allows editing multiple locations simultaneously.

- <kbd>Alt</kbd>+<kbd>Click</kbd>: Place a new cursor.
- <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Down</kbd>: Add a cursor below.
- <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Up</kbd>: Add a cursor above.
- Drag mouse while pressing the mouse wheel.

Use these shortcuts to append text at the end of multiple lines.

![Multi Cursor](https://miro.medium.com/v2/resize:fit:700/1*OnvIZa4mwzh3jCPbh-3yGg.gif)

Additional shortcuts:

- <kbd>Ctrl</kbd>+<kbd>Left</kbd>: Move cursor one word left.
- <kbd>Ctrl</kbd>+<kbd>Right</kbd>: Move cursor one word right.
- <kbd>Ctrl</kbd>+<kbd>Backspace</kbd>: Delete one word left.
- <kbd>Ctrl</kbd> + <kbd>D</kbd>: Add cursor to next matching word.

![Multi Cursors for matching words](https://miro.medium.com/v2/resize:fit:700/1*YgFspjr49FDscOkyNYCXnA.gif)

For renaming values with preserved case, use the ‘**Multiple Cursor Case Preserve**’ extension.

![With Multiple Cursor Case Preserve extension](https://miro.medium.com/v2/resize:fit:700/1*A3EdsoE9lj86gHHEYc7c2w.gif)

## 4. Move Lines Up/Down

Move lines with:

- **Move lines up**: <kbd>Alt</kbd> + <kbd>Up Arrow</kbd>
- **Move lines down**: <kbd>Alt</kbd> + <kbd>Down Arrow</kbd>

![Move lines up/down](https://miro.medium.com/v2/resize:fit:700/1*IU0dNH3F1WGZbWkxV8ce2g.gif)

## 5. Copy lines Up/Down

Copy lines with:

- <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Up/Down Arrow</kbd>.

To copy a line to a non-adjacent location, use <kbd>Ctrl</kbd> + <kbd>L</kbd> to select the line, then copy and paste.

![Copy lines up/down](https://miro.medium.com/v2/resize:fit:700/1*_JaUWKPn-EIxLKLgC3AspQ.gif)

## 6. Delete the Line

Delete a line quickly with:

- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>K</kbd>.

Alternatively, use <kbd>Ctrl</kbd> + <kbd>X</kbd> to cut the line.

![Delete the line](https://miro.medium.com/v2/resize:fit:700/1*pqNwtSfQAh8mOwixPmT2YA.gif)

## 7. Comment Code Block

Commenting code blocks:

- Single-line comments: <kbd>CTRL</kbd> + <kbd>/</kbd>
- Multi-line comments: <kbd>ALT</kbd> + <kbd>SHIFT</kbd> + <kbd>A</kbd>

![Comment code blocks](https://miro.medium.com/v2/resize:fit:700/1*mK0pBCVmQZH8XLnuvCLgPQ.gif)

## 8. Code Navigation Backward and Forward

Navigate code with:

- Backwards: <kbd>Ctrl</kbd> + <kbd>-</kbd>
- Forwards: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>-</kbd>

![Code Navigation](https://miro.medium.com/v2/resize:fit:700/1*eZanfrAT-X881QyaqqZ0EA.gif)

Customize key bindings via `File -> Preferences -> Keyboard Shortcuts`.

![Key-map Personalization](https://miro.medium.com/v2/resize:fit:700/1*eOU0mm2VZ_ynZq2xTrEO3A.png)

## 9. Quick Open

Open a file quickly with:

- <kbd>Ctrl</kbd> + <kbd>P</kbd>

Navigate recently opened files or search by name.

![Quick Open](https://miro.medium.com/v2/resize:fit:700/1*aoRmUYemeyMNgbM5xfbJwg.gif)

## 10. Command Palette

Access all VS Code commands with:

- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>

![Command Palette](https://miro.medium.com/v2/resize:fit:700/1*aG2fDikkveFKbZ895rOPJA.gif)

## 11. Global Find

Search within the codebase with:

- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd>

Filter search areas via the advanced menu.

![Global Find](https://miro.medium.com/v2/resize:fit:700/1*c59qlY5mMiyXWpzr1u8Q1w.png)

## 12. Fast Scrolling

Scroll quickly by holding the Alt key while scrolling.

![Fast Scrolling](https://miro.medium.com/v2/resize:fit:700/1*C5vHfwY9rQXPhfYWq51ZYw.gif)

Adjust scroll speed with the `editor.fastScrollSensitivity` setting.

> **Bonus:** Open terminal outside VS Code with <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd>

These shortcuts enhance daily productivity in VS Code.

**Ref:** [Yasas Sandeepa - Medium](https://levelup.gitconnected.com/vs-code-productivity-tips-hacks-5eb6fe4a4404)
