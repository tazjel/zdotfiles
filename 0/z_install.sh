#!/usr/bin/env bash
app_name='zdotfiles'
git_uri='https://github.com/tazjel/zdotfiles.git'
git_branch='master'
debug_mode='0'
fork_maintainer='0'

wi_ubuntu_restricted_extras(){
    sudo apt-get install ubuntu-restricted-extras
}

wi_basic(){
    sudo apt-get install -y vim zsh konsole xclip git-core openssh-server curl wget vim-gnome aptitude mercurial inkscape
}
#####################################################
#               start
#
####################################################

wi_basic
wi_ubuntu_restricted_extras
