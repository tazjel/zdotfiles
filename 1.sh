#!/bin/bash

#!/usr/bin/env bash
############################  SETUP PARAMETERS
app_name='zdotfiles'
git_uri='https://github.com/tazjel/zdotfiles.git'
git_branch='master'
debug_mode='0'
fork_maintainer='0'

############################  BASIC SETUP TOOLS
# Define variables
# ----------------------------------

References_add() {
    Ref=~/Dropbox/DCAR/snippets/Refe.txt
    read -p "Enter Author : " n1
    read -p "Enter  DATE : " n2
    read -p "Enter Link : " n3
    read -p "Enter Title : " n4
    read -p "Enter Host : " n5
    #read -p "Enter Link : " n6
    echo "$n1. ($n2).$n4 . $n5,. Retrieved from
    $n3" >> $Ref
    #~/Dropbox/DCAR/snippets/Refe.txt
    cat $Ref
    pause
    #echo "Number3 - $n3"
}
znotify() {
    play ~/zdotfiles/References/notify.mp3
}
cmdfu() {
    # Search commandlinefu
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R -
}

pause(){
    local m="$@"
    echo "$m"
    read -p "Press [Enter] key to continue..." key
}

msg() {
    printf '%b\n' "$1" >&2
}

#pause() { read -p "Press [Enter] key to continue..." fackEnterKey }

F1() {
    while true; do
        echo "Update...Upgrade...Clean..."
        #pause "$(date)";;
        #zapt_clean
        echo ""  && break
    done
        pause "$(date)"
        start_GUI
}


zapt_clean() {
    sudo apt-get -f install && sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean && sudo apt-get autoremove
}

zapt_list_installed_packages() {
     # Quick list of installed packages on deb based system
    apt-cache -n dumpavail | grep 'Package:' | awk '{print $2 }'
}

wone() {
    while true
    do
        echo "Search [[commandlinefu]]:"
        read fn
        cmdfu $fn && break
    done
    echo "Do you want to tag this search words ?"
    read tags_fn
    echo -e "# $tags_fn \n$fn" >> ~/zdotfiles/.workflow/tags_fn && tail ~/zdotfiles/.workflow/tags_fn;
    pause
}

Fourth() {
    while true
    do
        echo "Search history:"
        local his
        read -p "Now:" his
        grep_zsh_history $his | vim - && break
    done
       pause
       start_GUI
}

w() {
    while true
    do
        show_menu_two
        menu_read_options_two && break
    done
        pause
        start_GUI
}

three() {
    while true
    do
        vim ~/zdotfiles/1.sh & break
    done
        pause
        start_GUI
}

3_read_options() {
    echo "3"
}

2_show_menus() {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "[[MENU two ]]"
    echo "1. Edit 1.sh"
    echo "2. lsusb"
    echo "3. List Files"
    echo "4. List Files"
    echo "5. List Files"
    echo "6. Six : search "
    echo "7. List Files"
    echo "8. List Files"
    echo "9. List Files"
    echo "0. Exit"
}

show_menus() {
    clear
    echo "                            بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " M A I N - M E N U"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "1. First Diamintion :Search commandlinefu"
    echo "2. Second Diamintion"
    echo "3. Third Diamintion"
    echo "4. Fourth Diamintion"
    echo "5. Fifth Diamintion"
    echo "6. Sixth Diamintion "
    echo "7. Seventh Diamintion"
    echo "8. Eighth Diamintion"
    echo "9. Ninth Diamintion"
    echo "10. Tenth Diamintion"
    echo "0. EXIT"
}

read_options() {
    local choice
    echo "==============="
    echo ""
    read -p "Enter:" choice
    case $choice in
        1) F1 ;;
        2) pause "$(date)";;
        3) F3 ;;
        4) echo '*** Top 10 Memory eating process:'; ps auxf | sort -nr -k 4 | head -10;
           echo; echo '*** Top 10 CPU eating process:';ps auxf | sort -nr -k 3 | head -10;
           echo;  pause;;
        5) netstat -s | less;;
        6) F6;;
        10) References_add;;
        0) exit 0;;
        *) pause "Select between 1 to 5 only"
        #*) echo -e "\t ${RED}Error...${STD}" && sleep 1
    esac
}




F6() {
while True ; do
    echo "F6"
    echo "" && break
done
    cd ~/zdotfiles/6
    pause
    start_GUI
}



start_gui() {
    while true; do
        show_menus
        read_options
    done;
}


# # # # # # # # # # # # # # # # # # # #
    start_gui



#References
    #Capture
    # 0 search apt-cache
    # 1 search cmdfu ## commandlinefu
    # 2 search zdotfiles-vimrc zdotfiles.org
    # 3 search github ### github-cli
    # 4 search help ? stockflow-ubuntu
    # 5}}
    # Process
    # sed stream
    # Organize
    # Review
    # Check if a string is into a variable
    #± var="w ww www";[[ ${var##*w*} != ${var} ]] && echo "yes"
    # export key-value pairs list as environment variables
    # while read line; do export $line; done < <(cat input)
    # If - while test}
# User defined function

function WW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $zal
    echo "alias '$1'='$2'" >> $zal
    source $zal
    echo "" && echo "- Alias added  $1 = $2 " && echo "";
}


function glll {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push -all
    git push origin --all && git push origin --tags
}
#{e-mail
#}
 #{Inboxes
### Dir - files -DAL
#}

#{Tasks
#askapache : ahave apth check}
# ----------------------------------
#{Reminder

select_vim() {
    PS3="Enter a number: "; select f in *;do $EDITOR $f; break; done;
}

function grep_zsh_history () {
    cut -f2 -d";" ~/.zsh_history | sort | uniq -c | sort -nr | grep $1;
}


# A new directory is created every hour.
Fourth_pics(){
    PICSDIR=/home/carol/pics
    WEBDIR=/var/www/carol/webcam
    while true; do
        DATE=`date +%Y%m%d`
        HOUR=`date +%H`
        mkdir $WEBDIR/"$DATE"
        while [ $HOUR -ne "00" ]; do
            DESTDIR=$WEBDIR/"$DATE"/"$HOUR"
            mkdir "$DESTDIR"
            mv $PICDIR/*.jpg "$DESTDIR"/
            sleep 3600
            HOUR=`date +%H`
        done
    done
}

# Calculate the average of a series of numbers.
Calculate_score() {
    SCORE="0"
    AVERAGE="0"
    SUM="0"
    NUM="0"

    while true; do

      echo -n "Enter your score [0-100%] ('q' for quit): "; read SCORE;

      if (("$SCORE" < "0"))  || (("$SCORE" > "100")); then
        echo "Be serious.  Common, try again: "
      elif [ "$SCORE" == "q" ]; then
        echo "Average rating: $AVERAGE%."
        break
      else
        SUM=$[$SUM + $SCORE]
        NUM=$[$NUM + 1]
        AVERAGE=$[$SUM / $NUM]
      fi

    done

    echo "Exiting."
}

read_file() {
    file=/etc/passwd
# set field delimiter to :
# read all 7 fields into 7 vars
    while IFS=: read -r user enpass uid gid desc home shell
    do
        # only display if UID >= 500
        [ $uid -ge 500 ] && echo "User $user ($uid) assigned \"$home\" home directory with $shell shell."
    done < "$file"
}

What_is_your_name() {
    read -p "Enter your name : " name
    echo "Hi, $name. Let us be friends!"
}

wReferences_add() {
    read -p "Enter number one : " n1
    read -p "Enter number two : " n2
    read -p "Enter number three : " n3
    echo "Number1 - $n1"
    echo "Number2 - $n2"
    echo "Number3 - $n3"
}
read_Timeout() {
#Timeout if no input provided within 10 second program will be aborted
    read -t 10 -p "Enter the Internet domain name (e.g. nixcraft.com) : " domain_name
    whois $domain_name
}

read_users() {
# seven fields from /etc/passwd stored in $f1,f2...,$f7
    while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
    do
     echo "User $f1 use $f7 shell and stores files in $f6 directory."
    done < /etc/passwd
}


find_file() {
    match=$1  # fileName
    found=0   # set to 1 if file found in the for loop

# show usage
    [ $# -eq 0 ] && { echo "Usage: $0 fileName"; exit 1; }

# Try to find file in /etc
    for f in /etc/*
    do

        if [ $f == "$match" ]
        then
            echo "$match file found!"
            found=1 # file found
            break   # break the for looop
        fi
    done

# noop file not found
    [ $found -ne 1 ] && echo "$match file not found in /etc directory"
}



# set an infinite while loop
is_it() {
    while :
    do
        read -p "Enter number ( -9999 to exit ) : " n

            # break while loop if input is -9999
        [ $n -eq -9999 ] && { echo "Bye!"; break; }

        isEvenNo=$(( $n % 2 ))  # get modules
            [ $isEvenNo -eq 0 ] && echo "$n is an even number." || echo "$n is an odd number."

    done
}

do_it_n() {
    n=1
    # continue until $n equals 5
    while [ $n -le 5 ]
        do
            echo "Welcome $n times."
            n=$(( n+1 )) # increments $n
    done
}


#Early continuation with the continue statement

#To resume the next iteration of the enclosing WHILE loop use the continue statement as follows:

read_continue() {
    while [ condition ]
    do
      statements1      #Executed as long as condition is true and/or, up to a disaster-condition if any.
      statements2
      if (condition)
      then
        continue   #Go to next iteration of I in the loop and skip statements3
      fi
      statements3
    done
}

#http://www.cyberciti.biz/faq/bash-while-loop/

#In this example, the break statement will skip the while loop when user enters -1, otherwise it will keep adding two numbers:
adding_sum() {
    while :
    do
        read -p "Enter two numnbers ( - 1 to quit ) : " a b
        if [ $a -eq -1 ]
        then
            break
        fi
        ans=$(( a + b ))
        echo $ans
    done
}

# show usage
#[ $# -eq 0 ] && { echo "Usage: $0 fileName"; exit 1; }
#egrep -i "^username" /etc/passwd
#grep "nor" <<<$var >/dev/null && echo "Found" || echo "Not found"
#echo $var | grep -q "nor"  && echo "Found" || echo "Not found"

#The following command counts the total active network interfaces:
#wc -w <<<$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
superuser() {
    if [ $(id -u) != "0" ]; then
        echo "You must be the superuser to run this script" >&2
        exit 1
    fi
}


home_space() {
    # Only the superuser can get this information
    if [ "$(id -u)" = "0" ]; then
        echo "<h2>Home directory space by user</h2>"
        echo "<pre>"
        echo "Bytes Directory"
            du -s /home/* | sort -nr
        echo "</pre>"
    fi
}


Calculate_all() {
    first_num=0
    second_num=0

    echo -n "Enter the first number --> "
    read first_num
    echo -n "Enter the second number -> "
    read second_num

    echo "first number + second number = $((first_num + second_num))"
    echo "first number - second number = $((first_num - second_num))"
    echo "first number * second number = $((first_num * second_num))"
    echo "first number / second number = $((first_num / second_num))"
    echo "first number % second number = $((first_num % second_num))"
    echo "first number raised to the"
    echo "power of the second number   = $((first_num ** second_num))"
}
Seconds_to() {
    seconds=0

    echo -n "Enter number of seconds > "
    read seconds

    hours=$((seconds / 3600))
    seconds=$((seconds % 3600))
    minutes=$((seconds / 60))
    seconds=$((seconds % 60))

    echo "$hours hour(s) $minutes minute(s) $seconds second(s)"
}

is_it_letters() {
    echo -n "Type a digit or a letter > "
    read character
    case $character in
                # Check for letters
        [a-z] | [A-Z] ) echo "You typed the letter $character"
                ;;

                # Check for digits
        [0-9] )     echo "You typed the digit $character"
                ;;

                # Check for anything else
        * )         echo "You did not type a letter or a digit"
    esac
}

press_enter() {
    echo ""
    echo -n "Press Enter to continue"
    read
    clear
}

selection() {
        selection=
    until [ "$selection" = "0" ]; do
        echo ""
        echo "PROGRAM MENU"
        echo "1 - display free disk space"
        echo "2 - display free memory"
        echo ""
        echo "0 - exit program"
        echo ""
        echo -n "Enter selection: "
        read selection
        echo ""
        case $selection in
            1 ) df ; press_enter ;;
            2 ) free ; press_enter ;;
            0 ) exit ;;
            * ) echo "Please enter 1, 2, or 0"; press_enter
        esac
    done
}


find_txt_grep() {
    find . -type f -and -iregex '.*\.txt$' -and -print0 -exec grep --color=always -Hn "$1" {} \;
}

#s/^  */\ #2 /g #This substitution replaces line-beginning spaces with a newline. The net result is to replace paragraph indents with a blank line between paragraphs.
#sed -e "s/$old_pattern/$new_pattern/g" $file_name

#Increment a variable, with the same effect as let y=y+1 and y=$(($y+1))

list_users() {
    # List all the users in /etc/passwd.

    FILENAME=/etc/passwd

    for user in $(cut -d: -f1 $FILENAME)
    do
      echo $user
    done
}

#To list a specific line of a text file, pipe the output of head to tail -n 1. For example head -n 8 database.txt | tail -n 1 lists the 8th line of the file database.txt.
#cut -d ' ' -f2,3 filename is equivalent to awk -F'[ ]' '{ print $2, $3 }' filename
#References
#http://tldp.org/LDP/abs/html/textproc.html


#To set a variable to a given block of a text file:
#var=$(head -n $m $filename | tail -n $n)

# filename = name of file
# m = from beginning of file, number of lines to end of block
# n = number of lines to set variable to (trim from end of block)

# script-detector.sh: Detects scripts within a directory.
script-detector(){
    # script-detector.sh: Detects scripts within a directory.

    TESTCHARS=2    # Test first 2 characters.
    SHABANG='#!'   # Scripts begin with a "sha-bang."

    for file in *  # Traverse all the files in current directory.
    do
      if [[ `head -c$TESTCHARS "$file"` = "$SHABANG" ]]
      #      head -c2                      #!
      #  The '-c' option to "head" outputs a specified
      #+ number of characters, rather than lines (the default).
      then
        echo "File \"$file\" is a script."
      else
        echo "File \"$file\" is *not* a script."
      fi
    done

    exit 0
}

test_strings() {
    if [ $file1 -ot $file2 ]
    then #      ^
      echo "File $file1 is older than $file2."
    fi

    if [ "$a" -eq "$b" ]
    then #    ^
      echo "$a is equal to $b."
    fi

    if [ "$c" -eq 24 -a "$d" -eq 47 ]
    then #    ^              ^
      echo "$c equals 24 and $d equals 47."
    fi

    param2=${param1:-$DEFAULTVAL}
}

count_files() {
    find . -maxdepth 1 -name \*.txt -print0 | grep -cz .
}

view_page(){
    #A particularly useful option is -d, forcing double-spacing (same effect as sed -G).
    pr -o 5 --width=65 fileZZZ | more gives a nice paginated listing to screen of fileZZZ with margins set at 5 and 65.
}

############3

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

program_exists() {
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
    error "$2"
    fi
}

############################ SETUP FUNCTIONS
lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

do_backup() {
    if [ -e "$2" ] || [ -e "$3" ] || [ -e "$4" ]; then
        today=`date +%Y%m%d_%s`
        for i in "$2" "$3" "$4"; do
            [ -e "$i" ] && [ ! -L "$i" ] && mv "$i" "$i.$today";
        done
        ret="$?"
        success "$1"
        debug
   fi
}

upgrade_repo() {
      msg "trying to update $1"

      if [ "$1" = "$app_name" ]; then
          cd "$HOME/.$app_name-3" &&
          git pull origin "$git_branch"
      fi

      if [ "$1" = "vundle" ]; then
          cd "$HOME/.vim/bundle/vundle" &&
          git pull origin master
      fi

      ret="$?"
      success "$2"
      debug
}

clone_repo() {
    program_exists "git" "Sorry, we cannot continue without GIT, please install it first."
    endpath="$HOME/.$app_name-3"

    if [ ! -e "$endpath/.git" ]; then
        git clone --recursive -b "$git_branch" "$git_uri" "$endpath"
        ret="$?"
        success "$1"
        debug
    else
        upgrade_repo "$app_name"    "Successfully updated $app_name"
    fi
}

clone_vundle() {
    if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
        git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
    else
        upgrade_repo "vundle"   "Successfully updated vundle"
    fi
    ret="$?"
    success "$1"
    debug
}

create_symlinks() {
    endpath="$HOME/.$app_name-3"

    lnif "$endpath/.vimrc"              "$HOME/.vimrc"
    lnif "$endpath/.vimrc.bundles"      "$HOME/.vimrc.bundles"
    lnif "$endpath/.vim"                "$HOME/.vim"

    # Useful for fork maintainers
    touch  "$HOME/.vimrc.local"

    if [ -e "$endpath/.vimrc.fork" ]; then
        ln -sf "$endpath/.vimrc.fork" "$HOME/.vimrc.fork"
    elif [ "$fork_maintainer" -eq '1' ]; then
       touch "$HOME/.vimrc.fork"
       touch "$HOME/.vimrc.bundles.fork"
    fi

    if [ -e "$endpath/.vimrc.bundles.fork" ]; then
        ln -sf "$endpath/.vimrc.bundles.fork" "$HOME/.vimrc.bundles.fork"
    fi

    if [ ! -d "$endpath/.vim/bundle" ]; then
        mkdir -p "$endpath/.vim/bundle"
    fi

    ret="$?"
    success "$1"
    debug
}

setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'
    vim -u "$HOME/.vimrc.bundles" +BundleInstall! +BundleClean +qall
    export SHELL="$system_shell"

    success "$1"
    debug
}

############################ MAIN()
#program_exists "vim" "To install $app_name you first need to install Vim."

#do_backup   "Your old vim stuff has a suffix now and looks like .vim.`date +%Y%m%d%S`" \
        #"$HOME/.vim" \
        "$HOME/.vimrc" \
        #"$HOME/.gvimrc"

clone_repo      "Successfully cloned $app_name"

#create_symlinks "Setting up vim symlinks"

#clone_vundle    "Successfully cloned vundle"

#setup_vundle    "Now updating/installing plugins using Vundle"

#msg             "\nThanks for installing $app_name."
#msg             "© `date +%Y` http://vim.spf13.com/"
