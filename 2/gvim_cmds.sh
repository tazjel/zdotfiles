# commandlinefu.com by David Winterbottom

# quit gvim remotely
gvim --remote-send ":q!<CR>"

# Edit all different files from 2 directories with gvim in difference mode (gvim -d)
LC_ALL=C diff -q dir1 dir2 | grep differ | awk '{ print $2, $4 }' | xargs -n 2 gvim --nofork -d

# Ignore ~/.vimrc when startup gVim
gvim -u NONE -U NONE

# archlinux: shows list of files installed by a package
pacman -Ql gvim

# gvim in full screen (execute again to toggle full screen on/off)
:exe "!wmctrl -r ".v:servername." -b toggle,fullscreen"

# chain search and replace special characters to html entities in gvim
%s/?/\&iuml;/ge | %s/?/\&#0233;/ge | %s/?/"/ge | %s/?/"/ge | %s/?/'/ge | %s/?/'/ge | %s/?/\&ecirc;/ge | %s/?/\&#0133;/ge | %s/?/\&#232;/ge | %s/?/\&#243;/ge | %s/?/\&ouml;/ge | %s/?/\&#0233;/ge | %s/?/\&ndash;/ge | %s/?/\&mdash;/ge

# Define dettaching commands in bashrc
__disown(){ local cmd=$1 ; shift ; $cmd "$@" &> /dev/null &disown }; for i in gvim ; do alias $i="__disown $i"; done

# Find all files currently open in Vim and/or gVim
vim -r 2>&1 | grep '\.sw.' -A 5 | grep 'still running' -B 5

