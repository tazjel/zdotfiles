#!/usr/bin/env bash




############################  NAMES SETUP
#export LANG=en_US.UTF-8 && bash % -i

zdotfiles=$HOME/zdotfiles
LINKS=$HOME/zdotfiles/link
vim_spf13_endpath="$HOME/.spf13-vim-3"

REAL_USER_NAME=`logname`
HOME_DIRECTORY=`getent passwd $REAL_USER_NAME | cut -d: -f6`
dir_DOTFILES=$(cd ~;ls .*)
src=$HOME/zdotfiles/link
BKUP=$HOME/bkupg


XXP=$(find $HOME -maxdepth 1)

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
#for FF in $(echo $XXP) ; do if [ -L $FF ] ; then echo -e ">>>>>> $FF ]]" ; else echo -e "$FF" ;fi;done
#for FF in $(find $HOME -maxdepth 1 -exec basename {} \;) ; do if [ -L $FF ] ; then echo -e "0 = $FF" ;else echo "1= $FF";fi;done
XXP=$(find $HOME -maxdepth 1)
############################  BASIC SETUP TOOLS

msg() {
    printf '%b\n' "$1" >&2
}

    #if [ "$ret" -eq '0' ]; then
success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
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


#####################################################
# F0
#
####################################################




z_install_zkeys() {
    sudo apt-get install -y aptitude \
        dos2unix
}


z_install_basic() {
    sudo apt-get install -y aptitude \
        git git-core \
        mercurial \
        vim \
        zsh \
        vim \
        xclip \
        curl \
        wget \
        md5deep
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


z_un_link_HOME() {
    for FF in $(find $HOME -maxdepth 1) ; do
        if [ -L $FF ] ; then
            success " $FF" && unlink $FF ;else
            error "1= $FF"
        fi;done
}


count_home_dotfiles() {

        echo ">>> ls -1 .* | wc -l; >>> =$(ls -1 .* | wc -l;)"
        echo ">>> ls -1 ./. | wc -l;  >>> =$(ls -1 ./. | wc -l; )"
        echo ">>> ls -1 .* | wc -l; >>> =$(ls -1 .* | wc -l;)"
        echo ">>> ls -1 * | wc -l; >>> =$(ls -1 * | wc -l;)"
        echo ">>> ls -1 .* | wc -l; >>> =$(ls -1 .* | wc -l;)"
 }


#####################################################
#
#
####################################################

success "ls -al | grep ">" | wc -l"

case $1 in
    -i) z_install_basic ;;
    -r) z_restore ;;
    -c) z_check_f ;;
    -l) z_link_f ;;
    -L) z_un_link_HOME ;;
esac
