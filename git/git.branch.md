# What is Git Branch

- Git branches are effectively a pointer to a snapshot of your changes. When you want to add a new feature or fix a bug—no matter how big or how small—you spawn a new branch to encapsulate your changes.

- Common options in git branch are as follows

```bash
# list all of the branches in your repository. This is synonymous with "git branch --list"
git branch

# create a new branch called $branchName. This does not check out the new branch
git branch $branchName

# delete the specified branch. This is a “safe” operation in that Git prevents you from deleting the branch if it has unmerged changes
git branch -d $branchName

# force delete the specified branch, even if it has unmerged changes. This is the command to use if you want to permanently throw away all of the commits associated with a particular line of development
git branch -D $branchName

#previous two commands will delete a local copy of a branch. The branch may still exist in remote repos. To delete a remote branch execute the following
git push origin --delete $branchName
git push origin :$branchName
# this will push a delete signal to the remote origin repository that triggers a delete of the remote $branchName branch

# rename the current branch to $branchName
git branch -m $branchName

# list all remote branches
git branch -a

# witching branches is a straightforward operation. Executing the following will point MAIN to the tip of $branchName
git checkout $branchName
```

- How to merge the changes done to the main

```bash
# start a new $branchName
git checkout -b $branchName main

# edit some files
git add $file
git commit -m "Start a feature"

# edit some files
git add $file
git commit -m "Finish a feature"

# merge in the $branchName branch
git checkout main
git merge $branchName

# delete the merged branch
git branch -d $branchName
```

**Ref:** https://www.atlassian.com/git/tutorials/using-branches
