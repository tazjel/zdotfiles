# Terminal colors
        RED="\[\033[0;31m\]"
     ORANGE="\[\033[0;33m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Basic environment
export PS1="${BLUE}\h:\W \$${COLOR_NONE} "
# If not running interactively, don't do anything

export TZ=Asia/Riyadh

[ -z "$PS1" ] && return
function ranger-cd {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
bind '"\C-o":"ranger-cd\C-m"'

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# dircolors --print-database uses its own built-in database
[ $BASH ] && [ -f /etc/bash_completion ] && source /etc/bash_completion
[ $BASH ] && [ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export LESS="-R"

alias 'W'='echo'
alias 'w'='clear;ls -al;pwd;date'
alias 'wi'='sudo apt-get install'
alias 'www'='vim'
alias 'wwww'='cat'
# wi git zsh vim wget curl
# git clone https://github.com/tazjel/zdotfiles.git
alias "wh"="history > $HOME/history_dotfile; vim $HOME/history_dotfile"

source $HOME/zdotfiles/1/.zsh/al.zsh
# source $HOME/zdotfiles/1/.zsh/checks.zsh
# source $HOME/zdotfiles/1/.zsh/colors.zsh
# # sourfiles="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf 
Xresources" 
# 
list of files/folders to symlink in homedirce 
$HOME/zdotfiles/1/.zsh/completion.zsh
# # source $HOME/zdotfiles/1/.zsh/exports.zsh
# # source $HOME/zdotfiles/1/.zsh/functions.zsh
# # source $HOME/zdotfiles/1/.zsh/history.zsh
# # source $HOME/zdotfiles/1/.zsh/prompt.zsh
# # source $HOME/zdotfiles/1/.zsh/setopt.zsh
# # source $HOME/zdotfiles/1/.zsh/zsh_hooks.zsh
# 
# source $HOME/zdotfiles/1/.zsh/arabic_alias.zsh
# source $HOME/zdotfiles/1/z_arabic.sh
# 
# source $HOME/zdotfiles/1/.zsh/config
# 