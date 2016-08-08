#!/usr/bin/env bash

alias ww_apt_update_and_upgrade="sudo apt-get update && sudo apt-get upgrade"
alias ww_apt_install="sudo apt-get install"
alias 'W'='echo'
alias 'WW_'='sudo'
alias 'w'='clear;ls -al;pwd;date'
alias 'ww'='vim'
alias 'wwww'='cat'
alias www="ranger"
alias WWWWWWW_reboot='sudo reboot -n'
# wi git zsh vim wget curl
# git clone https://github.com/tazjel/zdotfiles.git
alias "wh"="history > $HOME/history_dotfile; vim $HOME/history_dotfile"
alias WW_ww_vim_aliases="vim ~/.bash_aliases"

function WW_add_new_alias {
    zal="~/.bash_aliases"
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $zal
    source $zal

    echo "" >> $zal
    tail $zal
}

alias wweb2py='python /home/www-data/web2py/web2py.py -S sas'

alias WW_web2py_Quran='python /home/www-data/web2py/web2py.py -S quran'
alias ww_web2py_application='python /home/www-data/web2py/web2py.py -S'
alias ww_ranger_www_quran='ranger /home/www-data/web2py/applications/quran/controllers'
