# Comparing Two Git Branches

**TLDR:**  
To compare branches in Git, use the `git diff` command to identify differences between files in two branches. Optional parameters can limit the output to file names only.

Comparing branches like **master** and **develop** is straightforward:

```bash
git diff master..develop
```

This command highlights differences between all files across the two branches. To list only file names, use additional parameters such as **--name-status** or **--name-only**:

```bash
git diff --name-status master..develop
```

**Ref:** [Eray Alakese - Medium](https://medium.com/@erayalakese/i%CC%87ki-git-branchini-kar%C5%9F%C4%B1la%C5%9Ft%C4%B1rmak-c8a8be99c0c7)
