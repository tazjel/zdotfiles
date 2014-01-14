#!/usr/bin/env bash
############################  SETUP PARAMETERS
app_name='spf13-vim'
git_uri='https://github.com/spf13/spf13-vim.git'
git_branch='3.0'
debug_mode='0'
fork_maintainer='0'

############################  NAMES SETUP

#####

zdotfiles=$HOME/zdotfiles
LINKS=$HOME/zdotfiles/link
vim_spf13_endpath="$HOME/.spf13-vim-3"

REAL_USER_NAME=`logname`
HOME_DIRECTORY=`getent passwd $REAL_USER_NAME | cut -d: -f6`
dir_DOTFILES=$(cd ~;find . -type l)
src=$HOME/zdotfiles/link
BKUP=$HOME/bkup


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





z_install_basic() {
    sudo apt-get install -y aptitude \
        git git-core git-gui git-doc \
        mercurial \
        vim \
        zsh \
        vim \
        xclip \
        curl \
        wget \
        dos2unix \
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
        if [ -e $FF ] && [ -L $FF ] ; then
            success " $FF" && unlink $FF
        else
            error "1= $FF"
        fi;done
}

z_hi(){
    success " \r
        -i) z_install_basic ;;
        -r) z_restore ;;
        -c) z_check_f ;;
        -l) z_link_f ;;
        -L) z_un_link_HOME ;;"
}
usage() {
    echo `basename $0`: ERROR: $* 1>&2
    echo usage: `basename $0` '[-a] [-b] [-c]
        [file ...]' 1>&2
    exit 1
}

z_clear_all_symlinks() {
    rm ~/.bashrc
    rm ~/.zshrc
    rm ~/.vimrc
    rm ~/.vimrc.local
    rm ~/.vim
    rm ~/.vim.*
}

ssh-keygen_rsa() {
    ssh-keygen -t rsa -C 'tazjel@gmail.com'
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com
}

git_clone() {
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
}

z__user(){
    read email
    read email2
    read phone
    read name
    read Keys_A
    read Keys_B
    read address
}


z_install_git() {
    echo ">>> your e-mail address ?"
    read email
    echo ">>> Generating SSH key..."
    echo ">>> Please write down the name of file with the path to that directory..."
    ssh-keygen -t rsa -C "$email"
    success "Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer"
    sudo apt-get install xclip

    # Copies the contents of the id_rsa.pub file to your clipboard
    xclip -sel clip < ~/.ssh/id_rsa.pub
    echo ">>> Now, go to your specified directory and open SSH key file,"
    echo ">>> Copy everyting inside and paste to SSH Keys part of your github account..."
    echo ">>> When you done that press any key to continue..."
    success "Go to : https://github.com/settings/ssh"

    read -t 5000
    echo ">>> Lets check if everything is OK..."
    ssh -T git@github.com

    echo ">>> Please give your name & surname..."
    read name_and_surname

    git config --global user.name "$name_and_surname"
    git config --global user.email "$email"

    echo ">>> THE END"
}

z__now() {
    NOW=$(date +"%a")
    case $NOW in
    Mon)
        echo "Full backup";;
    Tue|Wed|Thu|Fri)
        echo "Partial backup";;
    Sat|Sun)
        echo "No backup";;
    *) ;;
esac
}


z_install_vimrc(){
    endpath="$HOME/.$app_name-3"
    lnif "$endpath/.vimrc"              "$HOME/.vimrc"
    lnif "$endpath/.vimrc.bundles"      "$HOME/.vimrc.bundles"
    lnif "$endpath/.vimrc.before"       "$HOME/.vimrc.before"
    lnif "$endpath/.vim"                "$HOME/.vim"

    # Useful for fork maintainers
    lnif "$LINKS/.vimrc.local" "$HOME/.vimrc.local"
    # Useful for fork maintainers
    lnif "$LINKS/.vimrc.local" "$HOME/.vimrc.local"
}


z_symlink_easystroke () {
    #if [[ -d $HOME/.easystroke ]]; then
        #sudo rm -rf "$HOME/.easystroke/actions-0.5.6" && success "removed "
        #sudo rm -rf "$HOME/.easystroke/actions-0.5.6" && success "removed "
        #sudo rm -rf "$HOME/.easystroke" && success "removed "
        #sudo mkdir "$HOME/.easystroke" && success "removed "

        lnif "$HOME/zdotfiles/link/.easystroke/actions-0.5.6" "$HOME/.easystroke/actions-0.5.6" && success "A"
        lnif "$HOME/zdotfiles/link/.easystroke/preferences-0.5.5" "$HOME/.easystroke/actions-0.5.6" && success "B"
        #sudo chown -R w:w "$HOME/.easystroke" && success "removed"
        #sudo w -R w:w "$HOME/.easystroke" && success "removed "
        #success "symlink"
    #else
        #mkdir "$HOME/.easystroke" && success "removed "
        #lnif "$HOME/zdotfiles/link/.easystroke/actions-0.5.6" "$HOME/.easystroke/actions-0.5.6" && success "removed "
        #lnif "$HOME/zdotfiles/link/.easystroke/preferences-0.5.5" "$HOME/.easystroke/actions-0.5.6" && success "removed "
        #success "symlink "
    #fi
}


z__install_spf() {
    . /home/w/zdotfiles/0/spf3-new.sh
}



while :
do
case $1 in
        i|-i) z_install_basic ;;
        -r) z_restore ;;
        -c) z_check_f ;;
        -l) z_link_f ;;
        -e) z_symlink_easystroke ;;
        -L) z_un_link_HOME ;;
        -g) z_install_git ;;
        s|-s) z_install_spf ;;
        -*) error "bad argument $1";;
        *) break;;
esac
shift
done
