#!/bin/sh
#
#
############################  BASIC SETUP TOOLS


REAL_USER_NAME=`logname`
if [ "$REAL_USER_NAME" == ""  ] ; then
        echo
        echo "ERROR: Can not find out your real username, please give your real username as the first argument for the script." 
        echo
        exit
fi

HOME_DIRECTORY=`getent passwd $REAL_USER_NAME | cut -d: -f6`


zdotfiles=$HOME/zdotfiles


T_FILES=`find . -maxdepth 1 \
    -not -name "assets" -and \
    -not -name "scripts" -and \
    -not -name "install.sh" -and \
    -not -name "\.DS_Store" -and \
    -not -name "\.gitignore" -and \
    -not -name "\.gitmodules" -and \
    -not -name "*\.dmg" -and \
    -not -name "*\.swp" -and \
    -not -name "*\.md" -and \
    -not -name "\.git" -and \
    -not -name "*~*" \
    -not -name "\." \
    -exec basename {} \;`

x_bkup() {
for f in $DOT_FILES
do
    source="${PWD}/$f"
    target="${HOME}/$f"
    #if [ "$1" = "restore" ]; then
        # Restore backups if found
    if [ -e "${target}_bkup" ] && [ -L "${target}" ]; then
            unlink "${target}"
            mv "$target.dotfile.bak" "$target"
        fi
    else
        # Link files
        if [ -e "${target}" ] && [ ! -L "${target}" ]; then
            mv "$target" "$target.dotfile.bak"
        fi
        # TODO: fix recursive symlinks
        ln -sf "${source}" "${target}"
    fi
done
}



ll_dotfiles_dir() { ls -1 ./.* | wc -l; }
dir_DOTFILES=$(cd ~;ls .*)
src=$HOME/zdotfiles/link
BKUP=$HOME/bkup



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


usage()
{
cat << EOF
usage: $0 options

This script make and install Blender

OPTIONS:
   -h      Show this message
   -m      Make Blender (not only install the files)
   -c      Install
   -n      Not install
   -i      Install all
   -j      Number of Jobs, default is $numjobs
   -r      Blender Release, default is $version
   -b      Blender home folder, default is $blender
   -v      Verbose
EOF
}


zbkup() { 
	for i in $dir_DOTFILES ; do 
        [ -e "$i" ] && [ ! -L "$i" ] && mv "$i" "$(echo $i | sed 's/\(\/home\/\(.*\)\/\(.*\)/\1\/\2\/bkup\/\3_BKUP/')";
    done
        success "Done!"
        ret="$?"
        $success "$1"
        debug
	unset i
}


z_restore() {
    for i in $HOME/bkup/.*; do 
        [ -e "$i" ] && mv "$i" "$(echo $i | sed 's/\(\/home\)\/\(.*\)\/\(.*\)_bkup\/\(.*\)/\1\/\2\3/')";
    done
        ret="$?"
        success "$1"
        debug
}


############################ SETUP FUNCTIONS


lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}


check_zdotfiles_dir() {

	if [ -d /home/w/zdotfiles ]; then
    		success "zdotfiles is available"
	    	else
			error "No zdotfilesc"
	fi
}


check_bkup_dir() {
	if [ -d $HOME/bkup ]; then
    	mkdir -p $HOME/bkup
    	success "mkdir $HOME/bkup"
    	BKUP=$HOME/bkup
	fi
}


do_backup() {
    today=`date +%Y%m%d_%s`
        #[ -e "$i" ] && [ ! -L "$i" ] && mv "$i" "$BKUP/$i.$today";
	zbkup
        success "Moved $i to "
        ret="$?"
        success "$1"
        debug
}



#for i in $HOME/.*; do #[ -e "$i" ] && [ ! -L "$i" ] && mv "$i" "$(echo $i | sed 's/\(\/home\/w\)\/\(.*\)/\1\/bkbp\/\2_BKUP/')"; #done




#  [ -x "$f" ] && echo "$f"

zdotfiles_link() {
    if [ -d $src ]; then
        for f in $src; do
		# TODO:TEST  
		lnif $dest/$f $src/$f	
        done
    fi
    unset f
}




case $1 in
	-r) z_restore "Restored your back-up ";;
        -l) zdotfiles_link ;;
        -c) zcheck;;
	-b) zbkup && "Done : Back-up ";;
        -h) usage;;

esac

echo "#<<<<<<<<<<<<"; echo "#===========#"

