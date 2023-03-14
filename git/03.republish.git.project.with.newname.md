# How to Republish Existing Git Project Without Harming Old One

```BASH
cp -r ~/source/computerNotes/ ~/source/osmankayi.com/ # to copy existing project with a new name
cd ~/source/osmankayi.com/ # to dive into it
rm -rf .git # to remove all commits and git-related features
```

- After this step, you can arrange project as you wish and continue.
- Before jumping to next step, create a repository in github with chosen new name (in my case _osmankayi.com_).

```BASH
git init # to start git in this project
git remote add origin git@github.com:OsmanKAYI/osmankayi.com.git # to define origin of the project
git branch -M main # to create new branch called main
git add . # to add all existing files and folders
git commit -m "site published" # to create the first commit as *site published*
git push -u origin main # to push everything being in your local pc to github
```
