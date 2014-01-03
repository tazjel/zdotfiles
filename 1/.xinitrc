#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)



zdotfiles_link() {

if [ -d $HOME/zdotfiles/link ]; then
        for f in $HOME/zdotfiles/link/.*; do
                [ -x "$f" ] && echo "$f"
        done
        unset f
fi
}



# Here xfce is kept as default
case $1 in
        gnome) exec zdotfiles_link;;
        kde) exec startkde;;
        xfce);;
        *) exec startxfce4;;
esac
