# Git

There are many clients for Git. The technology is all the same no matter the client. But in this guide we’ll be using GitHub
to understand Git.

## What is Version Control?

Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later. So ideally, we can place any file in the computer on version control.

## So What is Git?

Git is a version-control system for tracking changes in computer files and coordinating work on those files among multiple people. Git is a Distributed Version Control System. So Git does not necessarily rely on a central server to store all the versions of a project’s files. Instead, every user “clones” a copy of a repository (a collection of files) and has the full history of the project on their own hard drive. This clone has all of the metadata of the original while the original itself is stored on a self-hosted server or a third party hosting service like GitHub.

Git helps you keep track of the changes you make to your code. It is basically the history tab for your code editor(With no incognito mode ?). If at any point while coding you hit a fatal error and don’t know what’s causing it you can always revert back to the stable state. So it is very helpful for debugging. Or you can simply see what changes you made to your code over time.

## Git Workflow

A repository a.k.a. repo is nothing but a collection of source code.

There are four fundamental elements in the Git Workflow.

- Working Directory,
- Staging Area,
- Local Repository and
- Remote Repository.

If you consider a file in your Working Directory, it can be in three possible states.

1. It can be staged. Which means the files with the updated changes are marked to be committed to the local repository
but not yet committed.
2. It can be modified. Which means the files with the updated changes are not yet stored in the local repository.
3. It can be committed. Which means that the changes you made to your file are safely stored in the local repository.

- `git add` is a command used to add a file that is in the working directory to the staging area.
- `git commit` is a command used to add all files that are staged to the local repository.
- `git push` is a command used to add all committed files in the local repository to the remote repository. So in the remote
    repository, all files and changes will be visible to anyone with access to the remote repository.
- `git fetch` is a command used to get files from the remote repository to the local repository but not into the working
    directory.
- `git merge` is a command used to get the files from the local repository into the working directory.
- `git pull` is command used to get files from the remote repository directly into the working directory. It is equivalent to a git fetch and a git merge.

### Step 0: Create a GitHub Account

### Step 1: Make sure you have Git installed on you machine

If you are running Linux(deb), enter the following in the terminal:

`sudo apt install git-all`

### Step 2: Tell Git who you are

```bash
git config --global user.name "YOUR_USERNAME"
git config --global user.email "im_satoshi@musk.com"
git config --global --list # To check the info you just provided
```

### Step 3: Generate/check your machine for existing SSH keys. (Optional

Using the SSH protocol, you can connect and authenticate to remote servers and services. With SSH keys, you can connect to
GitHub without supplying your username or password at each visit.

- **Checking for existing SSH keys**

1. Open Terminal.

2. Enter ls -al ~/.ssh to see if existing SSH keys are present.

    ```bash
    ls -al ~/.ssh
    # Lists the files in your .ssh directory, if they exist
    ```

3. Check the directory listing to see if you already have a public SSH key. By default, the filenames of supported public
keys for GitHub are one of the following.

    ```bash
    id_rsa.pub
    id_ecdsa.pub
    id_ed25519.pub
    ```

Tip: If you receive an error that ~/.ssh doesn't exist, you do not have an existing SSH key pair in the default location.
You can create a new SSH key pair in the next step.

- **Generating a new SSH key and adding it to the ssh-agent**

1. Open Terminal.

2. Paste the text below, substituting in the email address for your account on GitHub.

    `ssh-keygen -t ed25519-sk -C "your_email@example.com"`

    Note: If the command fails and you receive the error invalid format or feature not supported, you may be using a hardware
    security key that does not support the Ed25519 algorithm. Enter the following command instead.

    `ssh-keygen -t ecdsa-sk -C "your_email@example.com"`

3. When you are prompted, touch the button on your hardware security key.

4. When you are prompted to "Enter a file in which to save the key," press Enter to accept the default file location.

    > Enter a file in which to save the key (/home/you/.ssh/id_ed25519_sk): [Press enter]

5. When you are prompted to type a passphrase, press Enter.

    > Enter passphrase (empty for no passphrase): [Type a passphrase]
    > Enter same passphrase again: [Type passphrase again]

6. Add the SSH key to your account on GitHub. For more information, see "Adding a new SSH key to your GitHub account."

- **Adding a new SSH key to your GitHub account**

After adding a new SSH key to your account on GitHub.com, you can reconfigure any local repositories to use SSH.

1. Copy the SSH public key to your clipboard.

    If your SSH public key file has a different name than the example code, modify the filename to match your current setup.
    When copying your key, don't add any newlines or whitespace.

    ```bash
    cat ~/.ssh/id_ed25519.pub
    # Then select and copy the contents of the id_ed25519.pub file
    # displayed in the terminal to your clipboard
    ```

    Tip: Alternatively, you can locate the hidden .ssh folder, open the file in your favorite text editor, and copy it to
    your clipboard.

2. In the upper-right corner of any page, click your profile photo, then click Settings.

3. In the "Access" section of the sidebar, click SSH and GPG keys.

4. Click New SSH key or Add SSH key.

5. In the "Title" field, add a descriptive label for the new key. For example, if you're using a personal Mac, you might
call this key "Personal MacBook Air".

6. Paste your key into the "Key" field.

7. Click Add SSH key.

8. If prompted, confirm your GitHub password.

- **Testing your SSH connection**

When you test your connection, you'll need to authenticate this action using your password, which is the SSH key
passphrase you created earlier.

1. Open Terminal.

2. Enter the following:

    ```bash
    ssh -T git@github.com
    # Attempts to ssh to GitHub
    ```

    You may see a warning like this:

    ```text
    > The authenticity of host 'github.com (IP ADDRESS)' can't be established.
    > RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
    > Are you sure you want to continue connecting (yes/no)?
    ```

3. Verify that the fingerprint in the message you see matches
[GitHub's SSH key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints).
If it does, then type yes:

    ```bash
    > Hi username! You've successfully authenticated, but GitHub does not
    > provide shell access.
    ```

    You may see this error message:

    ```text
    Agent admitted failure to sign using the key.
    debug1: No more authentication methods to try.
    Permission denied (publickey).
    ```

    This is a known problem with certain Linux distributions.

4. Verify that the resulting message contains your username. If you receive a "permission denied" message,
see [Error: Permission denied (publickey)](https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey)

If you did setup SSH, every git command that has a link you replace it by:

Instead of : `https://github.com/username/reponame`
You use    : `git@github.com:username/reponame.git`

**Note:** You can use both ways alternatively

### Step 4: Let’s Gi

Create a new repository on GitHub. Follow this link.
Now, locate to the folder you want to place under git in your terminal.

`cd Desktop/MuskCult`

### Initialize Git

And to place it under git, enter:

```bash
touch README.md    # To create a README file for the repository
git init           # Initiates an empty git repository
```

Now go edit the README.md file to provide information about the repository.

Add files to the Staging Area for commit:

### Now to add the files to the git repository for commit

```bash
git add .
# Adds all the files in the local repository and stages them for commit
```

OR if you want to add a specific file

```bash
git add README.md
# To add a specific file
```

### Before we commit let’s see what files are staged

`git status # Lists all new or modified files to be committed`

### Commit Changes you made to your Git Repo

Now to commit files you added to your git repo:

```bash
git commit -m "First commit"
# The message in the " " is given so that the other users can read the message and see what changes you made
```

### Uncommit Changes you just made to your Git Repo

Now suppose you just made some error in your code or placed an unwanted file inside the repository, you can unstage the files you just added using:

```bash
git reset HEAD~1
# Remove the most recent commit
# Commit again!
```

### Add a remote origin and Push

Now each time you make changes in your files and save it, it won’t be automatically updated on GitHub. All the changes we made in the file are updated in the local repository. Now to update the changes to the master:

```bash
git remote add origin remote_repository_URL
# sets the new remote
```

### The git remote command lets you create, view, and delete connections to other repositories

```bash
git remote -v
# List the remote connections you have to other repositories.
```

### The git remote -v command lists the URLs of the remote connections you have to other repositories

`git push -u origin master # pushes changes to origin`

Now the git push command pushes the changes in your local repository up to the remote repository you specified as the
origin. And that’s it. You’ve just added the files to the repository you just created on GitHub.

### See the Changes you made to your file

Once you start making changes on your files and you save them, the file won’t match the last version that was committed to
git. To see the changes you just made:

`git diff # To show the files changes not yet staged`

### Revert back to the last committed version to the Git Repo

Now you can choose to revert back to the last committed version by entering:

`git checkout .`

OR for a specific file

`git checkout -- 'filename'`

### View Commit History

You can use the git log command to see the history of commit you made to your files:

`git log`

Each time you make changes that you want to be reflected on GitHub, the following are the most common flow of commands:

```bash
git add .
git status # Lists all new or modified files to be committed
git commit -m "Second commit"
git push -u origin master
```

Now if we go and see our repo, we can identify whether the commit was successful by looking at the commit message for each
file.

### Step 5 * That’s all well and good… But How do I download and work on other repositories on GitHub

### Cloning a Git Repo

Locate to the directory you want to clone the repo. Copy the link of the repository you want and enter the following:

`git clone 'remote_repository_URL'`

Feel free to go ahead and clone the repo I created above using: [Gothamv - GitHub](https://github.com/Gothamv/MuskCult)

### Pushing Changes to the Git Repo

Now you can work on the files you want and commit to changes locally. If you want to push changes to that repository you
either have to be added as a collaborator for the repository or you have create something known as pull request.

### Collaborating

So imagine you and your friend are collaborating on a project. You both are working on the same project files. Each time you
make some changes and push it into the master repo, your friend has to pull the changes that you pushed into the git repo.
Meaning to make sure you’re working on the latest version of the git repo each time you start working, a git pull command is
the way to go.

### So to make sure those changes are reflected on my local copy of the repo

`git pull origin master`

Here’s two more useful git commands:

`git fetch` AND `git merge`

In the simplest terms, git fetch followed by a git merge equals a git pull. But then why do these exist?

When you use git pull, Git tries to automatically do your work for you. It is context sensitive, so Git will merge any pulled
commits into the branch you are currently working in. git pull automatically merges the commits without letting you review
them first.

When you git fetch, Git gathers any commits from the target branch that do not exist in your current branch and stores them
in your local repository. However, it does not merge them with your current branch. This is particularly useful if you need
to keep your repository up to date, but are working on something that might break if you update your files. To integrate the
commits into your master branch, you use git merge.

### One More Thing

`.gitignore`

.gitignore tells git which files (or patterns) it should ignore. It's usually used to avoid committing transient files from
your working directory that aren't useful to other collaborators, such as compilation products, temporary files IDEs create,
etc.

### Use the touch command to create the .gitignore file

`touch .gitignore`

And you can add the following patterns to tell git to ignore such files.

```text
/*.cmake
/*.DS_Store
/.user
/build
etc. depending upon the files you want git to untrack
```

Ref: [FreeCodeCamp](https://www.freecodecamp.org/news/learn-the-basics-of-git-in-under-10-minutes-da548267cc91/)
