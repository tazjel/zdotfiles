#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
        for f in /etc/X11/xinit/xinitrc.d/*; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

# Here xfce is kept as default
case $1 in
        gnome) exec gnome-session;;
        kde) exec startkde;;
        xfce) exec startxfce4r;;
        kde);;
        *) exec startkde;;
esac
