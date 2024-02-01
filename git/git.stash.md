# What is Git Stash

- Git stash allows you to save changes that are not ready to be committed yet, and then apply these changes later.

## Saving Changes to a Stash

1. Stash your Changes:

```bash
git stash save "Your stash message"
```

This command will save your changes (both staged and unstaged) into a new stash. You can give it a descriptive message to remember what you were working on.

2. Apply the Stash:

```bash
git stash apply
```

This will apply the changes from the most recent stash. If you have multiple stashes, you can apply a specific stash by providing its reference, e.g. `git stash apply stash@{2}`.

If you want to remove the changes from the stash after applying, you can use `git stash pop` instead.

## Managing Multiple Stashes:

- List all stashes:

```bash
git stash list
```

This will show you a list of all stashes you've created.

- Apply a Specific Stash:

```bash
git stash apply stash@{n}
```

Replace `n` with the index of the stash you want to apply.

- Delete a Stash:

```bash
git stash drop stash@{n}
```

This will remove the specified stash. Be careful, this action cannot be undone.

Remember, stashes are specific to your local repository, and they're not pushed to remote repositories. If you need to share your changes with others, consider committing your changes to a branch before switching or stashing.
