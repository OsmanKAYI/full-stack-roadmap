# Git Branch Advanced Example

```bash
mkdir test
cd test/
rm -rf .git
rm -rf *
git init
git branch -M main

touch readme.md
git add .
git commit -m "added readme.md"

git checkout -b develop main

git checkout -b feature-hello develop
touch hello.html
git add .
git commit -m "added hello.html"

git checkout -b feature-userinfo develop
touch userpage.html
git add .
git commit -m "added userpage.html"

git checkout feature-hello
touch world.html
git add .
git commit -m "added world.html"

git checkout develop
git merge --no-ff feature-hello -m "merged feature-hello"
git branch -d feature-hello

git checkout feature-userinfo
touch userinfo.html
git add .
git commit -m "added userinfo.html"

git checkout -b bugfix-login main
touch login.html
git add .
git commit -m "fixed login.html"
git checkout main
git merge --no-ff bugfix-login -m "merged bugfix-login"
git checkout develop
git merge --no-ff bugfix-login -m "merged bugfix-login"
git branch -d bugfix-login

git checkout develop
git merge --no-ff feature-userinfo -m "merged feature-userinfo"
git branch -d feature-userinfo

git checkout main
git merge --no-ff develop -m "merged develop"

git checkout develop
touch success.html
git add .
git commit -m "added success.html on develop"
touch continue.html
git add .
git commit -m "added continue.html on develop"

git checkout main
git merge --no-ff develop -m "merged develop"
```
