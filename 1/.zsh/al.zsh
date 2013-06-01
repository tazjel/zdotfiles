#
#Tue May 28 13:48:00 AST 2013
##
#
########################################################
# zdotfiles aliases
#
########################################################
zal=$HOME/zdotfiles/1/.zsh/al.zsh

alias 00=$HOME/zdotfiles
alias gal='cat $alf | grep'
alias al='alias | grep'

alias zz='vim $HOME/zdotfiles/1/.zsh/al.zsh && source $HOME/zdotfiles/1/.zsh/al.zsh'

alias zzzz=' vim $HOME/.zshrc && source $HOME/.zshrc'

alias -g wv='| vim -'
alias lh='ls -a | egrep "^\."'
alias lhd='ls -A | egrep "^\."'
#
#####################################
alias 'wl'='clear;pwd;ls;date -R;echo $PWD'

#################################
#rsync mobile 
alias wzi='rsync -e ssh -r --progress root@zphone.local:/var/mobile/qq.sh ~/qq.sh'

##alias 'wadd'='rsync -avz --progress -e  "ssh -p 2233" root@192.168.1.5:/var/mobile/AddressBook.sqlitedb ~/'
###############################
function zbp {
    for xx in ~/.* ;do
    rsync -avz --progress $HOME/.* $HOME/zzz_bkp
    echo $xx
done;
}

#
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias __="sudo"

#######################################

alias 'w'='ls -alF;pwd;date'
alias 'ww'='vim'
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
    echo "" >> $zal
    echo "alias '$1'='$2'" >> $zal
    source $zal
    echo "" && echo "- Alias added  $1 = $2 " && echo "";
}




##########
function glll {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push -all
    git push origin --all && git push origin --tags
}
#############################
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias xclip='xclip -selection c'

alias 'n1'='dpkg --get-selections | grep linux-image'
alias 'kla'="ls -a | grep '^\.'"
alias 'klj'='ls -a | grep "^\.\(.*\)n$"'


alias 1='cd -'
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
alias wfreq='cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30'
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
alias rename=mv
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


#bu () {
    #cp $1 `basename $1`-`date +%Y%m%d%H%M`.backup ;
#}

hack()
{
    var=$(history | ack $1 | wc -l)
    if (( $var > 22 ))
    then
        history | ack $1 | less
    else
        history | ack $1
    fi
}


function wW_grep_logs(){
    grep "$1" */logs/*.log
}

###


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

alias 'wmw_mlterm_bblack_whati'=' mlterm -b=black -f=white -w=16'


alias 'ww_chmodX'='chmod +x'

alias 'ww_chmod_x'='chmod -x'

alias '__r'='sudo reboot'

function Ww () {
ag -C 3 $(echo "$1") $(echo $HOME/zdotfiles)
}

#Ww lsof G net | sed 's/###/\n\n###/'g | sed 's/##/\n\n##/g' | sed 's/#\!bin/\n\n#\!\/bin/g' | sed 's/\+alias/#\n   +alias/g'

alias 'Ww_aptitude'='sudo aptitude -f'

alias 'Ww_apt-cache_search_xfce4'='apt-cache search xfce4'

alias 'agg'='sudo apt-get update && sudo apt-get upgrade'

alias 'b'='clear;ls;pwd;date'

alias '66'='cd $HOME/zdotfiles/6'

alias 'ww_firefox_editor'="firefox 'data:text/html, <html contenteditable>' "
##########################################################################3#
#
#
#
#
#web2py
#
alias '99'='cd ~/zdotfiles/Projects/web2py'
alias '99_welcome/controllers/default'='cd $HOME/zdotfiles/Projects/web2py/web2py/applications/welcome/controllers'
alias '99w'='cd /home/abobanihh/zdotfiles/Projects/web2py/web2py/applications/welcome'
function ww_sixad {
    lsusb;dmesg;hcitool dev;hcitool con;
    echo " بسم الله ما شاء الله"
}



function ww_sixad_bluetooth_restart {
    sudo service bluetooth restart;
}








alias 'ww_ff_search'='firefox -search'

alias -g 'H'="--help"
alias -g 'wH'="--help | grep "






cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R - }

####################################################
#
#
function ww_send_gmail 
{
echo "Your Email :  " && read Email;
echo " Enter Password : " && read pw;
echo "Send To : " && read mailto ;
curl --url "smtps://smtp.gmail.com:465" --ssl-reqd --mail-from "$(echo $Email)" --mail-rcpt "$(echo $mailto)" --upload-file mail.txt --user "$(echo $Email):$(echo $pw)" --insecure;
}
#
#
########################3
#
alias 'wx'='chmod +x'

alias 'wX'='chmod -x'

alias '11'='cd /home/abobani/zdotfiles/1'

alias 'W'='echo'

alias 'w-grep'='grep -vE "^$|^[\s]*[;#]"'

 #'ws'='PS3="Enter a number: "; select f in *;do $EDITOR $f; break; done"

function wwrename {
    for file in * ; do
    mv "$file" `echo "$file" | tr ' ' '_' | tr '[A-Z]' '[a-z]'`;
    done;
}

alias 'wtst'='cd ~/tst'

alias 'wlv'='ls -a | grep vim'
alias 'wlz'='ls -a | grep zsh'

alias 'wdev'='hcitool dev'
