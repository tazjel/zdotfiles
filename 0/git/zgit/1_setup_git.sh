#!/bin/bash


#emai=$1
#repo=$2

zssh_make_new_key ()
{
    ssh-keygen -t rsa -C 'tazjel@gmail.com'
}

zssh_check_github ()
{
    ssh -T git@github.com

}
ssh-keygen_rsa ()
{
    ssh-keygen -t rsa -C 'tazjel@gmail.com'
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com
}

xclip_pass ()
{
    xclip -sel clip < ~/.ssh/id_rsa.pub

}

zgit_clone_zdotfiles ()
{
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
}
