#!/bin/bash
username='tazjel'
gurl='https://github.com/'$username

repo='new_repo'
mkdir $repo
cd $repo
git init
touch README
git add README
git commit -m 'first commit'
git remote add origin https://github.com/
