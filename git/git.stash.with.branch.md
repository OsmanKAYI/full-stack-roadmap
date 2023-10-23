# Git Stash with Branch

```BASH
# create a stash
git stash save "git stash example"
# create a branch
git branch "git-stash"
# dive into new branch
git checkout git-stash
# apply stashed changes
git stash apply
# add all the files to commit
git add .
# create a commit
git commit -m "git stash example"
# push the commit to the new branch
git push origin git-stash
# go back to main branch
git checkout main
# merge new branch with main branch
git merge git-stash
```
