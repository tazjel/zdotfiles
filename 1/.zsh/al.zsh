# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
#Thu Jul  4 07:14:50 AST 2013
########################################################
# Author : AHMED BANI
# startup
echo -e "\t\t بسم الله الرحمن الرحيم | ماشاء الله ولا قوة الابالله"
echo -e "\t\t\t\t $(date)"
########################################################
# <F0> git
export N6=/dev/null
# ahave - Function to check if a program exists in path
function ahave() 
{ unset -v ahave; command command type $1 &>$N6 && ahave="yes" || return 1; }

########################################################
# Put readline into vi mode
#set -o vigit config --global user.name
alias 'zzk'='kate ~/zdotfiles/1/.zsh/al.zsh'
########################################################
# <F1>
########################################################
#setxkbmap -v -rules xfree86 -model pc104 -layout "us,ar" -option "grp:alt_shift_toggle" -option "grp_led:caps"
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
setxkbmap -option ctrl:nocaps
############## 
#{Bindkey

# Make HOME and END work reasonably
#case $TERM in
    #xterm*)
    #bindkey "^[[F" end-of-line
    #bindkey "^[[H" beginning-of-line 
    #;;
#esac

#bindkey '\e[1~' beginning-of-line       # Home
#bindkey '\e[4~' end-of-line             # End
#bindkey '\e[3~' delete-char             # Del
#bindkey '\e[2~' overwrite-mode          # Insert 
#bindkey -v
#}##########################################
alias "سم"="alias"
alias "قل"="echo"
alias "اكتب"="vim"
alias "اقرا"="cat"
alias "اكتب عربي"="vim -A"
alias "اعد"="zsh"
alias "نظف"="clear"
alias "بحث"="grep -iaR"
alias "التاريخ"="date"
#############################################

alias 'wml'='env SHELL=zsh mlterm --meta=esc --metakey=alt -E ar.SA.UTF-8 -f=green -b=black -0=green -R=30-40'
#env SHELL=zsh mlterm  --meta=esc --metakey=alt
########################################################
# F2
########################################################
alias al='alias | grep'
alias zz='vim $HOME/zdotfiles/1/.zsh/al.zsh && source $HOME/zdotfiles/1/.zsh/al.zsh'
alias zzzz=' vim $HOME/.zshrc && source $HOME/.zshrc'

alias zza='kate $HOME/zdotfiles/1/.zsh/arabic_alias.zsh && source
$HOME/zdotfiles/1/.zsh/arabic_alias.zsh'
########################################################
# <F3>
########################################################
#mkdir ~/images/shots/
#
function sw () {
    today=`date +%Y_%m_%d_%h_%s`
    scrot '$today_srot.png' -e 'mv $f ~/images/shots/'
}
function wsw() {
    today=`date +%d_%s`;echo $today; scrot "$today"_shot.png -e 'mv $f ~/images/shots/';ls ~/images/shots
}
function wpw_capture_pic_every_2 () {
i=0;while :; do i=$(expr "$i" + 1); scrot "$i".png; sleep 2; done;
}

WWW_path=$zal
function WWW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $WWW_path
    echo "# $desc" >> $WWW_path
    echo '# "$1"="$2" ' >> $WWW_path
    tail -7 $WWW_path
    echo "" && echo "- Alias added  $1 = $2 " && echo "";
}

#
#
#
zal=~/zdotfiles/1/.zsh/al.zsh



alias -g wv='| vim -'
alias lh='ls -a | egrep "^\."'
alias lhd='ls -A | egrep "^\."'
#################################
function zbp {
    for xx in ~/.* ;do
    rsync -avz --progress $HOME/.* $HOME/zzz_bkp
    echo $xx
done;
}

# While you press the PS button to connect, run this on a different terminal:
alias 'wsix_kill_blue'='sudo killall -KILL bluetoothd'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"

function wsix_lsusb_dmesg_hcitool {
    lsusb;dmesg;hcitool dev;hcitool con;
    echo " بسم الله ما شاء الله"
}



alias __="sudo"

#######################################

alias 'w'='clear;ls -a;pwd;echo -e "\t\t\t$(date)"'

alias 'ww'='vim'
alias 'kk'='kate'

alias 'www'='cat'

alias 'ppp'='sudo add-apt-repository $1'
alias hh='history -$1 | grep'

alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'

alias 'rmm'='rm -rf'
alias ..='cd ..'

alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ..1='cd ..'
alias ..2='cd ../../../'
alias ..3='cd ../../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

##

function WW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $zal
    echo "alias '$1'='$2' " >> $zal
    source $zal

    echo "" && echo "- Alias added  $1 = $2 " && echo "";
    echo "" >> $zal
    echo "" >> $zal
    tail $zal
}


##########
function glll {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push --all
    git push origin --all && git push origin --tags
}

#############################
 # The easiest way is to disable the SSL CERT verfiy:

      #git config --global http.sslVerify false
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'


############ xclip
alias xclip='xclip -selection c'
alias -g 'wxc'='| xclip'
alias 'n1'='dpkg --get-selections | grep linux-image'
alias 'kla'="ls -a | grep '^\.'"
alias 'klj'='ls -a | grep "^\.\(.*\)n$"'


alias 1='cd -'
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias agdu='sudo apt-get dist-upgrade'
alias aliasupdt='wget -q -O - "$@" https://alias.sh/user/1110/alias >> ~/.bash_aliases'

alias assume='git update-index --assume-unchanged'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'

alias c=clear
alias cats='pygmentize -O style=monokai -f console256 -g'
alias cathtml='sed '\''s/<[^>]*>//g'\'
alias cbuild='mkdir build && cd build; cmake ..; make'
alias ccat='pygmentize -O bg=dark'
alias cd='HOME="$OLDPWD" cd'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cgrep='grep --color=always'
alias clip='xclip -sel clip'

alias clr='clear;pwd;ls'
alias co='git checkout '
alias confcat='sed -e '\''s/[#;].*//;/^\s*$/d'\'' '
alias convert_pdf='abiword --to=pdf '
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias ddel='rm -Rf'
alias dfree='df -h -x tmpfs'
alias display='less +F'

alias eg='git config -e'
alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash'
alias erase='shred -n 35 -z -u'
alias freenodetor='dig +short irc.tor.freenode.net cname'
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
alias wfreq='cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30'
alias wwfreq='cat ~/.zsh_history  | head -n 300'
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcl='git config --list'
alias gcm='git checkout master'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gd='git diff'
alias get='git '
alias gf='git ls-files | grep'
alias gg='sr google -browser='
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias gl='git pull'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias globurl='noglob urlglobber '
alias gm='git merge'
alias go='git checkout '
alias gp='git push'
alias gpl='git pull'
alias gpm='git push origin master'
alias gpo='git pull origin'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push'
alias gr='git remote'
alias grep='grep --color=auto'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grphp='ps -auwx | grep php'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias grup='git remote update'
alias grv='git remote -v'
alias gs='git status'
alias gsd='git svn dcommit'
alias gsl='git shortlog -nsw -e'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gt='git stash'
alias gup='git pull --rebase'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gx='gitx --all'
alias h='cd $HOME'
alias heroku='nocorrect heroku'
alias hh='history | grep --color=auto'
alias hpodder='nocorrect hpodder'
alias ifconfig-ext='curl ifconfig.me'
alias install='sudo apt-get install'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips='ifconfig -a | grep -o '\''inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)'\'' | sed -e '\''s/inet6* //'\'


### python
#alias calc='python -ic "from math import *; from random import *"'

alias ipy='python -c '\''import IPython; IPython.frontend.terminal.ipapp.launch_new_instance()'\'
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias k='gitk --all &'
alias k9='kill -9'
alias l='ls -ltr'
alias l.='ls -d .* --color=auto'
alias la='ls -A'
alias lba='cd ~/Library/Application\ Support/LaunchBar/Actions'
alias le='ls --sort=extension'
alias lf='ls -Gl | grep ^d'
#alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias listips='nmap -sP 192.168.1.1/24'



alias ll='ls -l'
alias lla='ls -lhFA'
alias lle='ll --sort=extension'
alias lll='ls -alF'
alias llocal='ifconfig eth0 | grep inet6'
alias llr='ll -R'
alias llt='ll --sort=time'
alias lns='ln -s'
alias localip='ipconfig getifaddr en1'
alias logs='tail -n30 /var/log/apache2/error.log'
alias lr='ls -R'
alias lrt='ls -lart'
alias ls='ls --color=tty'

alias lsd='ls -Gal | grep ^d'
alias lt='ls --sort=time'

alias netlisteners='lsof -i -P | grep LISTEN'
alias netstat='netstat -pantu'
alias nfas='grep -c "^>"'
alias no-assume='git update-index --no-assume-unchanged'
alias open=xdg-open
alias please=sudo
alias ppm='git push origin master'
alias poogle='ping google.com'
alias process='ps -ax'
alias prs='ps faux|grep -v grep|grep "$@"'
alias psf='ps auxf'
alias psg='ps -ef |grep '
alias qless='qstat -u "*" | less'
alias rd=rmdir
alias remove='sudo apt-get remove'

alias snlcp='tr -d "\n" | pbcopy'

alias source-private-aliases='source <(wget -t 3 -q -O - "$@" https://alias.sh/user/$ALIAS_SH_USER_ID/alias/key/$ALIAS_SH_USER_KEY)'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'

alias tm='ps -ef | grep'


alias uncomment='egrep -v "^#|^$"'

alias unzip-all='7z x -y '\''*.zip'\'

alias up_master='git push origin master'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

alias -g 'Gx'='--exclude-dir=cache .'
alias 'GX'='grep -iaR "$1"--exclude-dir=cache'
# USAGE: wG string string filename
alias 'wG'='grep -E "(.*)($1)(.*)($2)(.*)"'
function wW_grep_logs(){
    grep "$1" */logs/*.log
}


alias 'wW_grep_1'='grep -GRh $1 ~ | sort | uniq -c | sort -nr >> $2 && tail  $2'
alias -g Gh='--help | grep'
alias -g G='| grep'

#Search
function ww10 {
    for i in $(seq 1 10);do
        echo $i
    done
}

function alg {
    grep $1 $HOME/.zsh_history | sed 's/^.*;//g'

}

alias 'wwww_clean_history_get_install'="lg install | sed 's/install//g' | sed 's/^ //g' | sed 's/sudo aptitude//g' | sed 's/^[ ]apt-get//g'| sed 's/^alg.*$//g"

alias 'wmsg'='dmesg | tail -15'

alias '___'='sudo su'


alias 'ww_chmodX'='chmod +x'

alias 'ww_chmod_x'='chmod -x'

alias '__r'='sudo reboot'

function Ww () {
ag -C 3 $(echo "$1") $(echo $HOME/zdotfiles)
}


alias 'Ww_aptitude'='sudo aptitude -f'

alias 'Ww_apt-cache_search_xfce4'='apt-cache search xfce4'

alias 'agg'='sudo apt-get update && sudo apt-get upgrade'
alias 'ww_firefox_editor'="firefox 'data:text/html, <html contenteditable>' "
#
#web2py
#
alias '99'='cd ~/zdotfiles/Projects/web2py'
alias '99_welcome/controllers/default'='cd $HOME/zdotfiles/Projects/web2py/web2py/applications/welcome/controllers'
alias '99w'='cd /home/abobanihh/zdotfiles/Projects/web2py/web2py/applications/welcome'



function ww-bluetooth_restart {
    sudo service bluetooth restart;
}


alias 'wf'='firefox -search'

alias -g 'H'="--help"
alias -g 'wH'="--help | grep "
alias 'alal'='cmdfu'
cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R - }


####################################################
function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }

#function ww_send_gmail
##{
#echo "Your Email :  " && read Email;
#echo " Enter Password : " && read pw;
#echo "Send To : " && read mailto ;
#curl --url "smtps://smtp.gmail.com:465" --ssl-reqd --mail-from "$(echo $Email)" --mail-rcpt "$(echo $mailto)" --upload-file mail.txt --user "$(echo $Email):$(echo $pw)" --insecure;
#}
#
#
########################3
#
alias 'wx'='chmod +x'

alias 'wX'='chmod -x'


alias 'W'='echo'

alias 'wwww'='wfw'
alias 'wws'='PS3="nter a number: "; select f in *;do $EDITOR $f; break; done'
wwws () {
    PS3="Enter a number: "
    select f in '$1';do
        echo $f;
        break;
    done;
}



function wwrename {
    for file in * ; do
    mv "$file" `echo "$file" | tr ' ' '_' | tr '[A-Z]' '[a-z]'`;
    done;
}

alias 'wtst'='cd ~/tst'

alias 'wlv'='ls -a | grep vim'
alias 'wlz'='ls -a | grep zsh'

alias 'wdev'='hcitool dev'

alias '1'='ls'

alias 'wwraw'='sudo sixad-raw /dev/'

alias 'ww-lsusb-grep-Sony'='lsusb| grep Sony'

alias 'ww-dmesg-sony'='dmesg | grep sony'

alias 'wsix'='source ~/zdotfiles/1/01/gui_3_bash.sh'

alias 'wi'='sudo apt-get install'

alias 'wwww_which_ubuntu_dist'='cat /etc/issue'

alias '99'='clear;pwd;cd ~/zdotfiles/9;ls -X'
alias '88'='clear;pwd;cd ~/zdotfiles/8;ls -X'
alias '77'='clear;pwd;cd ~/zdotfiles/7;ls -X'
alias '66'='clear;pwd;cd ~/zdotfiles/6;ls -X'
alias '55'='clear;pwd;cd ~/zdotfiles/5;ls -X'
alias '44'='clear;pwd;cd ~/zdotfiles/4;ls -X'
alias '33'='clear;pwd;cd ~/zdotfiles/3;ls -X'
alias '22'='clear;pwd;cd ~/zdotfiles/2;ls -X'
alias '11'='clear;pwd;cd ~/zdotfiles/1;ls -X'
alias '111'='vim ~/zdotfiles/1.sh'
alias '1111'='bash ~/zdotfiles/1.sh'
alias 00=$HOME/zdotfiles

function Wbkp {
    for xx in ~/.* ;do
        rsync -avz --progress $HOME/.* $HOME/zzz_bkp
        ls -a > ~/zdotfiles/1/.zsh/Inbox_Home_dotfiles.txt
        echo ~/zdotfiles/1/.zsh/Inbox_Home_dotfiles.txt
    done;
}


alias 'wt'='cd ~/tst'


alias 'wrvs_remove_vim_swap'='rm ~/.vimswap/*'

alias 'vv'='vim ~/zdotfiles/2/.vimrc.local'

alias 'wph'='vim ~/zdotfiles/References/UNIX_Philosophy/make_a_for_everyone'
alias 'wshut'='sudo shutdown -h now'

alias 'whis'='cut -f2 -d";" ~/.zsh_history | grep "$1" | sort -u'




alias 'wmp3_notify'='play ~/zdotfiles/References/notify.mp3'

alias 'wr'='xd=$(date +%s); rec -c 2 -r 44100 -s -t wav ~/Dropbox/tools/zfile$xd.wav'

alias 'wp'='play ~/Dropbox/tools/zfile$xd.wav'


# get a random number in bash
alias 'w_RANDOMi'='echo $[RANDOM % 100]  # range 0-99'
#
#rec -r 44100 -p | sox -p "audio_name-$(date '+%Y-%m-%d').ogg" silence -l 1 00:00:00.5 -45d -1 00:00:00.5 -45d<]*/

alias 'ww_permission'='sudo chown abobani:abobani -Rv /home/abobani/**/*'

alias 'wh'='tail -3000 ~/.zsh_history | cut -d";" -f2 | sort -u | grep'

extract_url_links (){
    for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" $1 | sed "s/^'\///g" | sed "s/'$//g");do echo $i;done;
}

compare_strings () {
    #string='My string';
    string="$@";

    if [[ "$1" == *"$2"* ]]

    then
      echo "It's there!";
    fi
        echo "No"
    #needle='y s'
    #if [[ "$string" == *"$needle"* ]]; then
      #echo "haystack '$string' contains needle '$needle'"
      #
    #fi
}


alias "wwf"="cmdfu"
# list and get size
alias 'wlrs_sizels'='ls -lhR | grep -e "total\|:\$"'
# Recursively search your directory tree files for a string
#
convert_path2uri () { echo -n 'file://'; echo -n "$1" | perl -pe
    's/([^a-zA-Z0-9_\/.])/sprintf("%%%.2x", ord($1))/eg'| sed -e 's/%//';}

# List directories recursively showing its sizes using only ls and grep
function Wll () {
    ls -lhR | grep -e "total\|:$"
}

#Useage : wst_string <Enter> add your strings. Then, close by only typing zx
#You can echo $iz

alias 'wst_string'="read -d '' iz <<"zx""

alias 'wask'='vim ~/zdotfiles/1/askapache-bash-profile.txt'
alias 'wjprayer'='wf "jeddah prayer time"'



alias 'wfbash'="#\bash \command line filetype:bash @$"


alias 'wfbash'='firefox -search bash command line "$@"'
functions wfbash() {
    firefox -search
}


    #function vimgrep () { tmp="$@" ; vim -c "vimgrep $tmp | copen" ; }
 #example : vimgrep pattern 'dir/**/*.c'
#Installers
function install_dropbox_cmd () {
    '/tmp/a b'onvert_path2uri () { echo -n 'file://'; echo -n "$1" | perl -pe 's/([^a-zA-Z0-9_\/.])/sprintf("%%%.2x", ord($1))/eg' ;} 
    uonvert_path2uri () { echo -n 'file://'; echo -n "$1" | perl -pe 's/([^a-zA-Z0-9_\/.])/sprintf("%%%.2x", ord($1))/eg' ;} 
    mkdir -p ~/bin
    wget -O ~/bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py"
    chmod +x ~/bin/dropbox.py
    . ~/bin/dropbox.py help
}
### {install spf13
#https://github.com/spf13/spf13-vim
warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
    if [ -L $2 ] ; then
        ln -sf $1 $2
    fi
}

#}
#

#Set the permissions so you can execute the CLI interface:

#Getting Started

#Start off by printing the help menu:
alias 'wdr'='~/bin/dropbox.py'




alias 'wj'='joy2key'



alias 'wjs'='jstest --normal /dev/input/js0'


#sqlite3 ~/.mozilla/firefox/*default/places.sqlite "select a.url, a.title from moz_places a, moz_bookmarks b where a.id=b.fk and b.parent=2;"

#scanimage -p --resolution 250 --mode Gray -x 215.9 -y 279.4 | pnmtops -imageheight 11 -imagewidth 8.5 | ps2pdf - output.pdf
# Recursively search and replace old with new string, inside every instance of filename.ext

#uname -m   # display machine "hardware name"
# Commandline document conversion with Libreoffice
#soffice --headless -convert-to odt:"writer8" somefile.docx

# Discover the process start time
#ps -eo pid,lstart,cmd
#
#stat -f -L -c %T YOUR_FILE_OR_DIRECTORY

#
# List mp3 files with less than 320 kbps bitrate.
## Delete a file securely by overwriting its contents
#shred -v filename

#<F5>
# Show who is logged on and find out what they are doing
#watch w

# find established tcp connections without using netstat!!
#lsof -i -n | grep ESTABLISHED


#<F6>
#du --max-depth=1 -h * |sort -h -k 1 |egrep '(M|G)\s'
# check for write/read permissions
#find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null


# Find out the permissions of the current directory
#ls -lad

alias 'wfd'='find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2;
done'

#{find search recursively
function wfs_find_string () {
    find . -print0  | xargs -0 egrep -
}
#
alias fn='find . -name "*[sh]" -exec grep -is /dev/null $1 {} \;'
function wff_find_file () {

}

alias lldu='find -maxdepth 1 -mindepth 1 -type d -exec du -sh {} \;'

alias fwn='find -wholename'
#alias wfip find /etc -exec grep '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' {} \;
wfind () {
    grep -i "$@" $zal;
}

# Recursive chmod all *.sh files within the current directory
alias 'wfx'='find ./ -name "*.sh" -exec chmod +x {} \;'

#find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'
#find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;
#alias gfind='find . -print0  | xargs -0 egrep -I '
## Execute commands on files found by the find command
#find -iname "MyCProgram.c" -exec md5sum {} \;
#}
#
##find -iname "MyCProgram.c" -exec md5sum {} \;
# (DEBIAN-BASED DISTROS) Find total installed size of packages given a search term
#dpkg-query -Wf '${Installed-Size}\t${Package}\n' | grep "\-dev" | sort -n | awk '{ sum+=$1} END {print sum/1024 "MB"}'
# How to search for files and open all of them in tabbed vim editor.
 #find / -type f -name $file -exec vim -p {} +


#<F9>
function wwp_web2py () {
    sudo chown -R www-data:www-data $1
}
## Copy a file over SSH without SCP
#ssh username1@servername1 -t ssh username2@servername2 uuencode -m testfile1.tar - | uudecode > testfile1.tar
#<F7>
#du -xB M --max-depth=2 /var | sort -rn | head -n 15
 #Recursively change permissions on directories, leave files alone.
#find /var/www/ -type f -print0 | xargs -0 chmod 644
# find unreadable file
#sudo -u apache find . -not -perm /o+r



#sed '/^\s*[^@%]/s=\([A-Z][A-Z]*\)\([^}A-Z]\|},$\)={\1}\2=g' literature.bib > output.bib
#
#
#
#<F8>
 #Oneliner to get domain names list of all existing domain names (from wikipedia)
#curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'


# list all world-writeable Linux files
#
#sudo find / -perm -2 ! -type l -ls


# list all world-writeable Linux files
#sudo find / -perm -2 ! -type l -ls
#netstat -antu | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n
#(($i > 0)) && echo "var is a number"
# What addresses are your applications talking to?
#watch "lsof -i -P |grep ESTABLISHED |awk '{printf \"%15.15s \\t%s\\n\", \$1, \$9}'"

# Find out which driver is in use
#jockey-text -l
## Copy a file over SSH without SCP
#ssh username1@servername1 -t ssh username2@servername2 uuencode -m testfile1.tar - | uudecode > testfile1.tar
#
# Advanced ls using find to show much more detail than ls ever could
#alias LS='find -mount -maxdepth 1 -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'
#
 #resize all images in folder and create new images (w/o overwriting)
#for file in *; do convert $file -resize 800x600 resized-$file; done
#
#How many lines in your files without comments
#find . -type f -name '*.php' | xargs cat | sed -re ':top /\/\*.*\*\// { s/\/\*.*\*\///g ; t top }; /\/\*/ { N ; b top }' | awk '$0 !~ /^[\t[:space:]]*($|(\/\/)|(#))/' | wc -l

alias 'wfw'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'



alias 'wak'='autokey -l' 



alias 'w7'='ssh' 



alias 'wib'='ssh root@192.168.1.$(echo "$1")'




alias 'war'='setxmap -layout ar'
alias 'wen'='setxmap -layout us'

#Enable Arabic . English alt shift
alias 'wenar'setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar

# Check if a .no domain is available
check_dns_no() { for i in $* ; do if `wget -O - -q http://www.norid.no/domenenavnbaser/whois/?query=$i.no | grep "no match" &>/dev/null` ; then echo $i.no "available" ; fi ; sleep 1 ;done }

# alias to close terminal with :q
alias ':q'='exit'

# Grep for regular expression globally, list files and positions.
alias 'wfg'='find . -name "*.pbt" -exec grep -Hirn "declareObject.*Common_Down"
{} \;'

# Screencast of your PC Display with webm output
#avconv -v warning -f alsa -ac 2 -i default -f x11grab -r 15 -s wxga -i :0.0 -acodec libvorbis -ab 320k -vcodec libvpx -qmax 2 -qmin 1 -threads auto -y -metadata title="Title here" ~/Video/AVCONV_REG.webm

# Screencast of your PC Display with mp4 output
#avconv -v warning -f alsa -i default -f x11grab -r 15 -s wxga -i :0.0 -vcodec libx264 -preset ultrafast -threads auto -y -metadata title="Title here" ~/Video/AVCONV_REG.mp4

# Check if system is 32bit or 64bit
#getconf LONG_BIT
wsay(){ mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=ar&q=$(echo $* | sed 's#\ #\+#g')" > /dev/null 2>&1 ; }
# Print free RAM in MB
# free -m | awk '/cache:/ {print $4}'

# Unbelievable Shell Colors, Shading, Backgrounds, Effects for Non-X

 #for c in `seq 0 255`;do t=5;[[ $c -lt 108 ]]&&t=0;for i in `seq $t 5`;do echo -e "\e[0;48;$i;${c}m|| $i:$c `seq -s+0 $(($COLUMNS/2))|tr -d '[0-9]'`\e[0m";done;done


# Sort the size usage of a directory tree by gigabytes, kilobytes, megabytes, then bytes.
dh() { du -ch --max-depth=1 "${@-.}"|sort -h }



#http://vlc.polyu.edu.hk/academicwriter/Frames/framesLinks.htm
#http://owl.english.purdue.edu/owl/
 #lynx -dump http://www.phrasebank.manchester.ac.uk | awk '/http/{print $2}' | egrep "^https{0,1}"
#○ wget --recursive --page-requisites --convert-links http://www.phrasebank.manchester.ac.uk


alias 'ww_check_bluetooth'='hciconfig' 
# Compare two directory trees.
#diff <(cd dir1 && find . | sort) <(cd dir2 && find . | sort)

# Sort lines using the Xth characted as the start of the sort string
#sort -k1.x

# sort lines by length
#awk '{print length, $0;}' | sort -nr

# Print the 10 deepest directory paths
#find . -type d | perl -nle 'print s,/,/,g," $_"' | sort -n | tail

# To get  internet connection information .
#sudo /bin/netstat -tpee

# Remove duplicate rows of an un-sorted file based on a single column
#awk '{ if ($1 in stored_lines) x=1; else print; stored_lines[$1]=1 }' infile.txt > outfile.txt

# Efficiently extract lines between markers
#sed -n '/START/,${/STOP/q;p}'
alias 'wlen'='export LANG="en_US.UTF-8" '
alias 'wl'='locale'
