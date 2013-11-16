#!/bin/bash

#git clone https://github.com/ggreer/the_silver_searcher
#cd the_silver_searcher && ./build.sh && install
#./build.sh && install


xpk="aptitude zsh git vim vim-scripts vim-docvim-latexsuite vim-gui-common vim-gnome autotools-dev automake build-essential pytVhon-dev automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev"

do_list () {
    for i in $xpk;do
       echo $i
   done
}

#
#do_list()
