#!/usr/bin/env bash




############################  SETUP PARAMETERS
############################  NAMES SETUP

app_name='spf13-vim'
git_uri='https://github.com/spf13/spf13-vim.git'
git_branch='3.0'
debug_mode='0'
fork_maintainer='0'
zdotfiles=$HOME/zdotfiles
LINKS=$HOME/zdotfiles/link
EAL_USER_NAME=`logname`

if [ "$REAL_USER_NAME" == ""  ] ; then
        REAL_USER_NAME="$1"
fi

if [ "$REAL_USER_NAME" == "" ] ; then
        echo
        echo "ERROR: Can not find out your real username, please give your real username as the first argument for the script." 
        echo
        exit
fi

#HOME_DIRECTORY=`getent passwd $REAL_USER_NAME | cut -d: -f6`






T_FILES=`cd $LINKS;find . -maxdepth 1 \
    -not -name "assets" -and \
    -not -name "scripts" -and \
    -not -name "install.sh" -and \
    -not -name "\.DS_Store" -and \
    -not -name "\.gitignore" -and \
    -not -name "\.gitmodules" -and \
    -not -name "*\.dmg" -and \
    -not -name "*\.swp" -and \
    -not -name "*\.md" -and \
    -not -name "\.git" -and \
    -not -name "*~*" \
    -not -name "\." \
    -exec basename {} \;`
    echo "$T_FILES"
############################  BASIC SETUP TOOLS



ll_dotfiles_dir() { ls -1 ./.* | wc -l; }
dir_DOTFILES=$(cd ~;ls .*)
src=$HOME/zdotfiles/link
BKUP=$HOME/bkup



msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
    msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}



lnif()
 {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
}


zlink_f() {
    zlink=$HOME/zdotfiles/link
    for f in $T_FILES; do 
       lnif "$zlink/$f" "$HOME/$f"
    done
	ls -al | grep "<\|>"
} 

        #-h)  ;;
	#-l) zdotfiles_link ;;
        
case $1 in
	-r) z_restore;;
        -c) zcheck ;;
	-l) zlink_f ;;
esac
# TODO : -c;-r