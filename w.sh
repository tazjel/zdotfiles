#!/usr/bin/env bash




############################  NAMES SETUP

zdotfiles=$HOME/zdotfiles
LINKS=$HOME/zdotfiles/link
REAL_USER_NAME=`logname`
HOME_DIRECTORY=`getent passwd $REAL_USER_NAME | cut -d: -f6`



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

############################  SETUP PARAMETERS

wi_basic(){
    sudo apt-get install -y vim zsh xclip git-core openssh-server curl wget
aptitude mercurial
}


############################  BASIC SETUP TOOLS

count_home_dotfiles() { 
echo ">>> ls -1 .* | wc -l; >>> =$(ls -1 .* | wc -l;)"
echo ">>> ls -1 ./. | wc -l;  >>> =$(ls -1 ./. | wc -l; )"
echo ">>> ls -1 .* | wc -l; >>> =$(ls -1 .* | wc -l;)"
echo ">>> ls -1 * | wc -l; >>> =$(ls -1 * | wc -l;)"
echo ">>> ls -1 .* | wc -l; >>> =$(ls -1 .* | wc -l;)"

 }

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


z_install_basic() {
    sudo apt-get install -y \ 
	aptitude
	git
	vim
	zsh
}


z_link_f() {
    zlink=$HOME/zdotfiles/link
    for f in $T_FILES; do
       lnif "$zlink/$f" "$HOME/$f"
    done
}



z_clear_all_symlinks() {
    zlink=$HOME/zdotfiles/link
    for f in $HOME; do
       unlink "$HOME/$f"
    done
}


z_un_link_f() {
    zlink=$HOME/zdotfiles/link
    for f in $T_FILES; do
       unlink "$HOME/$f"
    done
}


case $1 in
    -i) wi ;;
    -r) z_restore ;;
    -c) zcheck ;;
    -l) z_link_f ;;
    -L) z_un_link_f ;;
esac
