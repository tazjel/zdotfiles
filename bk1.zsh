
#!/usr/bin/env bash


#####################################################
#  Conflict Analysis & Resolution
#  Author : Alghamdi, Ahmed. (November 25, 2013)
####################################################

     #Assignments
        PROGNAME=`basename $0`
        CONFIGPATH="$SYSCONFDIR/backup"
        REMOTEBACKUPDIR="$SYSCONFDIR/tar-backup"
        CONFIGFILE=${CONFIGPATH}/backup-specs
        DIRLIST=${CONFIGPATH}/dirs
        FILELIST=${CONFIGPATH}/files
        LOGPATH=${CONFIGPATH}/log

    #date and time
        date() {
            #date +%Y-%m-%d*/
        echo "date"
        }


license() {
    cat - <<EOF
    Copyright (C) 2006 Free Software Foundation, Inc.
    This is free software.  You may redistribute copies of it under the terms of
    the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
    There is NO WARRANTY, to the extent permitted by law.
EOF
}









    # Model
          # SETUP PARAMETERS
            # Zdotfiles
                app_name='zdotfiles'
                git_uri='https://github.com/tazjel/zdotfiles.git'
                git_branch='master'
                debug_mode='0'
                fork_maintainer='0'
            # Bibliography
                NBIB='Bibliography'
                MONTH=`date +%B`
                vim_snip=~/zdotfiles/2/Ref.snip
                DCAR_Bib=~/Dropbox/DCAR/presentation/Bibliography.txt
                DCAR_Bib_Notes=~/Dropbox/DCAR/presentation/Bibliography.txt
                BRA=~/zdotfiles/1/References.txt


            # who what why
                # where
                    here="`pwd`"

                # when
                    startdate="`date`"

    # Controller
         # File Manager.
         # Swap files.
            function swap() {
                local TMPFILE=tmp.$$

                [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
                [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
                [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

                mv "$1" $TMPFILE
                mv "$2" "$1"
                mv $TMPFILE "$2"
            }
                 # Extract archives
                    extract () {
                        if [ -f $1 ] ; then
                            case $1 in
                                *.tar.bz2)   tar xjf $1;;
                                *.tar.gz)    tar xzf $1;;
                                *.bz2)       bunzip2 $1;;
                                *.rar)       rar x $1;;
                                *.gz)        gunzip $1;;
                                *.tar)       tar xf $1;;
                                *.tbz2)      tar xjf $1;;
                                *.tgz)       tar xzf $1;;
                                *.zip)       unzip $1;;
                                *.Z)         uncompress $1;;
                                *.7z)        7z x $1;;
                                *.rar)       unrar e $1;;
                                *)           echo "'$1' cannot be extracted via extract()" ;;
                            esac
                        else
                            echo "'$1' is not a valid file"
                        fi
                    }
    # View
        #  GUI messages
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


            znotify() {
                play ~/zdotfiles/References/notify.mp3
            }

            pause(){
                local m="$@"
                echo "$m"
                read -p "Press [Enter] key to continue..." key
            }



#####################################################
        # start_GUI


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
            echo "w. EXIT"
        }

        read_options() {
            local choice
            echo "==============="
            echo ""
            read -p "Enter:" choice
            case $choice in
                1) F1;;
                2) F2;;
                3) F3;;
                4) F4;;
                5) F5;;
                6) F6;;
                7) F7;;
                8) F8;;
                9) F9;;
                10) F10;;
                w) exit 0;;
                *) pause "Select between 1 to 10 only";;
            esac
        }

        start_GUI() {
            while true; do
                show_menus
                read_options
            done;
        }

            start_GUI
####################################################
   # References
    # Next TODO
     #Create a ZIP archive of a file or folder.
        function makezip() { zip -r "1.zip" "$1" ; }
     #gets info about a file - basically a wrapper around stat
        get_file_info() {
            info=""
                case $1 in
                    'owner')    info='%U';;
                    'type')     info='%F';;
                    'creation') info='%w';;
                    'modified') info='%y';;
                    'access')   info='%w';;
                    'change')   info='%z';;
                    'size')     info='%s';;
                    'access')   info='%A';;
                    *)          return 1;;
                esac

                stat -c $info $2 2>/dev/null
        }
    #regular expression editor
        #http://www.rubular.com/regexes/6293
        #([^\.].*?[0-9])(?=\.|\Z)
    #svg2png
         svg2png () {
                    inkscape --file="$1" --export-png="$2" --export-width=$3
            }
        make-sorted-file-list () {
            find -maxdepth 1 -type f -iname \*$1 | sort > $2
        }

unlink_files () {
    files=".vim .vimrc .zshrc .gitconfig .tmux.conf .lynxrc .tmuxinator"
    for file in $files
    do
      if [ -L $HOME/$file ]; then
        unlink $HOME/$file
      fi
      ln -s $HOME/.dotfiles/$file $HOME
    done
}


