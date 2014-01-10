#!/usr/bin/env bash
app_name='zdotfiles'
git_uri='https://github.com/tazjel/zdotfiles.git'
git_branch='master'
debug_mode='0'
fork_maintainer='0'


 #uname --help     display this help and exit

    #-s, --kernel-name        print the kernel name
      #-n, --nodename           print the network node hostname
      #-r, --kernel-release     print the kernel release
      #-v, --kernel-version     print the kernel version
      #-m, --machine            print the machine hardware name
      #-p, --processor          print the processor type or "unknown"
      #-i, --hardware-platform  print the hardware platform or "unknown"
      #-o, --operating-system   print the operating system

zos=`uname`
is_Linux () {
    if [[ ${zos} == "Linux" ]];then
        sudo apt-get install -y vim zsh konsole xclip git-core openssh-server curl wget vim-gnome aptitude mercurial
        else
            echo "Not Linux"
    fi
}


echo "Done "


dpkg --get-selections > packages-alpha.txt


# Obtain "kernel" name
KERNEL=$(uname -s)

if      [ $KERNEL = "Darwin" ]; then
        KERNEL=mac
elif        [ $Nucleo = "Linux" ]; then
        KERNEL=linux
elif        [ $Nucleo = "FreeBSD" ]; then
        KERNEL=linux
else
        echo "Unsupported OS"
fi


# Call distribution specific scripts
if $IS_OSX; then
    source ./scripts/osx-install.sh
    source ./scripts/osx-config.sh
else
    source ./scripts/ubuntu-install.sh
    source ./scripts/ubuntu-config.sh
fi




#####################################################
#
#
####################################################
#

files=".vim .vimrc .zshrc .gitconfig .tmux.conf .lynxrc .tmuxinator"

for file in $HOME/$files
do
if [ -L $HOME/$file ]; then
    unlink $HOME/$file
fi
done
#ln -s $HOME/.dotfiles/$file $HOME
