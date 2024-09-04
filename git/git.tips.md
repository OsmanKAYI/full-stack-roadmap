# Git Tips

## Actions to be Taken Once the Operating System is Installed

```bash
sudo apt update
sudo apt upgrade
sudo apt install git -y
git config --global user.email "$email"
git config --global user.name "$username"
```

## Actions to be Performed Once in Each Project

```bash
git init
git add .
git commit -m "first commit"
git remote add origin git@github.com:$username/$projectName.git
git push -u origin master
```

## Adding a GitHub Link to an Existing Folder

```bash
git init
git remote add origin git@github.com:$username/$projectName.git
git push -u origin master
```

## Commands Used Every Day

```bash
git add .
git commit -m "Commit Explanation"
git push -u origin master
git pull -u origin master
```

## When New Files Are Added to the Project

```bash
git add .
```

**Ref:** [nuriakman - GitHub](https://github.com/nuriakman/PHP-Egitimi/blob/master/konular/komutlar.git.ipuclari.md)
