#!/bin/zsh
success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}


wwwwW()
{
    pygmentize $1 | less -N
}




les() {  echo "ls -a"; ls -a "$1" | wc -l; echo  "ls -A";  ls -A | wc -l }
#alias 'w'='clear;ls -X;pwd;echo -e "\t\t\t$(date)"'
#

w() {
    clear
    success "$(find $HOME -maxdepth 7)"
    msg "Symlink" && ls -al | grep ">" | wc -l
}


set_xkeyboard() {
    if [[ $(uname) = "Linux" ]];then
        #easystroke show
        setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
        setxkbmap -option ctrl:nocaps
    fi
}

set_xkeyboard

alias "ww"="vim"
alias 'W'='echo'
alias 'wW'='ls -RlhFAa | egrep ">" | wc -l'
alias 'wi'='sudo apt-get install'
alias 'www'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'
alias 'wwww'='cat'
alias 'wwwww'='alias'
