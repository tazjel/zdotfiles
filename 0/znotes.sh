pwd
ls
ls
WW_add_znotes() {echo  >> ~/zdotfiles/0/znotes.sh; tail ~/zdotfiles/0/znotes.sh }
WW_add_znotes() {echo "" >> ~/zdotfiles/0/znotes.sh; tail ~/zdotfiles/0/znotes.sh }
WW_add_znotes() {echo "$@" >> ~/zdotfiles/0/znotes.sh; tail ~/zdotfiles/0/znotes.sh }
 zfind() { find ~ -type f -iname "*\.sh" -exec egrep "$@" {} \; }
whichone
