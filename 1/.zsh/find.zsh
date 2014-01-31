#!/usr/bin/env bash


wg_txt() {
    find . -type f -and -iregex '.*\.txt$' -and -print0 -exec grep --color=always -Hn "$1" {} \;
}

function zfind_size() {
    find -name "*.*" -print0 | du -hc --files0-from=-
}

www_colordiff()
{
    colordiff -yr <(find $HOME/. -type l -maxdepth 1 -exec basename {} \;) <(find $HOME/zdotfiles/link -maxdepth 1 -exec basename {} \;)
}
#z_colordiff "$1" "$2"

WWW_find_sh() { find . -name "*sh" -exec grep -is "$1" {} \;
}
WWW_find_py() { find . -name "*py" -exec grep -is "$1" {} \;
}
WWW_find_vim() { find . -name "*vim" -exec grep -is "$1" {} \;
}

Confirm() {
    echo -n "$1 [y/n]?";
    read reply;
    case $reply in
        Y*|y*)
        true
        ;; *)
            false ;;
    esac
}

zselect() {
    PS3="Enter a number: "
    select f in "$@";do
        #$EDITOR $f;
        echo $f
    break;
    done
}
