# 20 Super Useful Git Commands

## 1.git config

Configures user information used across all local repositories.

- git config --global user.name “username”

- git config --global user.email “email”

**NOTE:** There shouldn't be any space between "user." and "name". Similarly no space between "user." and "email".

## 2.git init

Initialises an existing directory as Git repository.

- git init

## 3.git clone

Retrieves an entire repository from a hosted location via a valid Git URL.

- git clone [url]

- git clone --branch `name` [url]

## 4.git add

Add a file to staging area

- git add [file]

## 5.git rm

Deletes the file from project and stages the removal for commit.

- git rm [file]

## 6.git mv

Changes an existing file path and stages the move.

- git mv [existing-path] [new-path]

## 7.git commit

Commits the staged contents as a new commit snapshot.

- git commit -m "commit message"

## 8.git branch

List, Create or, Delete Branches

### List branches

- git branch

### Create a new Branch at the current commit

- git branch [branch-name]

### Delete a Branch

- git branch -d [branch-name]

## 9.git status

Shows the paths of modified files in working directory.

- git status

## 10.git diff

Show changes between commits.

### To see diff of what is changed, but not staged

- git diff

### To see diff of what is staged, but not committed

- git diff --staged

### To see diff between 2 branches

- git diff BranchA...BranchB

## 11.git log

### Shows the commit history for the currently active branch

- git log

### Shows the commits on branchA that are not on branchB

- git log branchB..branchA

## 12.git checkout

Switch branches.

### Switch to another branch and, check it out into your working directory

- git checkout [branch-name]

### Switch to another branch (create if does not exist)

- git checkout -b [branch-name]

## 13.git merge

Join 2 or, more development histories together.

- git merge [branch]

## 14.git fetch

Fetch branches and/or tags from one or more other repositories.

- git fetch [alias]

**NOTE:** You can use git fetch to know the changes done in the remote repo/branch since your last pull.

## 15.git pull

Fetch and merge any commits from the tracking remote branch.

- git pull

## 16.git push

Transmit local branch commits to the remote repository branch.

- git push [alias]

## 17.git rebase

Applies any commits of current branch ahead of specified one.

- git rebase [branch-name]

## 18.git revert

Reverts some existing commits.

- git revert `commit`

## 19.git reset

Resets current HEAD to the specified state.

### Unstages a file while retaining the changes in working directory

- git reset [file]

### Clears staging area, rewrite working tree from specified commit

- git reset --hard [commit]

## 20.git stash

Temporarily stores modified, tracked files in order to change branches

### Save modified and staged changes

- git stash

### List StackOrder of stashed file changes

- git stash list

### Write working from top

- git stash pop

### Discard the changes from top

- git stash drop

**Ref:** [swapnakpanda - X](https://x.com/swapnakpanda/status/1515198448852619266?t=i_WdzTdmxykedtOgaAidug&s=08)
