#!/bin/zsh



success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}


wwww() { pygmentize $1 | less -N }



w()
{
    clear
    success "$(find .-maxdepth 1)"
    #success "$(HERE)"
    success "$(ls -al | grep '>' | wc -l)" }

setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
setxkbmap -option ctrl:nocaps


alias "ww"="vim"
alias 'W'='echo'
alias 'wW'='ls -RlhFAa | egrep ">" | wc -l'
alias 'wi'='sudo apt-get install'
alias 'www'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'
alias 'wwwww'='alias'
