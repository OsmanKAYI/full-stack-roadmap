# 11 Expert Tips for Efficient Committing

Explore 11 essential tips for mastering code commits, including effective messaging, managing file counts, and using shortcuts to streamline your workflow. Here’s a guide to enhance your commit practices for a better development experience.

## Local and Remote Commits

Understanding the difference between local and remote commits is crucial:

- **Local Commits:** Changes saved on your computer.
- **Remote Commits:** Changes pushed to the remote repository.

Keep your local and remote repositories in sync:

- **Push Changes:** `git push` to update the remote repository.
- **Pull Changes:** `git pull` to update your local repository.

Conflicts may arise during merges if there are discrepancies in commit history. 🔄

## How Many Files to Include in a Commit

- **Small Commits:** Prefer smaller, focused commits that are easier to manage and revert.
- **Separate Commits:** For changes to different parts of a project (e.g., header, footer), create separate commits to keep history clean and relevant.

![Example of Commits](https://miro.medium.com/v2/resize:fit:1024/0*QeOf-NDdQl2zhQq4)

## Example of Few Files Split into More Commits

Smaller, well-defined commits make it easier to track and revert specific changes:

![Few Files Split](https://miro.medium.com/v2/resize:fit:1000/1*BJ-n4Xt5xnm75vEw9MP63Q.png)

## Git Commit Command Tips

### Basic Git Commit

- **Command:** `git commit`
- Opens a text editor for the commit message.

### Commit with Message Inline

- **Command:** `git commit -m "Your message"`
- Provides a one-line commit message without opening a text editor.

### Git Add and Commit Simultaneously

- **Command:** `git commit -a -m "Your message"`
- Adds all changes and commits in one step (excludes untracked files).

### Commit Amendment

- **Command:** `git commit --amend`
- Modify the last commit to include additional changes or fix mistakes.

## Tips for Writing Good Commit Messages

1. **Use Action-Oriented Verbs:**
   - E.g., `Improve`, `Optimize`, `Update`, `Implement`

2. **Be Clear and Specific:**
   - E.g., `Improve navigation bar responsiveness`, `Optimize database query performance`

3. **Avoid Ambiguity:**
   - Specify what was changed and why.

4. **Format Consistently:**
   - Title (50 characters max) and description (72 characters per line).

5. **Provide Additional Context:**
   - Use comments or descriptions if needed.

## What Not to Write in a Commit Message

- **Avoid Vague Messages:** E.g., `Update feature`
- **Avoid Repetitive Messages:** E.g., multiple commits with `create about page`
- **Avoid Single-Letter or Generic Messages:** E.g., `m`, `test`, `add`

## Using VS Code Shortcuts for Commits

1. **Configure Shortcuts:**
   - Go to File > Preferences > Keyboard Shortcuts (`CTRL + K + S`).

2. **Assign Shortcuts:**
   - Double-click on **Git: Commit** and set your preferred shortcut.

3. **Commit from VS Code:**
   - Use the shortcut to open the commit message box.

![VS Code Shortcut](https://miro.medium.com/v2/resize:fit:700/0*t8ujfmLuZ3z4okgt.png)

## Editing Git Messages in VS Code

- **Enable Editing:** Go to File > Preferences > Settings (`CTRL + ,`), search for “Git: Commit Message”, and enable editing.

![Editing Git Messages](https://miro.medium.com/v2/resize:fit:700/0*pSahoMejP1AqFAkM.png)

## References

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Creating the Perfect Commit in Git](https://css-tricks.com/creating-the-perfect-commit-in-git/)

## Callback

- **Prefer Smaller Commits:** Keep commits small and focused.
- **Use `git commit --amend`:** To add missing files to the last commit.

**Ref:** [Adarsh Rai - Medium](https://medium.com/@adarshrai3011/unveiling-11-expert-tips-for-efficient-committing-messaging-shortcuts-and-file-counts-41a85e9e1789)
