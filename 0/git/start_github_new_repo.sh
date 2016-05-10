#!/bin/bash

username='tazjel'
gurl='tazjel.pythonanywhere.com/
repo='sas'

sas_online='ssh.pythonanywhere.com'
sas_dev='/home/www-data/sas'


function create_new {
    mkdir $repo
    cd $repo
    git init
    touch README
    git add README
    git commit -m 'first commit'
    git remote add origin https://github.com/
}

