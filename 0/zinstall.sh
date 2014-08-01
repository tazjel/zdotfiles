#!/usr/bin/env bash

app_name='zdotfiles'
git_uri='https://github.com/tazjel/zdotfiles.git'
git_branch='master'
debug_mode='0'
fork_maintainer='0'

############################  BASIC SETUP TOOLS
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

# Detect distribution
if [ "$(uname -s)" == "Darwin" ]; then
    IS_OSX=true
else
    IS_OSX=false
fi

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

COMMON_PACKAGES="git git-extras legit jnettop hfsutils unrar subversion ack colordiff faac flac
lame x264 inkscape graphviz qemu lftp shntool testdisk fdupes recode pngcrush exiftool rtmpdump
optipng colortail mercurial grc coreutils bzr htop apg fontforge"

BIN_PACKAGES="audacity avidemux firefox gimp inkscape vlc blender thunderbird virtualbox
bitcoin-qt wireshark prey"

zbasic() {
    sudo apt-get install zsh curl vim ranger;
    }

z_zsh() {
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    
}


