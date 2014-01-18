#!/bin/zsh



success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}


wwww() { pygmentize $1 | less -N }



w()
{
    clear
    DHOME=$(find ~/ -type l)
    success "Symlinks at HOME = " "$(find ~/ -type l | wc -l)"

    ZSRC=$(find ~/zdotfiles/link)
    success "Dotfiles at zdotfiles/link = " "$(find ~/zdotfiles/link | wc -l )"
}
    #success "$(find ~/ -maxdepth 1 \
        #-not -name "rc" -and  \
        #-not -name "rc" -and \
        #-not -name "rc" -and \
        #-not -name "rc" -and \
        #-not -name "rc" -and \
        #-exec basename {} \;) \|sh\|rc' | wc -l )" }
#find . -type f -and -iregex '.*\.txt$' -and -print0 -exec grep --color=always -Hn "$1" {} \;

setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
setxkbmap -option ctrl:nocaps


alias "ww"="vim"
alias 'W'='echo'
alias 'wW'='ls -RlhFAa | egrep ">" | wc -l'
alias 'wi'='sudo apt-get install'
alias 'www'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'
alias 'wwwww'='alias'
export LC_ALL=en_US.UTF-8
