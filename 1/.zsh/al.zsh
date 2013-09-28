#!/bin/zsh
########################################################
# Author : AHMED BANI
# Zero Dimension : Repository
# Eighth Dimension : web
#

if [ "$TERM" = "linux" ]; then
echo -en "\e]P0000000" #black
    echo -en "\e]P8555753" #darkgrey
    echo -en "\e]P1a40000" #darkred
    echo -en "\e]P9cc0000" #red
    echo -en "\e]P24e9a06" #darkgreen
    echo -en "\e]PA73d216" #green
    echo -en "\e]P3edd400" #brown
    echo -en "\e]PBffc123" #yellow
# echo -en "\e]PBc4a000" #yellow
    echo -en "\e]P4204a87" #darkblue
    echo -en "\e]PC3465a4" #blue
    echo -en "\e]P5ce5c00" #darkmagenta
    echo -en "\e]PDf57900" #magenta
# echo -en "\e]P6038e82" #darkcyan
# echo -en "\e]PE05d2c1" #cyan
    echo -en "\e]P689b6e2" #darkcyan
    echo -en "\e]PE46a4ff" #cyan
    echo -en "\e]P7babdb6" #lightgrey
    echo -en "\e]PFd3d7cf" #white
    clear #for background artifacting
fi






# <F8>

www_wget() {
    wget --recursive  --page-requisites --convert-links
}
alias 'wxd'='lynx -dump'

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
    easystroke show
    setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
    setxkbmap -option ctrl:nocaps
    fi
}
set_xkeyboard
is_linux() {
    if [[ $(uname) = "Linux" ]];then
        echo "Yes"
        easystroke show
        set_xkeyboard
    fi
}


star_Level_one() {
    echo -e "\t\t بسم الله الرحمن الرحيم | ماشاء الله ولا قوة الابالله"
}
# vi style incremental search
    export EDITOR="vim"
    bindkey -v

    bindkey '^R' history-incremental-search-backward
    bindkey '^S' history-incremental-search-forward
    bindkey '^P' history-search-backward
    bindkey '^N' history-search-forward

    setopt AUTO_CD

# Arabic aliases
        alias "سم"="alias"
        alias "قل"="echo"
        alias "اكتب"="vim"
        alias "اقرا"="cat"
        alias "اكتب عربي"="vim -A"
        alias "اعد"="zsh"
        alias "نظف"="clear"
        alias "بحث"="grep -iaR"
        alias "التاريخ"="date"

########################################################
# Path
alias 'wsr'='cd ~/src'
    alias 'p'='vim ~/zdotfiles/1/.zsh/DCAR.zsh'
    alias 'cdx'='cd ~/Dropbox/'
    alias 'cdd'='cd ~/Downloads'
    alias 'cdc'='cd $HOME/Dropbox/C/Foundation'
    alias 'cdx'='cd ~/Dropbox/'
    alias 'wak'='vim $HOME/.config/autokey/data'
    alias 'wkl'='cd $HOME/.config/autokey/data;ls'
    alias 'wvb'='wwww $HOME/.vim/bundle'
    alias 'h'='cd $HOME'
    alias 'zzzz'=' vim $HOME/.zshrc && source $HOME/.zshrc'

##########################


#sudo apt-add-repository --remove
    alias 'Ww_apt-cache_search_xfce4'='apt-cache search xfce4'
    alias 'Ww_aptitude'='sudo aptitude -f'
    alias 'agg'='sudo apt-get update && sudo apt-get upgrade'
    alias 'ppa'='sudo add-apt-repository $1'
    alias 'ppr'='sudo add-apt-repository --remove $1'
    alias 'wi'='sudo apt-get install'
    alias 'wwww_clean_history_get_install'="lg install | sed 's/install//g' | sed 's/^ //g' | sed 's/sudo aptitude//g' | sed 's/^[ ]apt-get//g'| sed 's/^alg.*$//g"
    alias acs='apt-cache search'
    alias acsh='apt-cache show'
    alias agdu='sudo apt-get dist-upgrade'
    alias agi='sudo apt-get install'
    alias agr='sudo apt-get remove'
    alias agu='sudo apt-get update'
    alias cpf='sudo aptitude clean && sudo aptitude purge && sudo aptitude -f install'
    alias install='sudo apt-get install'
    alias remove='sudo apt-get remove'

#ls-files
##########3                     ######################################
#
#
#
######################################################################



#############################
#
#
#
#
###########################################################
    alias 'cdx'='cd ~/Dropbox/'
    alias 'w7'='ssh'
    alias 'wG'='grep -E "(.*)($1)(.*)($2)(.*)"'
    alias 'wW_grep_1'='grep -GRh $1 ~ | sort | uniq -c | sort -nr >> $2 && tail  $2'
    alias "wwf"="cmdfu"
    alias 'GX'='grep -iaR "$1"--exclude-dir=cache'
    alias 'W'='echo'
    alias 'Ww_apt-cache_search_xfce4'='apt-cache search xfce4'
    alias 'Ww_aptitude'='sudo aptitude -f'
    alias '___'='sudo su'
    alias '__r'='sudo reboot'
    alias 'agg'='sudo apt-get update && sudo apt-get upgrade'
    alias 'alal'='cmdfu'
    alias 'cdx'='cd ~/Dropbox/'
    alias 'kk'='kate'
    alias 'kla'="ls -a | grep '^\.'"
    alias 'klj'='ls -a | grep "^\.\(.*\)n$"'
    alias 'n1'='dpkg --get-selections | grep linux-image'
    alias 'ppp'='sudo add-apt-repository $1'
    alias 'rmm'='rm -rf'
    alias 'w'='clear;ls -X;pwd;echo -e "\t\t\t$(date)"'
    alias 'w7'='ssh'
    alias 'wG'='grep -E "(.*)($1)(.*)($2)(.*)" '
    alias 'wW_grep_1'='grep -GRh $1 ~ | sort | uniq -c | sort -nr >> $2 && tail
 $2'
    alias 'wX'='chmod -x'
    alias 'w_RANDOMi'='echo $[RANDOM % 100]  # range 0-99'
    alias 'w_ak'='autokey -l'
    alias 'war'='setxmap -layout ar'
    alias 'wb'='blender --debug'
    alias 'wdev'='hcitool dev'
    alias 'wdr'='vim ~/Dropbox/'
    alias 'wdx'='docx2txt'
    alias 'wen'='setxmap -layout us'
    alias 'wf'='firefox -search'
    alias 'wfbash'='firefox -search bash command line "$@"'
    alias 'wfd'='find -maxdepth 1 -type d'
    alias 'wfx'='find ./ -name "*.sh" -exec chmod +x {} \;'
    alias 'wh'='tail -3000 ~/.zsh_history | cut -d";" -f2 | sort -u | grep'
    alias 'whis'='cut -f2 -d";" ~/.zsh_history | grep "$1" | sort -u'
    alias 'wi'='sudo apt-get install'
    alias 'wib'='ssh root@192.168.1.$(echo "$1")'
    alias 'wj'='joy2key'
    alias 'wjprayer'='wf "jeddah prayer time"'
    alias 'wjs'='jstest --normal /dev/input/js0'
    alias 'wl'='locale'
    alias 'wlen'='export LANG="en_US.UTF-8" '
    alias 'wlrs_sizels'='ls -lhR | grep -e "total\|:\$"' # list and get size
    alias 'wlv'='ls -a | grep vim'
    alias 'wlz'='ls -a | grep zsh'
    alias 'wml'='env SHELL=zsh mlterm --meta=esc --metakey=alt -E ar.SA.UTF-8 -f=green -b=black -0=green -R=30-40'
    alias 'wmsg'='dmesg | tail -15'
    alias 'wrvs_remove_vim_swap'='rm ~/.vimswap/*'
    alias 'wshut'='sudo shutdown -h now'
    alias 'wsix_kill_blue'='sudo killall -KILL bluetoothd'
    alias 'wst_string'="read -d '' iz <<"zx"" #Useage : wst_string <Enter> add your strings. Then, close by only typing zx #You can echo $iz
    alias 'wt'='cd ~/tst'
    alias 'wtst'='cd ~/tst'
    alias 'ww'='vim'
    alias 'ww-dmesg-sony'='dmesg | grep sony'
    alias 'ww-lsusb-grep-Sony'='lsusb| grep Sony'
    alias 'ww_check_bluetooth'='hciconfig'
    alias 'ww_chmodX'='chmod +x'
    alias 'ww_chmod_x'='chmod -x'
    alias 'ww_firefox_editor'="firefox 'data:text/html, <html contenteditable>' "
    alias 'wwraw'='sudo sixad-raw /dev/'
    alias 'wws'='PS3="nter a number: "; select f in *;do $EDITOR $f; break; done'
    alias 'www'='wfw'
    alias 'wwww'='cat'
    alias 'wwww_clean_history_get_install'="lg install | sed 's/install//g' | sed 's/^ //g' | sed 's/sudo aptitude//g' | sed 's/^[ ]apt-get//g'| sed 's/^alg.*$//g"
    alias 'wwww_which_ubuntu_dist'='cat /etc/issue'
    alias 'wx'='chmod +x'

    alias 'x'='exit'
    alias 'اسحب'='gpo'
    alias 'اعد'='__r'
    alias 'برامج'='acs'
    alias 'دف'='glll'
    alias 'كيفك'='gst'
    alias 'ما'='ls'
    alias 'من'='who'
    alias 'نصب'='wi'
    alias -g 'Gx'='--exclude-dir=cache .'
    alias -g 'H'="--help"
    alias -g 'wH'="--help | grep "
    alias -g 'wxc'='| xclip'
    alias -g G='| grep'
    alias -g Gh='--help | grep'

    alias -g wv='| vim -'
    alias ......='cd ../../../../../'
    alias .....='cd ../../../../'
    alias ....='cd ../../../'
    alias ...='cd ../../'
    alias ..1='cd ..'
    alias ..2='cd ../../../'
    alias ..3='cd ../../../../'
    alias ..4='cd ../../../../'
    alias ..5='cd ../../../../../'
    alias ..='cd ..'
    alias 1='cd -'
    alias __="sudo"
    alias a2-restart='sudo service apache2 restart'
    alias a2r='/etc/init.d/apache2 restart'
    alias aa='git add -A .'
    alias acs='apt-cache search'
    alias acsh='apt-cache show'
    alias agdu='sudo apt-get dist-upgrade'
    alias agi='sudo apt-get install'
    alias agr='sudo apt-get remove'
    alias agu='sudo apt-get update'
    alias al='alias | grep'
    alias aliasupdt='wget -q -O - "$@" https://alias.sh/user/1110/alias >> ~/.bash_aliases'
    alias assume='git update-index --assume-unchanged'
    alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
    alias c=clear
    alias cathtml='sed '\''s/<[^>]*>//g'\'
    alias cats='pygmentize -O style=monokai -f console256 -g'
    alias cbuild='mkdir build && cd build; cmake ..; make'
    alias ccat='pygmentize -O bg=dark'
    alias cgrep='grep --color=always'
    alias clip='xclip -sel clip'
    alias clr='clear;pwd;ls'
    alias co='git checkout '
    alias confcat='sed -e '\''s/[#;].*//;/^\s*$/d'\'' '
    alias convert_pdf='abiword --to=pdf '
    alias cp='cp -i'
    alias cpf='sudo aptitude clean && sudo aptitude purge && sudo aptitude -f install'
    alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
    alias d='dirs -v | head -10'
    alias ddel='rm -Rf'
    alias dfree='df -h -x tmpfs'
    alias display='less +F'
    alias eg='git config -e'
    alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash'
    alias erase='shred -n 35 -z -u'
    alias fpy='find . -name "*[py]" -exec grep -is /dev/null $1 {} \;'
    alias frc='find . -name "*[rc]" -exec grep -is /dev/null $1 {} \;'
    alias freenodetor='dig +short irc.tor.freenode.net cname'
    alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
    alias fsh='find . -name "*[sh]" -exec grep -is /dev/null $1 {} \;'
    alias ftx='find . -name "*[txt]" -exec grep -is /dev/null $1 {} \;'
    alias fwn='find -wholename'

#zdotfiles
    alias '11'='clear;pwd;cd ~/zdotfiles/1;ls -X'
    alias '111'='vim ~/zdotfiles/1.sh'
    alias '1111'='bash ~/zdotfiles/1.sh'
    alias '22'='clear;pwd;cd ~/zdotfiles/2;ls -X'
    alias '33'='clear;pwd;cd ~/zdotfiles/3;ls -X'
    alias '44'='clear;pwd;cd ~/zdotfiles/4;ls -X'
    alias '55'='clear;pwd;cd ~/zdotfiles/5;ls -X'
    alias '66'='clear;pwd;cd ~/zdotfiles/6;ls -X'
    alias '77'='clear;pwd;cd ~/zdotfiles/7;ls -X'
    alias '88'='clear;pwd;cd ~/zdotfiles/8;ls -X'
    alias '99'='cd ~/zdotfiles/Projects/web2py'
    alias '99'='clear;pwd;cd ~/zdotfiles/9;ls -X'
    alias '99_welcome/controllers/default'='cd $HOME/zdotfiles/Projects/web2py/web2py/applications/welcome/controllers'
    alias '99w'='cd /home/abobanihh/zdotfiles/Projects/web2py/web2py/applications/welcome'
    alias 'vv'='vim ~/zdotfiles/2/.vimrc.local'
    alias 'w'='clear;ls -X;pwd;echo -e "\t\t\t$(date)"'
    alias 'wWw'='/usr/bin/python ~/zdotfiles/9/web2py/web2py.py'
    alias 'wfw'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'
    alias 'wsix'='source ~/zdotfiles/1/01/gui_3_bash.sh'
    alias '00'='$HOME/zdotfiles'
    alias 'z'='vim $HOME/zdotfiles/1/.zsh/al.zsh && source $HOME/zdotfiles/1/.zsh/al.zsh'

# <F0> git
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
    alias gfind='find . -print0  | xargs -0 egrep -I '
    alias gg='sr google -browser='
    alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
    alias ggpush='git push origin $(current_branch)'
    alias gl='git pull'
    alias glg='git log --stat --max-count=5'
    alias glgg='git log --graph --max-count=5'
    alias glgga='git log --graph --dcorate --all'
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


    #
#ls-files
    alias heroku='nocorrect heroku'
    alias hh='history -$1 | grep'
    alias hh='history | grep --color=auto'
    alias hpodder='nocorrect hpodder'
    alias ifconfig-ext='curl ifconfig.me'
    alias install='sudo apt-get install'
    alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
    alias ips='ifconfig -a | grep -o '\''inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)'\'' | sed -e '\''s/inet6* //'\'
    alias ipy='python -c '\''import IPython; IPython.frontend.terminal.ipapp.launch_new_instance()'\'
    alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
    alias k9='kill -9'
    alias k='gitk --all &'
    alias l.='ls -d .* --color=auto'
    alias l='ls -ltr'
    alias la='ls -A'
    alias lba='cd ~/Library/Application\ Support/LaunchBar/Actions'
    alias le='ls --sort=extension'
    alias lf='ls -Gl | grep ^d'
    alias lh='ls -a | egrep "^\."'
    alias lhd='ls -A | egrep "^\."'
    alias listips='nmap -sP 192.168.1.1/24'
    alias ll='ls -l'
    alias lla='ls -lhFA'
    alias lldu='find -maxdepth 1 -mindepth 1 -type d -exec du -sh {} \;'
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
    alias md='mkdir -p'
    alias netlisteners='lsof -i -P | grep LISTEN'
    alias netstat='netstat -pantu'
    alias no-assume='git update-index --no-assume-unchanged'
    alias poogle='ping google.com'
    alias ppm='git push origin master'
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
    alias wfreq='cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30'
    alias wwfreq='cat ~/.zsh_history  | head -n 300'
    alias xclip='xclip -selection c'
    alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
########################################################
# F2
########################################################
# <F3>
########################################################
alias "wwf"="cmdfu"

function sw ()
{
    today=`date +%Y_%m_%d_%h_%s`
    scrot '$today_srot.png' -e 'mv $f ~/images/shots/'
}
function wsw() {
    today=`date +%d_%s`;echo $today; scrot "$today"_shot.png -e 'mv $f ~/images/shots/';ls ~/images/shots
}

function wpw_capture_pic_every_2 () {
    i=0;while :; do i=$(expr "$i" + 1); scrot "$i".png; sleep 2; done;
}
function zbp {
    mkdir -p $HOME/Dropbox/zzz_bkp
    for xx in ~/.* ;do
    rsync -avz --progress $HOME/.* $HOME/Dropbox/zzz_bkp
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
    echo "" && echo "- Alias added  $1 = $2 " && echo "";
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
    echo "alias '$1'='$2' " >> $zal
    source $zal

    echo "" && echo "- Alias added  $1 = $2 " && echo "";
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
    function google() {
    Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q=';
    AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\
        /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||');
    echo -e "${stream//\%/\x}";x }
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

function ww_sort() {
    sort -u
}


function wpkl () {
    dpkg --get-selections > ~/zdotfiles/0/packages-alpha.txt
}
wssh () { listips | grep "for" | cut -d' ' -f5,6 | sed 's/^\(.*\) (\(.*\))/ssh
    \1@\2/g'}


listip_ssh () {
    listips | grep "for" | cut -d' ' -f5,6 | sed 's/^\(.*\) (\(.*\))/ssh root@\2:\/home\/\1/g'
}
alias 'ww_tail_zsh_history'='tail -3000 ~/.zsh_history | cut -d";" -f2'
www_lynx() {
    lynx -dump $1 | awk '/http/{print $2}' | egrep "^https{0,1}"
}


ww_colors_term()
    {for code in $(seq -w 0 255); do for attr in 0 1; do printf
    "%s-%03s %bTest%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m"
    "\e[m"; done; done | column -c $((COLUMNS*2))
}

    # bash defines the following built-in commands:
    #   :, ., [, alias, bg, bind, break, builtin, case, cd, command, compgen, complete, continue, declare, dirs
    #   disown, echo, enable, eval, exec, exit, export, fc, fg, getopts, hash, help, history, if, jobs, kill,
    #   let, local, logout, popd, printf, pushd, pwd, read, readonly, return, set, shift, shopt, source, suspend
    #   test, times, trap, type, typeset, ulimit, umask, unalias, unset, until, wait, while

# Connectives for `test'
    # ! EXPR  -  True if EXPR is false.
    # EXPR1 -a EXPR2  -  True if both EXPR1 and EXPR2 are true.
    # EXPR1 -o EXPR2  -  True if either EXPR1 or EXPR2 is true.

    # File type tests
    # -b FILE  -  True if FILE exists and is a block special device.
    # -c FILE  -  True if FILE exists and is a character special device.
    # -d FILE  -  True if FILE exists and is a directory.
    # -f FILE  -  True if FILE exists and is a regular file.
    # -L FILE  -  True if FILE exists and is a symbolic link.
    # -p FILE  -  True if FILE exists and is a named pipe.
    # -S FILE  -  True if FILE exists and is a socket.
    # -t FD  -  True if FD is a file descriptor that is associated with a terminal.

    # Access permission tests
    # -g FILE  -  True if FILE exists and has its set-group-id bit set.
    # -k FILE  -  True if FILE has its "sticky" bit set.
    # -r FILE  -  True if FILE exists and is readable.
    # -u FILE  -  True if FILE exists and has its set-user-id bit set.
    # -w FILE  -  True if FILE exists and is writable.
    # -x FILE  -  True if FILE exists and is executable.
    # -O FILE  -  True if FILE exists and is owned by the current effective user id.
    # -G FILE  -  True if FILE exists and is owned by the current effective group id.

    # File characteristic tests
    # -e FILE  -  True if FILE exists.
    # -s FILE  -  True if FILE exists and has a size greater than zero.
    # FILE1 -nt FILE2  -  True if FILE1 is newer (according to modification date) than FILE2, or if FILE1 exists and FILE2 does not.
    # FILE1 -ot FILE2  -  True if FILE1 is older (according to modification date) than FILE2, or if FILE2 exists and FILE1 does not.
    # FILE1 -ef FILE2  -  True if FILE1 and FILE2 have the same device and inode numbers,  i.e., if they are hard links to each other.

    # String tests
    # -z STRING  -  True if the length of STRING is zero.
    # -n STRING
    # STRING  -  True if the length of STRING is nonzero.
    # STRING1 = STRING2  -  True if the strings are equal.
    # STRING1 != STRING2  -  True if the strings are not equal.

    # Numeric tests
    # ARG1 -eq ARG2
    # ARG1 -ne ARG2
    # ARG1 -lt ARG2
    # ARG1 -le ARG2
    # ARG1 -gt ARG2
    # ARG1 -ge ARG2
############################################################################################################################################################

######################################## Main

# Start-up
star_Level_one
echo -e "\t\t\t\t $(date)"

############################################################################################################################################################

alias 'wbook_Press'='wbook Press'

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


# Fetch the current human population of Earth
dcar_human_population(){
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

# check your up to date delicious links.
#curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 --stdin --complete -v -t 50 -F blacklist
wgp() {
    python -c 'exec("import sys,os\nfor line in sys.stdin:\n\tprint line")'
}

#bash ~/zdotfiles/4/time/zprayertime.sh

