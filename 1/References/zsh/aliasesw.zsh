alias findInHistory="history |grep "

alias debinstall="sudo dpkg -i "

n (){
($* ; notify-send "Command over" "$*")
}

alias la='ls -lah --color=auto'

alias ls ="ls -la --color=auto"

# get rid of command not found
alias cd..='cd ..'
 
# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'

i() {
  (head -n 5; tail -n 5) < "$1" | column -t
}

alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"

alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"

alias listips='nmap -sP 192.168.2.0/24'


alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

alias cat='pygmentize -O style=monokai -f console256 -g'

git rm $(git ls-files -d)

remotediff () {
  vimdiff <(curl -s $1) <(curl -s $2)
}

alias netstat='netstat -pantu'

alias scp='scp -p'

alias ll='ls -alF'

alias source-aliases='source <(wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias)'

alias source-private-aliases='source <(wget -t 3 -q -O - "$@" https://alias.sh/user/$ALIAS_SH_USER_ID/alias/key/$ALIAS_SH_USER_KEY)'

alias source-aliases=source <(wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias)

alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

alias whois="whois -h whois-servers.net"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

alias lba="cd ~/Library/Application\ Support/LaunchBar/Actions"

alias dl="cd ~/Downloads"

alias d="cd ~/Dropbox"

alias -- -="cd -"

alias pubip='curl ifconfig.me'

alias update-private-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias/key/$ALIAS_SH_USER_KEY > ~/.bash_aliases && source ~/.bash_aliases"

alias func+='typeset -f'

alias func+=typeset -f

alias func='compgen -A function'

compgen -A function

hardstatus alwayslastline; 
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B} %d/%m %{W}%c %{g}]'
~;

alias df='df -h'

alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'

egrep --exclude-dir=vendor --exclude-dir=tmp --exclude-dir=log "(binding.pry)|(console.log\(.+\))|(alert\(.+\))" -inR *

function constats()
  {
    netstat -nat | awk '{print $6}' | sort | uniq -c | sort -n
  }


function alias-up() {
    if ([ $# -eq 0 ])
    then
            echo "Usage: getAliasSh AliasUserID"
    else
            wget -q -O - "$@" https://alias.sh/user/"$1"/alias > ~/.bash_aliases
            source ~/.bash_aliases
    fi
}

alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"

alias qfind="find . -name "

alias dfree="df -h -x tmpfs"

calc(){ awk "BEGIN{ printf(\"%.7g\n\",$*) }" ;}

function adal {
desc="ADD DESCRIPTION..."
if [ -n "$3" ]; then
desc="$3"
fi  
echo "" >> ~/.bash_aliases
echo "###" >> ~/.bash_aliases
echo "##

$desc" >> ~/.bash_aliases
echo "#" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "alias '$1'='$2'" >> ~/.bash_aliases
source ~/.bash_aliases
echo "" && echo "- Alias added -" && echo ""
}

alias zshconfig="subl ~/.zshrc"

k9 () { 
  kill -9 `ps -ef | grep $1 | grep -v grep | awk '{print $2}'`; 
}

k9 () { 
  sudo kill -9 `ps -ef | grep $1 | grep -v grep | awk '{print $2}'`; 
}

alias ls='ls -a'

alias ezshrc='emacs ~/.zshrc* &'

alias resource='source ~/.zshrc'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -lA'

function shweather { curl -s http://newsrss.bbc.co.uk/weather/forecast/1713/Next3DaysRSS.xml | awk -F'</*title>' '!a[$2]++&&NF!=1 {gsub("&#xB0;","",$2); print $2}'; }


alias snlcp='tr -d "\n" | pbcopy'

alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'

alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

gif-ify() {
  if [[ -n "$1" && -n "$2" ]]; then
    ffmpeg -i $1 -pix_fmt rgb24 temp.gif
    convert -layers Optimize temp.gif $2
    rm temp.gif
  else
    echo "proper usage: gif-ify <input_movie.mov> <output_file.gif>. You DO need to include extensions."
  fi
}

alias llocal='ifconfig eth0 | grep inet6'

alias 2d='cd ../../'
alias 3d='cd ../../../'

alias eg="git config -e"

alias ddel="rm -Rf"

alias agi="sudo apt-get install -y"

alias convert_pdf="abiword --to=pdf $1"

for FILE in $(grep -r "zw52.ru" * | awk '{print $1}' | cut -f1 -d\:); do sed -i "s&<iframe src=\"http://www.zw52.ru/wp-content/upgrade/update
.php\" width=\"2\" height=\"2\" frameborder=\"0\"></iframe></head>&</head>&g" $FILE; done

servedir(){

if [ -z "$1" ]; then
  port="80"
else
  port=$1
fi

sudo python -m SimpleHTTPServer $port
}

alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'

function trackmobile() {

python -c "import sys, urllib2, re; page=urllib2.urlopen(urllib2.Request('http://trace.bharatiyamobile.com/?numb='+sys.argv[1])).read(); print re.findall('\?location[A-Za-z= ]*',page)[0][10:]" "$1"; 

}


alias rm='rm -I'

alias mv='mv -i'

alias cp='cp -i'

alias vi='vim'

alias clip="xclip -sel clip"

if [ ! -z $1 ]; then
        pushd $1 &&
        find . -name ".svn" | xargs rm -rf &&
        rm -rf .git &&
        popd &&
        tar cjf $1.tar.bz2 $1 &&
        rm -rf $1
fi


alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'

alias vibash='vi ~/.bashrc; source ~/.bashrc'

function .. {
  for i in `seq ${1-1}`; do
    cd ..;
  done
}

alias ps?='/bin/ps -ewwo pid,uid,user,stime,pmem,pcpu,command |/bin/grep $1'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias acs='apt-cache search'


alias xclip="xclip -selection c"


alias gs='git status '
alias gl='git log'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gpl='git pull'
alias gpu='git push'
alias gt='git stash'
alias got='git '
alias get='git '

alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'


alias aliasupdt='wget -q -O - "$@" https://alias.sh/user/1110/alias >> ~/.bash_aliases'

replace () {
    perl -e '$a=shift;$b=shift;while($f=shift){open(F,$f);@t=<F>;close(F);\
    map s/$a/$b/,@t;open(W,">$f");print W @t;close(W)}' "$@"
}

mans ()
{
    man $1 | grep -iC2 --color=always $2 | less
}


wl ()
{
  ls -l `which $*`
}

function wikipedia() {
    if [ "${1}" ]; then dig + short +TXT "${1}".wp.dg.cx; fi
}

alias temp="/opt/vc/bin/vcgencmd measure_temp"


alias myip='curl ip.appspot.com'

tailf() { 
tail -f $1 | perl -pe "s/$2/\e[1;31;43m$&\e[0m/g"
}

alias hist='history | grep --color=auto'

alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'

alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'

alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'

alias psg='ps -ef |grep '

alias up_master="git push origin master"

alias ds='du -ks *|sort -n'

alias cathtml="sed 's/<[^>]*>//g'"

duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print
"$_\t$f"; last};$s=$s/1024}'\'

function manin() {

man ${1} | grep -n ^[A-Z0-9]
}

alias md='mkdir -p'

alias xs='cd `pwd -P`'

alias gsl='git shortlog -nsw -e'

alias l='ls -hog'

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)
        *.tar.gz)
        *.tar)
        *.tbz2)
        *.tgz)       tar xvf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

alias zshrc="vi ~/.zshrc"

function mkcd {

        mkdir -p "$1"
        cd "$1"

}

alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'

alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'

alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'

alias la='ls -la --color=auto'

getAliasSh()
{
    if ([ $# -eq 0 ])
    then
            echo "Usage: getAliasSh AliasUserID"
    else
            wget -q -O - "$@" https://alias.sh/user/"$1"/alias >> ~/.bash_aliases
    fi
}

wget -q -O - "$@" https://alias.sh/user/813/alias >> ~/.bash_aliases

alias netlisteners='lsof -i -P | grep LISTEN'

alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'

alias psf='ps auxf'

alias l='ls -lAh --color'

merge()
{
  tomerge="";
  for file in "$@"; do
    tomerge=$tomerge" "$file;
  done
  pdftk $tomerge cat output mergd.pdf;
}

kl () { 
  sudo kill -9 `ps -ef | grep $1 | grep -v grep | awk '{print $2}'`; 
}


alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias ll="ls -ailh"

alias a2r="/etc/init.d/apache2 restart";

alias gpo="git pull origin"

alias q='exit'

alias no-assume='git update-index --no-assume-unchanged'

alias assume='git update-index --assume-unchanged'

unalias cd 2>/dev/null

function go() {
    cd $1;
    pwd;
}

alias cd=go $1

alias ssh-config="nano ~/.ssh/config"

flac2mp3 () { for f in $*;do flac -cd $f |lame -b 192 - ${f%.flac}.mp3;done }

alias ..='cd ..'
alias ...='cd ../../'

alias freenodetor="dig +short irc.tor.freenode.net cname"

function ban() {
    if [ "`id -u`" == "0" ] ; then
        iptables -A INPUT -s $1 -j DROP
    else
        sudo iptables -A INPUT -s $1 -j DROP
    fi
}

tar czf - www.example.com/ | ssh joebloggs@otherserver.com tar xzf - -C ~/

mp3(){
        youtube-dl $1 --extract-audio --title --audio-format mp3
}


s(){
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'

alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'

ltree()
{
    tree -C $* | less -R
}

zshrc='nano ~/.zshrc && source ~/.zshrc'

alias wget='wget --content-disposition'

alias unzip-all='7z x -y '\''*.zip'\'

alias poogle='ping google.com'

alias ccat='pygmentize -O bg=dark'

alias lldu="find -maxdepth 1 -mindepth 1 -type d -exec du -sh {} \;"

alias uncomment="egrep -v \"^#|^$\""

alias k='gitk --all &'

alias g='git gui&'

alias cd='HOME="$OLDPWD" cd'

alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"

function wl()
{
  which $1 && ls -l `which $1`
}

function wi()
{
  which $1 && vi `which $1`
}

function createTunnel()
{
  if [ $# -eq 3 ]
  then
    user=$1
    host=$2
    localPort=$3
    remotePort=$3
  else
    if [ $# -eq 4 ]
    then
      user=$1
      host=$2
      localPort=$3
      remotePort=$4
    else
      echo -n "User: "; read user
      echo -n "host: "; read host
      echo -n "Distant host: "; read remotePort
      echo -n "Local port: "; read localPort
    fi
  fi
  ssh -N -f $user@$host -L ${localPort}:${host}:${remotePort}
}

function mvarchive {
  for i in $*
  do
    mv $i $i$(date -r $i '+.%Y%m%d-%H%M').old
  done
}

cdl () 
{
    cd $1
    ls
}

alias ds='du -sck * | sort -n'

alias rm='rm -rf --preserve-root'

alias nfas='grep -c "^>"'

alias hist='history | grep '

alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'

function trace { 
    printf '%q ' "$@" >> ~/.trace
    echo >> ~/.trace
    "$@"
}
alias trace=trace

alias qless='qstat -u "*" | less

qmem () {
        qstat -j $1 | grep usage
}

llast () {
        less < `ls -tr | tail -n 1`;
}

lt () {
        ls -ltrh --color $1 | tail -n 15;
}

alias sud='sudo -s'

function install() {
  sudo apt-get install "$1";
}

function lg() {
    if [[ ${#@} > 0 ]]; then
        ls ${@:1:${#@}-1} | grep -i ${@:${#@}}
    fi
}


mingrep() { grep $1 -o '.\{0,20\}'$2'.\{0,20\}' $3; }

alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'

t() { 
tail -f $1 | perl -pe "s/$2/\e[1;31;43m$&\e[0m/g"
}


for i in $(ls ~/script); do alias s_$i='sh ~/script/$i';done;

alias edit-aliases='nano ~/.bash_aliases'

alias l='ls -lah'

alias wcr='wc `find . -type f`'

alias rm='rm -I'

alias gg="sr google -browser=$BROWSER"

alias h='cd $HOME'

alias erase='shred -n 35 -z -u'

alias sulast='su -c $(history -p !-1) root'

alias ll='ls -alFrth'

function fif() {
    for f in $(find . -iname "$1"); do cat -n $f | grep --color=always $2 | parallel -k echo "[$f]"; done
}

fif *.java myFunction

alias sandbox='source ${HOME}/sandbox/bin/activate'

alias prs='ps faux|grep -v grep|grep "$@"'

alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'

alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'

alias d='git diff|tig'

alias grphp='ps -auwx | grep php'

# Listing aliases
alias ll='ls -lhF'
alias lla='ls -lhFA'

# Navigation aliases
alias back='cd -'
alias cd..='cd ..'

# Search aliases
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'


alias lns='ln -s'

Size='du -sk * | sort -rn | 
  while read size fname; do 
    for unit in k M G T P E Z Y; do
      if [ $size -lt 1024 ];
      then 
          echo -e "${size}${unit}\t${fname}"; 
          break; 
      fi; 
      size=$((size/1024)); 
    done; 
  done'

alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""

alias scw='screen -wipe'

alias sls="screen -ls"

alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"

alias upgrade='apt-get update && apt-get upgrade && apt-get clean'

sniff () { sudo ngrep -d ${1} -t '^(GET|POST) ' 'tcp and port 80'; }

# to move up 3 directories:
# up 3
# up up up
up(){

if [[ $1 =~ ^[0-9]+$ ]];

then


i=${1-1}

else


i=1+$#

fi

for ((; i>0; i--))

do


cd ../

done
}

alias mkvenv="virtualenv --distribute --no-site-packages venv"

alias la="ls -a"

alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path


alias sa="ssh-add "

alias whead="curl --head $1"

cd()
{
clear
builtin cd $*
ls -ahl
}

alias ls="ls -alh"

alias logs='tail -n30 /var/log/apache2/error.log'

alias a2-restart="sudo service apache2 restart"

execute-over-ssh() {

if [ $# -ne 2 ]; then


echo "USAGE: execute-over-ssh 'server1 server2 server3' 'command1; command2; command3'"


return 1

else


servers=(${=1})


for server in $servers


do



echo ""



echo "----> Executing $2 on $server"



ssh $server "$2" 



echo ""


done


return 0

fi
}


csscount() {
    cnt=0
    depth=0
    while read -n 1 char; do
            case $char in
                    "{")
                            ((depth++))
                            ;;
                    "}")
                            ((depth--))
                            if [ "$depth" -eq "0" ]; then
                                    ((cnt++))
                            fi
                            ;;
                    ",")
                            ((cnt++))
                            ;;
            esac
    done

    echo $cnt
}

# go back x directories
b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}


alias aa="git add -A ."

alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

alias gc="git commit -m "

alias co="git checkout "

alias gp="git pull origin "
alias gpm="gp master"

alias pm="git push origin master"

alias gb="git branch"

 alias gs="git status"

alias g='grep -P'

alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"


alias ipy="python -c 'import IPython; IPython.frontend.terminal.ipapp.launch_new_instance()'"

alias clr='clear;pwd;ls'

alias vmi='vim'                                                                                                                                                                                                                                
alias ivm='vim'
alias cim='vim'
alias bim='vim'
alias vi='vim'

alias sshr="ssh -l root"

alias reload='source $HOME/.bashrc 1>/dev/null'

alias la='ll -a'

alias ll='ls -l'

alias realias='$EDITOR ~/.bash_aliases && source ~/.bash_aliases'
alias refunction='$EDITOR ~/.bash_functions && source ~/.bash_functions'

alias sulast='sudo $(history -p !-1)'

alias lf='/bin/ls -rt|tail -n1'

alias l='ls -CF'

alias la='ls -A'

alias ll='ls -l --color=auto'

alias grep='grep --color=auto'

alias ls='ls --color=auto'

alias clear='printf "\ec"'

alias trash='rm -f *~; true'

psdtopng(){
    for file in *psd;do
        name=${file%.psd}
        echo -e "    ♻ converting ${name}.psd to ${name}.png\n"
        convert "${name}.psd[0]" "${name}.png"
    done
}

grepit(){
    find . -name "*${2}" -print | xargs grep -nir "${1}"
}

workdone(){
    default="1 day ago"
    git log --committer=moglenstar@gmail.com --pretty=format:"%Cgreen%ar (%h)%n%Creset> %s %b%n" --since="${1:-$default}" --no-merges
}

findreplace(){
    printf "Search: ${1}\n"
    printf "Replace: ${2}\n"
    printf "In: ${3}\n\n"

    find . -name "*${3}" -type f | xargs perl -pi -e 's/${1}/${2}/g'
}

alias ll="ls -l"

alias l="ls -al"

alias update='sudo apt-get update'

alias cgrep='grep --color=always'

function rage () {
  git add .;
  git commit -m "$@";
  git push heroku master; git push origin master;
};

alias remove='sudo apt-get remove'

alias install='sudo apt-get install'

#ls after every cd
function cd () { 
  builtin cd "$@" && ls;
}

alias k9='kill -9'

function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_dsa.pub
}

alias gs="git status" #N.B. Overrides ghostscript (probably not important if you don't use it)
alias gd="git diff"
alias gc="git commit"
alias gl="git log --graph --full-history --all --color"

alias cbuild="mkdir build && cd build; cmake ..; make"

alias ifconfig-ext='curl ifconfig.me'

alias ..1='cd ..'
alias ..2='cd ../../../'
alias ..3='cd ../../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

alias copy="cp"           # name file -- dir target
alias del="rm -i"         # name file
alias dir="ls"              # list of files
alias md="mkdir"       # name of new dir
alias rd="rmdir"         # name of dir
alias rename="mv"     # name file -- dir and new rename file

alias l="ls -ltr"

alias f="find . | xargs grep -sl"

va () {
    ack -li -- "$@" 2>/dev/null | xargs -o vim -c "/$@"
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


alias gm="git merge"

alias process='ps -ax'

alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'


alias gb="git checkout -b"

function take() {

mkdir $1

cd $1
}

function mcd() {
  mkdir -p "$1" && cd "$1";
}

alias open='xdg-open'

sssh (){ ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }

alias display='less +F'

alias please="sudo"

alias tm='ps -ef | grep'

function bakup()
{
    (test $# -lt 1) && return 1

    archive=${HOME}/archive
    (test -d ${archive}) || mkdir -p ${archive}

    tstmp=`date +"%d%h%y_%H%M%S"`
    echo "TIMESTAMP: ${tstmp}"

    for i in $*;
    do

if [ -f $i ]; then
        basename_i=`basename ${i}`

    cmd="cp $i ${archive}/${basename_i}.${tstmp}"
        echo ${cmd}
        eval ${cmd}

else

    case $i in


dots|dotfiles|DOTS|DOTFILES)


    echo "backing up DOTFILES"


    tdir=${TMPDIR:-/tmp/${USER}}


    mkdir -p ${tdir}


    pushd ${tdir}


    if [ $? -eq 0 ]; then 



echo ${PWD}



d="bakup_dotfiles_${tstmp}"



d_tgz="bakup_dotfiles_${tstmp}.tgz"



mkdir -p ${d}



cp -r ${HOME}/vim ${d}



cp -r ${HOME}/.vim ${d}



cp -r ${HOME}/bin ${d}



cp ${HOME}/.bash* ${d}



cp -r ${HOME}/BM ${d}
            if [ -f ${HOME}/.screenrc ]; then 
                cp ${HOME}/.screenrc ${d}
            fi



tar cvfz ${d_tgz} ${d}



mv ${d_tgz} ${archive}



popd


    fi


    ;;


*)


    ;;

    esac

fi
    done
    ls -latr ${archive} | fgrep ${tstmp}
}


alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones

alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX

alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

alias gpm="git push origin master"

alias sc="screen -S"
alias sl="screen -ls"
alias sr="screen -r"

alias active='grep -v -e "^$" -e"^ *#"'

alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias l.='ls -d .* --color=auto'

alias c='clear'

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

alias p="git push origin "

ft() {

find . -name "$2" -exec grep -il "$1" {} \;
}

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias m="git add .;git commit -m"

alias al="alias | grep"
