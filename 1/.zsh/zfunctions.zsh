#!/bin/zsh



set_xkeyboard() {
    if [[ $(uname) = "Linux" ]];then
        #easystroke show
        setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
        setxkbmap -option ctrl:nocaps
    fi
}

set_xkeyboard
