
alias wbig='find . -type f -exec du -sh {} + | sort -hr | head'
#
# Put a console clock in top right corner
#while true; do echo -ne "\e[s\e[0;$((COLUMNS-27))H$(date)\e[u"; sleep 1; done &
# Symlink all files from a base directory to a target directory
#for f in $(ls -d /base/*); do ln -s $f /target; done && ls -al /target
#
alias 'wzsh_history'='tail -f .zsh_history | while read line; do echo -n $(date -u -Ins); echo -e "\t$line"; done'

function wwiki () {
./zdotfiles/Tools/wikisole.sh $1
}

#mkdir -p /home/bani/.zdotfiles/vimbackup/
function wwgg (){
    curl -u tazjel --silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'
}



#function wgmail () {
#curl -u tazjel --silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t''
#}

function wpr {
grep '^'$(date +\%d) $HOME/zdotfiles/Time/$(date +\%m) | awk '{print " \n\n Fajer   : " $2 "\n SHAROOK : " $3 "\n Dohr    : " $4  "\n ASER    : " $5  "\n MAGREP  : " $6  "\n ISHA    : " $7 }'
}

# zdotfiles aliases
alias 'wtoday'='grep "^"$(date +\%d) $HOME/zdotfiles/Time/april_prayertime'
# tail -n3 .zsh_history | sort -u | sed 's/^.*\;//g' >> zdotfiles/6/wfindw ; tail zdotfiles/6/wfindw
# find /var/cache/apt -not -mtime -7
alias wbg='ls -Sh **/*(.Lm+30) | tail'
alias wlv='find ~ -maxdepth 1 -mindepth 1 -name   \*vim\* -type f'
alias wlz='find ~ -maxdepth 1 -mindepth 1 -name   \*zsh\* -type f'
alias wd='du -h --time --max-depth=1 | sort -hr #######################################################'
#wip | grep S | cut -d' ' -f 6
alias wipsj='nmap -sP 192.168.1.0/24 | grep "Nmap scan report for" | grep S | cut -d" " -f 6 '
alias wip_host='nmap -sP 192.168.1.0/24 | grep "Nmap scan report for"| cut -d' ' -f 5'
alias wips='nmap -sP 192.168.1.0/24 | grep "Nmap scan report for"| cut -d' ' -f 6'
alias wip='nmap -sP 192.168.1.0/24 | grep "Nmap scan report for" '
alias wff='diff -qr "$1" "$2" '
#diff -u <(grep -vE '^(#|$)' file1) <(grep -vE '^(#|$)' file2)
function cmdfu(){ local t=~/cmdfu;echo -e "\n# $1 {{{1">>$t;curl -L "commandlinefu.com/commands/matching/$1/`echo -n $1|base64`/plaintext"|sed '1,2d;s/^#.*/& {{{2/g'>$t;vim -u /dev/null -c "set ft=sh fdm=marker fdl=1 noswf" -M $t;rm $t; }
alias wd='cal ; date +%c'
alias 'whh'='grep "$1" ~/.zsh_history'
alias ba='less ~/.bash_aliases'
alias apt="sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean"

alias 'Ww_dmesg'='sudo dmesg | tail -4'
#Q="YOURSEARCH"; GOOG_URL="http://www.google.com/search?q="; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}\"${Q/\ /+}\"" | grep -oP '\/url\?q=.+?&amp' | sed 's/\/url?q=//;s/&amp//'); echo -e "${stream//\%/\x}"

function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }
#for i in $(ls ~/script); do alias s_$i='sh ~/script/$i';done;
#
#1
#
#alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""

alf=$HOME/.oh-my-zsh/lib/aliases.zsh

alias wal='cat $alf | grep'
alias al='alias | grep'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh && source $HOME/.oh-my-zsh/lib/aliases.zsh'

alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'

alias lh='ls -a | egrep "^\."'
alias lhd='ls -A | egrep "^\." '
#
#####################################
#alias 'wWcll'='clear;pwd;ls;date -R;echo $PWD'

#################################
#  rsync
#

#rsync mobile
alias wzi='rsync -e ssh -r --progress root@zphone.local:/var/mobile/qq.sh ~/qq.sh'

##alias 'wadd'='rsync -avz --progress -e  "ssh -p 2233" root@192.168.1.5:/var/mobile/AddressBook.sqlitedb ~/'
###############################
alias 'zrf1'="rsync -avz --progress '$1' '/media/Transcend/w/$1'"
function zbp() {
    for xx in ~/.* ;do
    rsync -avz --progress $HOME/.* $HOME/zrsync
    echo $xx
done;
}

#sudo showkey -k
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias __="sudo"

alias 'cc'='vim /home/bani/zdotfiles/Tools/1/aliasw.sh'

#######################################
#alias 'wwww'='mv "$1" /media/Transcend/tools/w/Inbox/"$2" ;ls . ;ls /media/Transcend/tools/w/Inbox'

alias 'wWw'='vim /home/bani/.config/updot/updot.conf'
alias 'wW'='pwd'
alias 'w'='ls -alt;echo $pwd;date'
alias 'ww'='vim'
alias 'www'='cat'
#alias 'wwwww'='sudo su'

alias 'ppp'='sudo add-apt-repository $1'
alias hh='history -$1 | grep'

alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'

alias 'zcpz'='cp -u /home/bani/.oh-my-zsh/lib/aliases.zsh /home/bani/zdotfiles/Tools/1/1/aliases.zsh'
alias 'zcpv'='cp -u /home/bani/.vimrc.local /home/bani/zdotfiles/Tools/2/.vimrc.local'
alias 'rmm'='rm -rf'

alias pp='vim $HOME/zdotfiles/Tools/0/0/apt-get.txt'
######################################################################
alias ..='cd ..'
alias pp='vim $HOME/zdotfiles/Tools/0/0/apt-get.txt'

alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ..1='cd ..'
alias ..2='cd ../../../'
alias ..3='cd ../../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

######################################################################
######################################################################
######################################################################



#============================================
########## zdotfiles
#
function WW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $HOME/zdotfiles/.oh-my-zsh/lib/waliases.zsh
    echo "###" >> $HOME/zdotfiles/.oh-my-zsh/lib/waliases.zsh
    echo "alias '$1'='$2'  " >> $HOME/zdotfiles/.oh-my-zsh/lib/aliases.zsh
    source $HOME/zdotfiles/.oh-my-zsh/lib/aliases.zsh
    echo "" && echo "- Alias added  $1 = $2 " && echo "";
}


function ccc() {
    echo "$1" >> /home/bani/zdotfiles/Tools/1/aliasw.sh
    echo "Now, we got '$1' "
    cat '/home/bani/zdotfiles/Tools/1/aliasw.sh'
    echo '/home/bani/zdotfiles/Tools/1/aliasw.sh'
}



##########
function glll {
    cd $HOME/zdotfiles;
    git add -A
    git commit -a
    git push origin master;
}
##########
#

#############################
############ testing ########
##################################
                    # functions
#


alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'

##############  testing functions #########
#
alias 'n1'='dpkg --get-selections | grep linux-image'
alias 'kla'="ls -a | grep '^\.'"
alias 'klj'='ls -a | grep "^\.\(.*\)n$"'



alias 1='cd -'
alias 2='cd +2'
alias 2d='cd ../../'
alias 3='cd +3'
alias 3d='cd ../../../'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias W='echo'
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias aliasupdt='wget -q -O - "$@" https://alias.sh/user/1110/alias >> ~/.bash_aliases'
alias assume='git update-index --assume-unchanged'
alias back='cd -'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias c=clear
alias cat='pygmentize -O style=monokai -f console256 -g'
alias cathtml='sed '\''s/<[^>]*>//g'\'
alias cbuild='mkdir build && cd build; cmake ..; make'
alias ccat='pygmentize -O bg=dark'
alias cd='HOME="$OLDPWD" cd'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'
alias cgrep='grep --color=always'
alias clip='xclip -sel clip'
alias clr='clear;pwd;ls'
alias co='git checkout '
alias confcat='sed -e '\''s/[#;].*//;/^\s*$/d'\'' '
alias convert_pdf='abiword --to=pdf '
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias edit-aliases='nano ~/.bash_aliases'
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias eg='git config -e'
alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash'
alias erase='shred -n 35 -z -u'
alias fin='find -iname'
alias fn='find -name'
alias freenodetor='dig +short irc.tor.freenode.net cname'
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
alias fwn='find -wholename'
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
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias gist='nocorrect gist'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias gk='gitk --all&'
alias gl='git pull'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias globurl='noglob urlglobber '
alias gm='git merge'
alias go='git checkout '
alias got='git '
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
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias listips='nmap -sP 192.168.2.0/24'
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
alias lscleanup='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
alias lsd='ls -Gal | grep ^d'
alias lt='ls --sort=time'
alias man='nocorrect man'
alias md=mkdir
alias mkdir='nocorrect mkdir'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias mv='nocorrect mv'
alias myip='curl ip.appspot.com'
alias mysql='nocorrect mysql'
alias netlisteners='lsof -i -P | grep LISTEN'
alias netstat='netstat -pantu'
alias nfas='grep -c "^>"'
alias no-assume='git update-index --no-assume-unchanged'
alias open=xdg-open
alias please=sudo
alias pm='git push origin master'
alias poogle='ping google.com'
alias process='ps -ax'
alias prs='ps faux|grep -v grep|grep "$@"'
alias psf='ps auxf'
alias psg='ps -ef |grep '
alias pubip='curl ifconfig.me'
alias qfind='find . -name '
alias qless='qstat -u "*" | less'
alias rd=rmdir
alias realias='$EDITOR ~/.bash_aliases && source ~/.bash_aliases'
alias refunction='$EDITOR ~/.bash_functions && source ~/.bash_functions'
alias reload='source $HOME/.bashrc 1>/dev/null'
alias remove='sudo apt-get remove'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias rm='rm -I'
alias sa='ssh-add '
alias sc='screen -S'
alias scp='scp -p'
alias scw='screen -wipe'
alias sdi='sudo dpkg -i'
alias sl='screen -ls'
alias sls='screen -ls'
alias snlcp='tr -d "\n" | pbcopy'
alias source-private-aliases='source <(wget -t 3 -q -O - "$@" https://alias.sh/user/$ALIAS_SH_USER_ID/alias/key/$ALIAS_SH_USER_KEY)'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias ssh-config='nano ~/.ssh/config'

alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'

alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'

alias temp='/opt/vc/bin/vcgencmd measure_temp'

alias tm='ps -ef | grep'

alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'


alias uncomment='egrep -v "^#|^$"'

alias unzip-all='7z x -y '\''*.zip'\'

alias up_master='git push origin master'



###
alias '¨wK¨'='¨sudo'
#sudo apt-cache rdepends kde-runtime-data | grep "^ .*" | tr '\n' ' ' > ~/backed_up_package_list


-

###
#alias '#instll'='#txt2regex'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

###
#Get the IP address of a machine. Just the IP, no junk
#
#alias 'wgm'='curl -u abobani --silent https://mail.google.com/mail/feed/atom | perl -ne 'print t if /<name>/; print n if /<(title|name)>(.*)<\/\1>/;''
#
#/sbin/ifconfig -a |sed -n 's/.*addr:\(.*\)[ ]*Bcast.*/\1/p'
#
#/sbin/ifconfig $(netstat -rn | grep "^0.0.0.0" | awk '{print $8}') | awk -F: '/inet addr/ {printf("%s\n",substr($2,1,index($2," "))) }'
#
#
#ifconfig $if | egrep -o "inet addr:[^ ]*"
#
#
#
#/sbin/ifconfig $(netstat -rn | grep "^0.0.0.0" | awk '{print $8}') | awk -F: '/inet addr/ {printf("%s\n",substr($2,1,index($2," "))) }'
#
#ifconfig $(route|grep default|awk '{ print $8 }')|grep 'inet addr:' | sed 's/.*addr\:\(.*\) Bcast\:.*/\1/'
#
##

#route -n | egrep "^0." | awk '{print "Gateway to the Word: "$2", via "$NF""}'

#-ifconfig eth0
#ifconfig eth0 | grep inet | awk '{print $2}' | cut -d ':' -f2
#

###
alias 'Wssw'='ss -p | cat'

###
alias 'w_functions'='declare -f'

###
alias 'wmkdir'='mkdir -p /home/bani/doc/bar && cd $_'

####
#alias 'bfile'=' function which creates a backup of an file

#bu () {
    #cp  -201304101011.backup ;
#}'
 #function which creates a backup of an file

#bu () {
    #cp $1 `basename $1`-`date +%Y%m%d%H%M`.backup ;
#}
#ooo

#WWW(){
        #echo -n "Comment> "
        #read comment
        #name="$1"
        #shift
        #echo "alias $name=\"$*\" $comment" >> $HOME/.zshenv"
        #alias $name="$*"
#}


#hack()
#{
    #var=$(history | ack $1 | wc -l)
    #if (( $var > 22 ))
    #then
        #history | ack $1 | less
    #else
        #history | ack $1
    #fi
#}


function wW_grep_logs(){
    grep "$1" */logs/*.log
}

###

alias 00=$HOME/zdotfiles
alias 11=$HOME/zdotfiles/1
alias 22=$HOME/zdotfiles/2

alias 33$HOME/zdotfiles/3
alias 44$HOME/zdotfiles/4
alias 55$HOME/zdotfiles/5
alias 66$HOME/zdotfiles/6
alias 'wW_sudo_su'='sudo su'
        alias 'wW_grep_1_2'='grep -GRh $1 ~ | sort | uniq -c | sort -nr >> $2 && tail  $2'
alias 'wW_grep_1'='grep $1 ~/.zsh_history | sort | uniq -c | sort -nr'
alias -g 'wW___help'='--help'
alias -g Gh='--help | grep'
alias -g G='| grep'

###
alias 'wW__for_in1_do_2'='for i in $1;do $2;done;'
#ls -lF /etc; pwd;who;ps
#
##!/bin/bash
function ww10 {
for i in $(seq 0 10);do
    echo $i
done
}


#function ww_diff {
#find . -type f -name '*.csv' -exec sh -c '
  ##file="$0"
  ##echo "$file"
  ##diff "$file" "/some/other/path/$file"
  ##read line </dev/tty
##' {} ';'
##}


#function alg {
#grep $1 $HOME/.zsh_history | sed 's/^.*;//g'

#}

#alias wwww_ksystemlog='/usr/bin/ksystemlog --icon utilities-log-viewer -caption KSystemLog'
#ft() {

#find . -name "$2" -exec grep -il "$1" {} \;
#}

#alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
#alias l.='ls -d .* --color=auto'
#alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
#alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
#alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
#alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

####
alias 'wW_aptitude'='sudo aptitude -f'
alias '_r'='sudo reboot'  
#while read line; do echo "$(date),$(hostname),$line"; done < somefile.txt
