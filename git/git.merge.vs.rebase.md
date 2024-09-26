# Git Merge vs. Git Rebase

## What are the differences?

When we _merge changes_ from one Git branch to another, we can use _git merge_ or _git rebase_. The diagram below shows how the two commands work.

- **Git Merge**

  - This creates a new commit G’ in the main branch. G’ ties the histories of both main and feature branches.
  - Git merge is _non-destructive_. Neither the main nor the feature branch is changed.

- **Git Rebase**

  - Git rebase moves the feature branch histories to the head of the main branch. It creates new commits E’, F’, and G’ for each commit in the feature branch.
  - The benefit of rebase is that it has _linear commit history_.
  - Rebase can be dangerous if _the golden rule of git rebase_ is not followed.

**𝐓𝐡𝐞 𝐆𝐨𝐥𝐝𝐞𝐧 𝐑𝐮𝐥𝐞 𝐨𝐟 𝐆𝐢𝐭 𝐑𝐞𝐛𝐚𝐬𝐞**
_Never use it on public branches!_

[![Git Merge vs. Git Rebase](https://img.youtube.com/vi/0chZFIZLR_0/0.jpg)](https://www.youtube.com/watch?v=0chZFIZLR_0 "Git Merge vs. Git Rebase")
