#!/bin/zsh



function l()
{
    ls -alt
}

function w()
{
    clear;ls -al;date;pwd
    echo "$TERM"
    echo "$SHELL"
}

ن()
{
    الحمد
}

########################################################
# Author : AHMED BANI

source ~/zdotfiles/1/walias.sh
source ~/zdotfiles/1/z_arabic.sh

show_code() { pygmentize $1 | less -N }

www_ak_add()
{
    echo "$1" > $HOME/.config/autokey/data/MyPhrases/ww/"$2"
}

#eplace all the spaces in all the filenames of the current directory and including directories with underscores.

www_rename()
{
    ls -1 | while read file; do
    new_file=$(echo $file | sed s/\ /_/g) && mv "$file" "$new_file"; done;
}

www_wget()
{
    wget --recursive  --page-requisites --convert-links
}

setup_git_push_default() {
    git config --global push.default current
}


git_config_global() {
    git config --global user.name 'Ahmed Al-Ghamdi'
    git config --global user.email 'tazjel@gmail.com'
    git config --list
    git config --global color.ui auto
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=3600'
}

ssh-keygen_rsa() {
    ssh-keygen -t rsa -C 'tazjel@gmail.com'
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com
}

git_clone() {
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
}

############################

set_xkeyboard() {
    if [[ $(uname) = "Linux" ]];then
        #easystroke show
        setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
        setxkbmap -option ctrl:nocaps
    fi
}

set_xkeyboard

is_linux()
{
    if [[ $(uname) = "Linux" ]];then
        echo "Yes"
        #easystroke show
        set_xkeyboard
    fi
}


star_Level_one()
{
    echo -e "\t\t بسم الله الرحمن الرحيم | ماشاء الله ولا قوة الابالله"
}
#
# vi style incremental search
    export EDITOR="vim"
    bindkey -v

    bindkey '^R' history-incremental-search-backward
    bindkey '^S' history-incremental-search-forward
    bindkey '^P' history-search-backward
    bindkey '^N' history-search-forward




wwww_pdf()
{
    for i in *.pdf; do echo --------$i-------; echo
        pdftotext $i - | grep -i $1
    done
}


#
# find and grep Word docs

www_find()
{
    find . -iname '*filename*.doc' | { while read line; do antiword "$line"; done; } | grep -C4 "$1";
}

#
compare_two_doc()
{
    meld <(antiword microsoft_word_a.doc) <(antiword microsoft_word_b.doc)
}



wwww_doc()
{
    for I in *.doc; do
        echo "-------- $i -------";
        echo ""
        catdoc $i - | grep -i "$1";
    done
}


########################################################
# F2
########################################################
#
#
#
#
#
#
# <F3>


wg_txt() {
    find . -type f -and -iregex '.*\.txt$' -and -print0 -exec grep --color=always -Hn "$1" {} \;
}

function sw ()
{
    today=`date +%Y_%m_%d_%h_%s`
    scrot '$today_srot.png' -e 'mv $f ~/images/shots/'
}

function wsw()
{
    today=`date +%d_%s`;echo $today; scrot "$today"_shot.png -e 'mv $f ~/images/shots/';ls ~/images/shots
}

function wpw_capture_pic_every_2 () {
    i=0;while :; do i=$(expr "$i" + 1); scrot "$i".png; sleep 2; done;
}
function zbp {
    mkdir -p $HOME/Dropbox/zzz_bkp
    for xx in ~/.* ;do
    rsync -avz --progress --exclude=.cache --exclude=~/.config/chromium --exclude=~/.config/google-chrome/ $HOME/.* /media/ahmed/Transcend/backup/newbkp
    echo $xx
done;
}
function wsix_lsusb_dmesg_hcitool {
    lsusb;dmesg;hcitool dev;hcitool con;
    echo " بسم الله ما شاء الله"
}
function WWW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $HOME/Dropbox/C/Foundation/inbox.txt
    echo "# $desc" >> $WWW_path
    echo '# "$1"="$2" ' >> $WWW_path
    tail -7 $WWW_path
}
function wW_grep_logs(){
    grep "$1" */logs/*.log
}
function WW {

    zal=~/zdotfiles/1/.zsh/al.zsh

    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $zal
    source $zal

    echo "" >> $zal
    tail $zal
}
function Ww() {
    ag -C 3 $(echo "$1") $(echo $HOME/zdotfiles)
}
function ww-bluetooth_restart {
    sudo service bluetooth restart;
}
function cmdfu() {
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R - }



wwws () {
    PS3="Enter a number: "
    select f in $1;do
        echo $f;
        break;
    done;
}


function wwrename {
    for file in * ; do
    mv "$file" `echo "$file" | tr ' ' '_' | tr '[A-Z]' '[a-z]'`;
    done;
}
function Wbkp {
    for xx in ~/.* ;do
        rsync -avz --progress $HOME/.* $HOME/zzz_bkp
        ls -a > ~/zdotfiles/1/.zsh/Inbox_Home_dotfiles.txt
        echo $data >> ~/zdotfiles/1/.zsh/Inbox_Home_dotfiles.txt
    done;
}
extract_url_links (){
    for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" $1 | sed "s/^'\///g" | sed "s/'$//g");do echo $i;done;
}

wds_compare_strings() {
    string="$@"
    if [[ "$1" == *"$2"* ]];then
        echo "It's there!"
    fi
        echo "No"
}

function W_file_size () {
    ls -lhR | grep -e "total\|:$"
} # List directories recursively showing its sizes using only ls and grep

function ww10 {
    for i in $(seq 1 10);do
        echo $i
    done
}

function alg () {
    grep $1 $HOME/.zsh_history | sed 's/^.*;//g'
}

function glll {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push --all
    git push origin --all && git push origin --tags
}

ww_sort()
{
    sort -u
}


function wpkl () {
    dpkg --get-selections > ~/zdotfiles/0/packages-alpha.txt
}

wssh ()
{
    listips | grep "for" | cut -d' ' -f5,6 | sed 's/^\(.*\) (\(.*\))/ssh
    \1@\2/g'
}
listip_ssh () {
    listips | grep "for" | cut -d' ' -f5,6 | sed 's/^\(.*\) (\(.*\))/ssh root@\2:\/home\/\1/g'
}

www_lynx() {
    lynx -dump $1 | awk '/http/{print $2}' | egrep "^https{0,1}"
}


ww_colors_term()
    {for code in $(seq -w 0 255); do for attr in 0 1; do printf
    "%s-%03s %bTest%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m"
    "\e[m"; done; done | column -c $((COLUMNS*2))
}


######################################## Main

# Start-up
star_Level_one
echo -e "\t\t\t\t $(date)"

#cat /home/ahmed/zdotfiles/4/time/jeddah-pt | grep "^$(date '+%d')"

############################################################################################################################################################


wbook() {
    egrep "$1" /home/ahmed/Dropbox/C/Foundation/books.txt | grep -oG ").\(.*\)" | sed 's/).\s\+\(.*\)/\1/g'
}

fbook() {
    egrep "$1" /home/ahmed/Dropbox/C/Foundation/book-DCAR
}


wy_readline() {
    tail -F /var/log/nginx/access.log | python -c 'exec("import sys,time\nl=0\ne=int(time.time())\nfor line in sys.stdin:\n\tt = int(time.time())\n\tl += 1\n\tif t > e:\n\t\te = t\n\t\tprint l\n\t\tl = 0")'
}

wy_append_line(){
    # Append the line # -*- coding: utf-8 -*- to a file
    sed -i -e '1i \# -*- coding: utf-8 -*-'
}





# Dropbox login using only curl, sed and bash
#link=https://www.dropbox.com/login ; curl -b a -c cookie -d "t=$(curl -c a $link | sed -rn 's/.*TOKEN: "([^"]*).*/\1/p')&login_email=me%40yahoo.com&login_password=my_passwd" $link

# english <--> german translation with dict.leo.org
#leo() { lang=en; IFS=+; Q="${*// /%20}"; curl -s "https://dict.leo.org/${lang}de/?search=${Q//+/%20}" | html2text | grep -EA 900 '^\*{5} ' | grep -B 900 '^Weitere Aktionen$';}

# Google verbatim search on your terminal
#function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }

# Search google.com on your terminal
#Q="YOURSEARCH"; GOOG_URL="http://www.google.com/search?q="; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}\"${Q/\ /+}\"" | grep -oP '\/url\?q=.+?&amp' | sed 's/\/url?q=//;s/&amp//'); echo -e "${stream//\%/\x}"


# Fetches a Reddit user's ($USER) link karma
#curl -s http://www.reddit.com/user/$USER/about.json | tr "," "\n" | grep "link_karma" | tr ": " "\n" | grep -E "[0-9]+" | sed s/"^"/"Link Karma: "/


#bash ~/zdotfiles/4/time/zprayertime.sh

wpic()
{
    while true; do sleep 3; scrot '%Y-%m-%d-%s_$wx$h_wscrot.png' -e 'mv $f ~/images/shots/'; ls ~/images/shots;done
}
#$(pgrep easystroke)

alias "wea_easystroke"="easystroke -c ~/.easystroke"
#echo ${TERM}


alias "w_term_colors"="msgcat --color=test"
