# How to Navigate Through Git Commits (TimeMachine)

```bash
# clones the project
git clone $projectSSHKey

# dives into project folder
cd $projectName

# shows the logs
git log --oneline

# specifies commit ID to go
git checkout $commitId

# returns back to previous commit
git checkout -

# returns back to last commit
git checkout @{-1}

# returns 4 commits back
git checkout @{-4}

# shows the history between commits
git reflog

# goes back to the latest commit point
git checkout origin/main

# pulls the latest version of the project
git pull origin main

# shows the detailed (with all branches) commit logs
git log --oneline --graph --all
```

- For more information and examples [visit](https://gitbookdown.dallasdatascience.com/revert-to-a-previous-commit-git-checkout.html).
