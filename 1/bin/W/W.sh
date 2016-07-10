#!/usr/bin/env zsh

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

msg() {
    printf '%b\n' "$1" >&2
}

success () {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}

# -------------------------------------------------------------------
# (s)ave or (i)nsert a directory.
# -------------------------------------------------------------------
www_save_dir() { pwd >> ~/.save_dir ; }
www_read_dir() {
    cat ~/.save_dir; }

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANG="en_US.UTF-8"
source $HOME/zdotfiles/link/aliase_ls.sh

alias -g _wv='| vim -'
alias -g H='--help'
alias -g G='| grep'
alias ww_bashrc="vim $HOME/.bashrc"
alias wwww_pygmentize="pygmentize -f 256 -l sh "
alias W_zsh="zsh"
alias 'W_install'='sudo apt-get install'
alias ww='vim'
alias www='ranger'
alias wwww='cat'


alias wwwww='WW_find_sh'
alias W_chmod_X='chmod u+x'

WW_find_sh() {
    find . -type f -iname "*sh" -exec egrep -iHn "$1" {} \;
}

WW_find_py() {
    find . -type f -iname "*.py" -exec egrep "$1" {} \;
}
alias pcat="pygmentize -f terminal256 -O style=native -g"

WWW_f_sh() {
    find . -type f -and -iregex '.*\..sh$' -exec egrep --color=always -h -C 3 "$1" {} \;
}


APPS=()
APPS=('python-pygment')

W_apt() {
    case $1 in
    (*w*|-w)
      sudo apt-get update
        ;;
    (i|-i)
      sudo apt-get install "$2"
    (*W*|-W)
      sudo apt-get upgrade
        ;;
    (c|-c)
        sudo apt-get autoremove && sudo apt-get autoclean
        ;;
    esac
}


w() {
    ls -al
    case $1 in
        (wW)
            success "$1=1 , $2=2"
            ;;
        (i|-i)
            clear && zsh && success "Y"
        (*W*|-W)
          ls -al
        ;;
        (c|-c)
        cd $HOME/zdotfiles/link
        ;;
    esac
}



# Rsync options are:
#  -p - preserve permissions
#  -o - preserve owner
#  -g - preserve group
#  -h - output in human-readable format
#  --progress - display progress
#  -b - instead of just overwriting an existing file, save the original
#  --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
#  -e /dev/null - only work on local files
#  -- - everything after this is an argument, even if it looks like an option

alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"


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


function wsix_lsusb_dmesg_hcitool {
    lsusb;dmesg;hcitool dev;hcitool con;
    echo " بسم الله ما شاء الله"
}

function WW {
    zal=$HOME/zdotfiles/link/aliases.sh

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


