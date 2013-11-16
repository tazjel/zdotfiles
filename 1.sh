#!/bin/bash

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
        6) References_add;;
        0) exit 0;;
        *) pause "Select between 1 to 5 only"
        #*) echo -e "\t ${RED}Error...${STD}" && sleep 1
    esac
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




# show usage
#[ $# -eq 0 ] && { echo "Usage: $0 fileName"; exit 1; }
#egrep -i "^username" /etc/passwd
#grep "nor" <<<$var >/dev/null && echo "Found" || echo "Not found"
#echo $var | grep -q "nor"  && echo "Found" || echo "Not found"

#The following command counts the total active network interfaces:
#wc -w <<<$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
