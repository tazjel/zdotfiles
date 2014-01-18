#!/usr/bin/env bash


    #<(find $HOME/zdotfiles/link -maxdepth 1 -type f -iname "$2");

z_colordiff()
{
    colordiff -yr <(find $HOME/. -maxdepth 1 -exec basename {} \;) <(find $HOME/zdotfiles/link -maxdepth 1 -exec basename {} \;)
}

z_colordiff "$1" "$2"
