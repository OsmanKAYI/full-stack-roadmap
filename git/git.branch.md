# What is Git Branch

- Git branches are effectively a pointer to a snapshot of your changes. When you want to add a new feature or fix a bug—no matter how big or how small—you spawn a new branch to encapsulate your changes.

## Git Workflow

### Step 1: Initialize the Repository

```bash
mkdir test
cd test/
rm -rf .git
rm -rf *
git init
git branch -M main
```

- **mkdir test**: Creates a new directory named `test`.
- **cd test/**: Navigates into the `test` directory.
- **rm -rf .git**: Removes any existing Git repository.
- **rm -rf \***: Removes all files in the directory.
- **git init**: Initializes a new Git repository.
- **git branch -M main**: Renames the default branch to `main`.

### Step 2: Create `readme.md`

```bash
touch readme.md
git add .
git commit -m "added readme.md"
```

- **touch readme.md**: Creates an empty `readme.md` file.
- **git add .**: Stages all changes.
- **git commit -m "added readme.md"**: Commits the changes with a message.

### Step 3: Create and Merge `feature-hello`

```bash
git checkout -b develop main
git checkout -b feature-hello develop
touch hello.html
git add .
git commit -m "added hello.html"
touch world.html
git add .
git commit -m "added world.html"
git checkout develop
git merge --no-ff feature-hello -m "merged feature-hello"
# git merge feature-hello can be used to not to see the branch tree
git branch -d feature-hello
```

- **git checkout -b develop main**: Creates a new branch `develop` from `main`.
- **git checkout -b feature-hello develop**: Creates `feature-hello` branch from `develop`.
- **touch hello.html**: Creates an empty `hello.html` file.
- **touch world.html**: Creates an empty `world.html` file.
- **git merge --no-ff feature-hello -m "merged feature-hello"**: Merges `feature-hello` into `develop` with a merge commit.
- **git branch -d feature-hello**: Deletes `feature-hello` branch after merge.

### Step 4: Create and Merge `feature-userinfo`

```bash
git checkout -b feature-userinfo develop
touch userpage.html
git add .
git commit -m "added userpage.html"
touch userinfo.html
git add .
git commit -m "added userinfo.html"
git checkout develop
git merge --no-ff feature-userinfo -m "merged feature-userinfo"
# git merge feature-userinfo can be used to not to see the branch tree
git branch -d feature-userinfo
```

- **git checkout -b feature-userinfo develop**: Creates `feature-userinfo` branch from `develop`.
- **touch userpage.html**: Creates an empty `userpage.html` file.
- **touch userinfo.html**: Creates an empty `userinfo.html` file.
- **git merge --no-ff feature-userinfo -m "merged feature-userinfo"**: Merges `feature-userinfo` into `develop`.
- **git branch -d feature-userinfo**: Deletes `feature-userinfo` branch after merge.

### Step 5: Merge `develop` into `main`

```bash
git checkout main
git merge --no-ff develop -m "merged develop"
# git merge develop can be used to not to see the branch tree
```

- **git checkout main**: Switches to the `main` branch.
- **git merge --no-ff develop -m "merged develop"**: Merges `develop` into `main`.

### Step 6: Create and Merge `bugfix-login`

```bash
git checkout -b bugfix-login
git checkout -b bugfix-login main
touch login.html
git add .
git commit -m "fixed login.html"
git checkout main
git merge --no-ff bugfix-login -m "merged bugfix-login"
# git merge bugfix-login can be used to not to see the branch tree
git checkout develop
git merge --no-ff bugfix-login -m "merged bugfix-login"
# git merge bugfix-login can be used to not to see the branch tree
git branch -d bugfix-login
```

- **git checkout -b bugfix-login**: Creates `bugfix-login` branch from `main`.
- **touch login.html**: Creates an empty `login.html` file.
- **git merge --no-ff bugfix-login -m "merged bugfix-login"**: Merges `bugfix-login` into `main` and `develop`.
- **git branch -d bugfix-login**: Deletes `bugfix-login` branch after merge.

### Step 7: Add Success and Continue Pages

```bash
touch success.html
git add .
git commit -m "continued with success.html"

git checkout develop
touch continue.html
git add .
git commit -m "added continue.html"

git checkout main
```

- **touch success.html**: Creates an empty `success.html` file.
- **git commit -m "continued with success.html"**: Commits the changes.
- **touch continue.html**: Creates an empty `continue.html` file on `develop`.
- **git commit -m "added continue.html"**: Commits the changes.

**Refs:**

- [Vikram Wable - Medium](https://vikramatc.medium.com/git-branching-strategy-and-pull-requests-4a3d63943785)
- [Vincent Driessen](https://nvie.com/posts/a-successful-git-branching-model/)
