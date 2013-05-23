#!/usr/bin/env sh

git clone https://github.com/web2py/web2py.git
cd web2py
git remote add upstream https://github.com/web2py/web2py.git
git fetch upstream


#
#git push origin master
## Pushes commits to your remote repository stored on GitHub
#git fetch upstream
## Fetches any new changes from the original repository
#git merge upstream/master
## Merges any changes fetched into your working files
