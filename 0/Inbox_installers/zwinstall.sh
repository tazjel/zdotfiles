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
 


##During development on a linux system, you probably install many packages using your favorite package manager. When you have to use a new system, or reimage your current one, it can be a pain to remember all the packages you had setup. One solution is to keep a list of the packages installed after the OS load, and then periodically generate a list of what has been added since.

##On a freshly installed system, create the starting baseline list of packages:

# On Debian based systems(Ubuntu):
# You can run the command again at a later time, concatenating the output into a different file so you can view what has changed since the original system setup. Use a diff tool like diff3, vimdiff, or meld:

# meld packages-alpha.txt packages-omega.txt

# On Debian systems, once you have that file you can use it in a new or different system to mark packages to install using the –set-selection parameter: dpkg --set-selections < packages-omega.txt
sudo apt-get upgrade

