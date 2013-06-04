#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
[[ ! -z "${BASH_ARGC}${BASH_ARGV}" ]] && ISINCLUDED=yes || ISINCLUDED=no
[[ -z "$PS3" ]] && [[ "$ISINCLUDED" == "no" ]] && return # dont do anything for non-interactive shells
[[ $- != *v* && $- != *x* ]] && set +C +f +H +v +x +n -h -i -m -B
ulimit -S -c 0 # Don't want any coredumps
shopt -s histappend histreedit histverify cmdhist extglob dotglob checkwinsize cdable_vars checkhash promptvars
umask 0022

export N6=/dev/null

EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
 
three () {
    while true
    do
        PS3="Enter a number: "; cd $HOME; select f in *;do echo "\n <b> $(echo $f) </b>"; break; done && break
    done
        pause
}

wcmdfu(){ local TCF="/var/tmp/cmdfu"; echo "  Searching..."; curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent > "$TCF"; vim -c "set filetype=sh" -RM "$TCF"; rm "$TCF"; }
one(){
    while true
    do
        echo "Enter :       -> Enter"
        read fn
        wcmdfu $fn && break
    done
        pause
}

show_menus() {
		clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " بسم الله الرحمن الرحيم"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. dmesg & edit"
	echo "2. lsusb"
	echo "3. List Files"
	echo "4. Exit"
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " بسم الله الرحمن الرحيم"
	echo "~~~~~~~~~~~~~~~~~~~~~"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 3] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		4) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 1
	esac
}
 
# ----------------------------------------------
#d Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
#trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	show_menus
	read_options
done


