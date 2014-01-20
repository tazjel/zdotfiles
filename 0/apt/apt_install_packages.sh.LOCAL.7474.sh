#!/bin/bash

xpk="aptitude zsh git vim vim-gui-common vim-gnome autotools-dev automake build-essential"

do_list() {
    for i in $xpk;
    do
       echo $i
   done
}

#
do_list
