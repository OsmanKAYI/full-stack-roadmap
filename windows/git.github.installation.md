# Installing Git and GitHub

## Download & Install

- Download setup of git from [here](https://git-scm.com/download/win).
- After, install it just clicking on 'Next' button several time (no special setting to do).

**NOTE:** Be sure that _Git Bash_ is installed on your system!!!

# GitHub Configurations

- Run _Git Bash_ program.
- Setup a new ssh key with `ssh-keygen` command and give it a `$sshKeygenName` (otherwise it will be `id_rsa`).
- Go to `Settings` of your GitHub account and press `SSH and GPG keys`.
- Click on `New SSH key`.
- Give it a `Title` and paste the content of `sshKeygenName.pub` file under the nameof `Key`.
- Run the following commands in Git Bash to present yourself to your computer.

```bash
git config --global user.name "$username"
git config --global user.email "$email"
git config --global user.password "$password"
git config --global credential.helper store
```

- Activate your ssh-agent by using

```bash
eval `ssh-agent -s`
```

- Add your identity by using `ssh-add -l`
- Add your `$sshKeygenName` by using `ssh-add ~/.ssh/$sshKeygenName`.
- Now, you are ready to use `git clone git@github.com:username/repositoryname.git`.

**Note:**Use Git Bash as your terminal to run the commands.
**Note2:**If these steps were successfull and you have some problem after a period of time, rerun the commands below.

```bash
eval `ssh-agent`
ssh-add -l
ssh-add ~/.ssh/id_rsa
```
