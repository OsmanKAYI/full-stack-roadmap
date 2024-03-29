# How to Republish Existing Git Project Without Harming Old One

```bash
# Copy existing project with a new name
cp -r ~/source/computerNotes/ ~/source/osmankayi.com/

# Dive into it
cd ~/source/osmankayi.com/

# Remove all commits and git-related features
rm -rf .git
```

- After this step, you can arrange project as you wish and continue.
- Before jumping to next step, create a repository in github with chosen new name (in my case _osmankayi.com_).

```bash
# Start git in this project
git init

# Define origin of the project
git remote add origin git@github.com:OsmanKAYI/osmankayi.com.git

# Create new branch called main
git branch -M main

# Add all existing files and folders
git add .

# Create the first commit as *site published*
git commit -m "site published"

# Push everything being in your local pc to github
git push -u origin main
```
