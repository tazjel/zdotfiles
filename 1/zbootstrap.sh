#!/usr/bin/env bash

# ###########################  SETUP PARAMETERS
    app_name='spf13-vim'
    git_uri='https://github.com/spf13/spf13-vim.git'
    git_branch='3.0'
    debug_mode='0'
    fork_maintainer='0'
############################  BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

#msg "Conflict Analysis & Resolution"

msg "\e[31m[✘]\e[0m abobani@gmail.com"
msg "\e[32m[✔]\e[0m Conflict Analysis & Resolution"
success() {
    if [ "$ret" -eq '0' ]; then
    msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}
error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}
debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
      msg "An error occured in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}
program_exists() {
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
    error "$2"
    fi
}
############################ SETUP FUNCTIONS
lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}
do_backup() {
    if [ -e "$2" ] || [ -e "$3" ] || [ -e "$4" ]; then
        today=`date +%Y%m%d_%s`
        for i in "$2" "$3" "$4"; do
            [ -e "$i" ] && [ ! -L "$i" ] && mv "$i" "$i.$today";
        done
        ret="$?"
        success "$1"
        debug
   fi
}
upgrade_repo() {
    msg "trying to update $1"

    if [ "$1" = "$app_name" ]; then
        cd "$HOME/.$app_name-3" &&
        git pull origin "$git_branch"
    fi

    if [ "$1" = "vundle" ]; then
        cd "$HOME/.vim/bundle/vundle" &&
        git pull origin master
    fi

    ret="$?"
    success "$2"
    debug
}
clone_repo() {
    program_exists "git" "Sorry, we cannot continue without GIT, please install it first."
    endpath="$HOME/.$app_name-3"

    if [ ! -e "$endpath/.git" ]; then
        git clone --recursive -b "$git_branch" "$git_uri" "$endpath"
        ret="$?"
        success "$1"
        debug
    else
        upgrade_repo "$app_name"    "Successfully updated $app_name"
    fi
}
clone_vundle() {
    if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
        git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
    else
        upgrade_repo "vundle"   "Successfully updated vundle"
    fi
    ret="$?"
    success "$1"
    debug
}
create_symlinks() {
    endpath="$HOME/.$app_name-3"

    lnif "$endpath/.vimrc"              "$HOME/.vimrc"
    lnif "$endpath/.vimrc.bundles"      "$HOME/.vimrc.bundles"
    lnif "$endpath/.vim"                "$HOME/.vim"

    # Useful for fork maintainers
    touch  "$HOME/.vimrc.local"

    if [ -e "$endpath/.vimrc.fork" ]; then
        ln -sf "$endpath/.vimrc.fork" "$HOME/.vimrc.fork"
    elif [ "$fork_maintainer" -eq '1' ]; then
       touch "$HOME/.vimrc.fork"
       touch "$HOME/.vimrc.bundles.fork"
    fi

    if [ -e "$endpath/.vimrc.bundles.fork" ]; then
        ln -sf "$endpath/.vimrc.bundles.fork" "$HOME/.vimrc.bundles.fork"
    fi

    if [ ! -d "$endpath/.vim/bundle" ]; then
        mkdir -p "$endpath/.vim/bundle"
    fi

    ret="$?"
    success "$1"
    debug
}
setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'
    vim -u "$HOME/.vimrc.bundles" +BundleInstall! +BundleClean +qall
    export SHELL="$system_shell"

    success "$1"
    debug
}
install_essentials () {
    sudo apt-get install -y vim zsh konsole xclip git-core openssh-server curl wget vim-gnome aptitude mercurial inkscape automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
}
set_timezone() {
    echo 'Etc/UTC' | tee /etc/timezone; dpkg-reconfigure --frontend noninteractive tzdata
}
install_ubuntu_restricted-extras() {
    sudo apt-get install -y ubuntu-restricted-extras
}
my_ip() {
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}
info_host() {
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Local IP Address :$NC" ; my_ip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo
}
git_config_global() {
    git config --global user.name 'Ahmed Al-Ghamdi'
    git config --global user.email 'tazjel@gmail.com'
    git config --list
    git config --global color.ui auto
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=3600'
    }

ssh-keygen_rsa() {
    ssh-keygen -t rsa -C 'tazjel@gmail.com'

    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com
    }

git_clone_zdotfiles() {
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
    }

sixad_profile() {
    ff_profiles ='/usr/share/qtsixa/profiles'
    ff_sixad ='/etc/sixad'
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default
}
install_full_kde() {
    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt-get update
    sudo apt-get -y install kubuntu-full
}
github-setup() {
    echo ">>> Starting..."

    echo ">>> Installing git..."
    sudo apt-get install -y git-core git-gui git-doc
    echo ">>> Git was installed..."

    echo ">>> Please give me your e-mail address..."
    read email
    echo ">>> Generating SSH key..."
    echo ">>> Please write down the name of file with the path to that directory..."
    ssh-keygen -t rsa -C "$email"

    echo ">>> Now, go to your specified directory and open SSH key file,"
    echo ">>> Copy everyting inside and paste to SSH Keys part of your github account..."
    echo ">>> When you done that press any key to continue..."
    read -t 5000

    echo ">>> Lets check if everything is OK..."
    ssh -T git@github.com

    echo ">>> Please give your name & surname..."
    read name_and_surname

    git config --global user.name "$name_and_surname"
    git config --global user.email "$email"

    echo ">>> THE END"
    exit 0
}
############################ MAIN()

First_Dimension() {
 echo 'w'
}
Second_Dimension() {
    program_exists "vim" "To install $app_name you first need to install Vim."

    do_backup   "Your old vim stuff has a suffix now and looks like .vim.`date +%Y%m%d%S`" \
            "$HOME/.vim" \
            "$HOME/.vimrc" \
            "$HOME/.gvimrc"

    clone_repo      "Successfully cloned $app_name"

    create_symlinks "Setting up vim symlinks"

    clone_vundle    "Successfully cloned vundle"

    setup_vundle    "Now updating/installing plugins using Vundle"

    msg             "\nThanks for installing $app_name."
    msg             "© `date +%Y` http://vim.spf13.com/"
}
