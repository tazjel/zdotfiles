#!/usr/bin/env sh
#  3

########################################
endpath="$HOME/zdotfiles"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
    if [ -L $2 ] ; then
        ln -sf $1 $2
    fi
}

########################################
echo "Thanks for installing zdotfiles"

 #Backup existing .vim stuff
echo "backing up current vim config"
########################################
today=`date +%Y%m%d`

for i in $HOME/.vimrc.local $HOME/.zshrc $HOME/.oh-my-zsh/lib/aliases.zsh $HOME/.vimrc.localw $HOME/.bash_aliases $HOME/.zshenv; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done


########################################
if [ ! -e $endpath/.git ]; then
    echo "clone zdotfiles "
    git clone --recursive http://github.com/tazjel/zdotfiles.git $endpath
else
    echo "updating tazjel - zdotfiles"
    cd $endpath && git pull
fi


########################################
echo "setting up spf13"
git clone --recursive -b 3.0-new http://github.com/taxilian/spf13-vim.git $endpath

########################################
echo "setting up oh-my-zsh"

wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
########################################
echo "setting up symlinks"
########################################

########################################

# vimrc.local 
########################################
lnif $endpath/.vimrc.localw $HOME/.vimrc.localw
lnif $endpath/.vimrc.local $HOME/.vimrc.local



# zshrc, aliases.zsh
########################################
lnif $endpath/.zshrc $HOME/.zshrc
lnif $endpath/.oh-my-zsh/lib/aliases.zsh $HOME/.oh-my-zsh/lib/aliases.zsh

### bashrc
lnif $endpath/.bashrc $HOME/.bashrc
lnif $endpath/.bash_aliases  $HOME/.bash_aliases
lnif $endpath/.bash_profile  $HOME/.bash_profile

# profile
########################################
lnif $endpath/.profile  $HOME/.profile
########################################

########################################
if [ ! -d $endpath/.vim/bundle ]; then
    mkdir -p $endpath/.vim/bundle
fi

if [ ! -e $HOME/.vim/bundle/vundle ]; then
    echo "Installing Vundle"
    git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

########################################

echo "update/install plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $endpath/.vimrc.bundles +BundleInstall! +BundleClean +qall
export SHELL=$system_shell
