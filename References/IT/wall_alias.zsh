alias popd="popd;dirpersiststore"
alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdb='_rails_command dbconsole'
alias rdbm='rake db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rgm='_rails_command generate migration'
alias rp='_rails_command plugin'
alias ru='_rails_command runner'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias devlog='tail -f log/development.log'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias ys="yum search"                       # search package
alias yp="yum info"                         # show package info
alias yl="yum list"                         # list packages
alias ygl="yum grouplist"                   # list package groups
alias yli="yum list installed"              # print all installed packages
alias ymc="yum makecache"                   # rebuilds the yum package list
alias yu="sudo yum update"                  # upgrate packages
alias yi="sudo yum install"                 # install package
alias ygi="sudo yum groupinstall"           # install package group
alias yr="sudo yum remove"                  # remove package
alias ygr="sudo yum groupremove"            # remove pagage group
alias yrl="sudo yum remove --remove-leaves" # remove package and leaves
alias yc="sudo yum clean all"               # clean cache
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
alias gpoat='git push origin --all && git push origin --tags'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias mvncie='mvn clean install eclipse:eclipse'
alias mvnci='mvn clean install'
alias mvne='mvn eclipse:eclipse'
alias mvnce='mvn clean eclipse:clean eclipse:eclipse'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias h='history'
alias hsi='hs -i'
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'
alias pd='perldoc'
alias ple='perl -wlne'
alias latest-perl='curl -s http://www.perl.org/get.html | perl -wlne '\''if (/perl\-([\d\.]+)\.tar\.gz/) { print $1; exit;}'\'
alias sf2='php app/console'
alias sf2clear='php app/console cache:clear'
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias kate='kate >/dev/null 2>&1'
alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'
alias sgem='sudo gem'
alias rfind='find . -name "*.rb" | xargs grep -n'
alias rsync-copy="rsync -av --progress -h"
alias rsync-move="rsync -av --progress -h --remove-source-files"
alias rsync-update="rsync -avu --progress -h"
alias rsync-synchronize="rsync -avu --delete --progress -h"
alias kaput="tail -f ~/Library/Logs/Pow/apps/*"
alias pjo="pj open"
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias :3='echo'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias tldr='less'
alias alwayz='tail -f'
alias icanhas='mkdir'
alias gimmeh='touch'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias nowai='chmod'
alias hai='cd'
alias iz='ls'
alias plz='pwd'
alias ihasbucket='df -h'
alias inur='locate'
alias iminurbase='finger'
alias btw='nice'
alias obtw='nohup'
alias nomz='ps aux'
alias nomnom='killall'
alias byes='exit'
alias cya='reboot'
alias kthxbai='halt'
alias ag='apt-get'
alias ap='aptitude'
alias acs="apt-cache search"
alias aps='aptitude search'
alias as="aptitude -F \"* %p -> %d \n(%v/%V)\" \
alias afs='apt-file search --regexp'
alias asrc='apt-get source'
alias app='apt-cache policy'
alias allpkgs='aptitude search -F "%p" --disable-columns ~i'
alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
alias pc="sudo port clean --all installed"
alias pi="sudo port install $1"
alias psu="sudo port selfupdate"
alias puni="sudo port uninstall inactive"
alias puo="sudo port upgrade outdated"
alias pup="psu && puo"
alias ss='thin --stats "/thin/stats" start'
alias sg='ruby script/generate'
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'
alias sr='ruby script/runner'
alias ssp='ruby script/spec'
alias rdbm='rake db:migrate'
alias rdbtp='rake db:test:prepare'
alias migrate='rake db:migrate && rake db:test:prepare'
alias sc='ruby script/console'
alias sd='ruby script/server --debugger'
alias devlog='tail -f log/development.log'
alias artisan='php artisan'
alias bob='php artisan bob::build'
alias et='mate .'
alias ett='mate Gemfile app config features lib db public spec test Rakefile Capfile Todo'
alias etp='mate app config lib db public spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias etts='mate app config lib db public script spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias mr='mate CHANGELOG app config db lib public script spec test'
alias zeus='bundle exec zeus'
alias zi='zeus init'
alias zinit='zeus init'
alias zs='zeus start'
alias ztart='zeus start'
alias zc='zeus console'
alias zonsole='zeus console'
alias zsr='zeus server'
alias zerver='zeus server'
alias zr='zeus rake'
alias zake='zeus rake'
alias zg='zeus generate'
alias zenerate='zeus generate'
alias zrn='zeus runner'
alias zunner='zeus runner'
alias zcu='zeus cucumber'
alias zucumber='zeus cucumber'
alias zspec='zeus rspec'
alias zt='zeus test'
alias zest='zeus test'
alias zu='zeus test test/unit/*'
alias zunits='zeus test test/unit/*'
alias zf='zeus test test/functional/*'
alias zunctional='zeus test test/functional/*'
alias za='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zall='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zsw='rm .zeus.sock'
alias zweep='rm .zeus.sock'
alias x=extract
alias jrspec='jruby --debug -S rspec --debug'
alias jprofile='jruby --profile.api -S rspec'
alias jexec='jruby -S'
alias zi='sudo zypper install'
alias zrf='sudo zypper refresh'
alias zs='zypper search'
alias zup='sudo zypper dist-upgrade'
alias zrm='sudo zypper remove'
alias zp='sudo zypper patch'
alias zps='sudo zypper ps'
alias cloudapp=$ZSH/plugins/cloudapp/cloudapp.rb
alias jira='open_jira_issue'
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'
alias lho='open_lighthouse_ticket'
alias n='nanoc'
alias na='nanoc autocompile'
alias nco='nanoc compile'
alias nci='nanoc create_item'
alias ncl='nanoc create_layout'
alias ncs='nanoc create_site'
alias nd='nanoc deploy'
alias nv='nanoc view'
alias nw='nanoc watch'
alias st=st_run
alias stt='st .'
alias apache2start='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper start'
alias apache2stop='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper stop'
alias apache2restart='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper restart'
alias brews='brew list -1'
alias e64=encode64
alias d64=decode64
alias mysqlstart='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysqlstop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias mysqlrestart='sudo /opt/local/share/mysql5/mysql/mysql.server restart'
alias mysqlstatus='mysqladmin5 -u root -p ping'
alias t=task
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias c='composer'
alias csu='composer self-update'
alias cu='composer update'
alias ci='composer install'
alias ccp='composer create-project'
alias cget='curl -s https://getcomposer.org/installer | php'
alias hgc='hg commit'
alias hgb='hg branch'
alias hgba='hg branches'
alias hgco='hg checkout'
alias hgd='hg diff'
alias hged='hg diffmerge'
alias hgl='hg pull -u'
alias hgp='hg push'
alias hgs='hg status'
alias hgca='hg qimport -r tip ; hg qrefresh -e ; hg qfinish tip'
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
alias rake="noglob rake" # allows square brackts for rake task invocation
alias brake='noglob bundle exec rake' # execute the bundled rake gem
alias srake='noglob sudo rake' # noglob must come before sudo
alias sbrake='noglob sudo bundle exec rake' # altogether now ... 
alias pu='pushd'
alias po='popd'
alias ...='cd ../..'
alias -- -='cd -'
alias _='sudo'
alias please='sudo'
alias history='fc -l 1'
alias lsa='ls -lah'
alias l='ls -lA1'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up
alias afind='ack-grep -il'
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'
alias       do
alias       func
alias   #inc, #include
alias   #inc2, #include2
alias   #ifndef
alias   #def, #define
alias /*
alias size
alias       df
alias       dd
alias       dt
alias       defr
alias       func
alias       tryf
alias       log
alias   neobundle
alias   neobundlelazy
alias       afunction afunc
alias    s:save_cpo cpoptions
alias   loaded
alias   b:undo_ftplugin
alias       $
alias       \begin
alias   \begin{list} \list
alias   \begin{quotation} \quotation
alias   \begin{description} \description
alias   \begin{sloppypar} \sloppypar
alias   \begin{enumerate} \enumerate
alias   \begin{theindex} \theindex
alias   \begin{itemize} \itemize
alias   \begin{titlepage} \titlepage
alias   \begin{verbatim} verb \verbatim
alias   \begin{verbatimtab} \verbatimtab
alias   \begin{trivlist} \trivlist
alias   \begin{verse} \verse
alias   \begin{table} \table
alias   \begin{thebibliography} \thebibliography
alias   \begin{tabbing} \tabbing
alias   \begin{note} \note
alias   \begin{tabular} \tabular
alias   \begin{overlay} \overlay
alias   \begin{array} \array
alias   \begin{slide} \slide
alias   \begin{displaymath} \displaymath
alias   \begin{abstract} \abstract
alias   \begin{eqnarray} \eqnarray
alias   \begin{eqnarray*} \eqnarray*
alias   \begin{appendix} \appendix
alias   \begin{equation} \equation
alias   \begin{equation*} \equation*
alias   \begin{center} \center
alias   \begin{document} \document
alias   \begin{figure} \figure
alias   \begin{filecontents} \filecontents
alias   \begin{lrbox} \lrbox
alias   \begin{flushleft} \flushleft
alias   \begin{flushright} \flushright
alias   \begin{minipage} \minipage
alias   \begin{picture} \picture
alias   \begin{math} \math
alias   \begin{quote} \quote
alias   part \part{
alias   chapter \chapter{
alias   section \section{
alias   subsection \subsection{
alias   subsubsection \subsubsection{
alias   paragraph \paragraph{
alias   subparagraph \subparagraph{
alias   \begin{bfseries} \bfseries
alias   \begin{mdseries} \mdseries
alias   \begin{ttfamily} \ttfamily
alias   \begin{sffamily} \sffamily
alias   \begin{rmfamily} \rmfamily
alias   \begin{upshape} \upshape
alias   \begin{slshape} \slshape
alias   \begin{scshape} \scshape
alias   \begin{itshape} \itshape
alias   \usepackage
alias \ref
alias \label
alias \cite
alias   fore
alias   imt
alias ver
alias   function name(args)...end
alias wh
alias   h
alias func
alias       snip
alias   func
alias instead of the column name.
alias findInHistory="history |grep "
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls ="ls -la --color=auto"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
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
alias df='df -h'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias ls='ls -a'
alias ezshrc='emacs ~/.zshrc* &'
alias resource='source ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -lA'
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls="screen -ls"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv="virtualenv --distribute --no-site-packages venv"
alias la="ls -a"
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path
alias sa="ssh-add "
alias whead="curl --head $1"
alias ls="ls -alh"
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart="sudo service apache2 restart"
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
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
alias gm="git merge"
alias process='ps -ax'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
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
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias m="git add .;git commit -m"
alias al="alias | grep"
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
alias zss2='ssh root@192.168.1.2'
alias W=cat
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias al='alias | grep'
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
alias copy=cp
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias ds='du -sck * | sort -n'
alias ebuild='nocorrect ebuild'
alias edit-aliases='nano ~/.bash_aliases'
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
alias gl='cd ~/zdotfiles ; git add -A && git commit -a; git push origin master'
alias gll='cp ~/.oh-my-zsh/lib/aliases.zsh ~/zdotfiles/zsh/aliases.zsh && gl"
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
alias _='sudo'
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
alias sr='screen -r'
alias ss='vim $HOME/.zshrc'
alias ssh-config='nano ~/.ssh/config'
alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'
alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias tm='ps -ef | grep'
alias trace=trace
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias uncomment='egrep -v "^#|^$"'
alias unzip-all='7z x -y '\''*.zip'\'
alias up_master='git push origin master'
alias update='sudo apt-get update'
alias update-aliases='wget -q -O - "" https://alias.sh/user//alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh'
alias update-private-aliases='wget -q -O - "" https://alias.sh/user//alias/key/ > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vi=vim
alias vibash='vi ~/.bashrc; source ~/.bashrc'
alias vv='source ~/.vimrc.bundles.local'
alias vvv='source ~/.vimrc.local'
alias w='ls -alF'
alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias zshconfig='subl ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzz='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias ex='exit'
alias 'wn'='sudo lshw -class network'
alias n1='ip route show 0.0.0.0/0 | awk '{print }')'
alias _='sudo'
alias ee='echo'
alias eee='cat'
alias wch='sudo chown -hR bani:bani /home/bani'
alias wg='w | grep'
alias popd="popd;dirpersiststore"
alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdb='_rails_command dbconsole'
alias rdbm='rake db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rgm='_rails_command generate migration'
alias rp='_rails_command plugin'
alias ru='_rails_command runner'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias devlog='tail -f log/development.log'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias ys="yum search"                       # search package
alias yp="yum info"                         # show package info
alias yl="yum list"                         # list packages
alias ygl="yum grouplist"                   # list package groups
alias yli="yum list installed"              # print all installed packages
alias ymc="yum makecache"                   # rebuilds the yum package list
alias yu="sudo yum update"                  # upgrate packages
alias yi="sudo yum install"                 # install package
alias ygi="sudo yum groupinstall"           # install package group
alias yr="sudo yum remove"                  # remove package
alias ygr="sudo yum groupremove"            # remove pagage group
alias yrl="sudo yum remove --remove-leaves" # remove package and leaves
alias yc="sudo yum clean all"               # clean cache
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
alias gpoat='git push origin --all && git push origin --tags'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias mvncie='mvn clean install eclipse:eclipse'
alias mvnci='mvn clean install'
alias mvne='mvn eclipse:eclipse'
alias mvnce='mvn clean eclipse:clean eclipse:eclipse'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias h='history'
alias hsi='hs -i'
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'
alias pd='perldoc'
alias ple='perl -wlne'
alias latest-perl='curl -s http://www.perl.org/get.html | perl -wlne '\''if (/perl\-([\d\.]+)\.tar\.gz/) { print $1; exit;}'\'
alias sf2='php app/console'
alias sf2clear='php app/console cache:clear'
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias kate='kate >/dev/null 2>&1'
alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'
alias sgem='sudo gem'
alias rfind='find . -name "*.rb" | xargs grep -n'
alias rsync-copy="rsync -av --progress -h"
alias rsync-move="rsync -av --progress -h --remove-source-files"
alias rsync-update="rsync -avu --progress -h"
alias rsync-synchronize="rsync -avu --delete --progress -h"
alias kaput="tail -f ~/Library/Logs/Pow/apps/*"
alias pjo="pj open"
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias :3='echo'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias tldr='less'
alias alwayz='tail -f'
alias icanhas='mkdir'
alias gimmeh='touch'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias nowai='chmod'
alias hai='cd'
alias iz='ls'
alias plz='pwd'
alias ihasbucket='df -h'
alias inur='locate'
alias iminurbase='finger'
alias btw='nice'
alias obtw='nohup'
alias nomz='ps aux'
alias nomnom='killall'
alias byes='exit'
alias cya='reboot'
alias kthxbai='halt'
alias ag='apt-get'
alias ap='aptitude'
alias acs="apt-cache search"
alias aps='aptitude search'
alias as="aptitude -F \"* %p -> %d \n(%v/%V)\" \
alias afs='apt-file search --regexp'
alias asrc='apt-get source'
alias app='apt-cache policy'
alias allpkgs='aptitude search -F "%p" --disable-columns ~i'
alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
alias pc="sudo port clean --all installed"
alias pi="sudo port install $1"
alias psu="sudo port selfupdate"
alias puni="sudo port uninstall inactive"
alias puo="sudo port upgrade outdated"
alias pup="psu && puo"
alias ss='thin --stats "/thin/stats" start'
alias sg='ruby script/generate'
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'
alias sr='ruby script/runner'
alias ssp='ruby script/spec'
alias rdbm='rake db:migrate'
alias rdbtp='rake db:test:prepare'
alias migrate='rake db:migrate && rake db:test:prepare'
alias sc='ruby script/console'
alias sd='ruby script/server --debugger'
alias devlog='tail -f log/development.log'
alias artisan='php artisan'
alias bob='php artisan bob::build'
alias et='mate .'
alias ett='mate Gemfile app config features lib db public spec test Rakefile Capfile Todo'
alias etp='mate app config lib db public spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias etts='mate app config lib db public script spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias mr='mate CHANGELOG app config db lib public script spec test'
alias zeus='bundle exec zeus'
alias zi='zeus init'
alias zinit='zeus init'
alias zs='zeus start'
alias ztart='zeus start'
alias zc='zeus console'
alias zonsole='zeus console'
alias zsr='zeus server'
alias zerver='zeus server'
alias zr='zeus rake'
alias zake='zeus rake'
alias zg='zeus generate'
alias zenerate='zeus generate'
alias zrn='zeus runner'
alias zunner='zeus runner'
alias zcu='zeus cucumber'
alias zucumber='zeus cucumber'
alias zspec='zeus rspec'
alias zt='zeus test'
alias zest='zeus test'
alias zu='zeus test test/unit/*'
alias zunits='zeus test test/unit/*'
alias zf='zeus test test/functional/*'
alias zunctional='zeus test test/functional/*'
alias za='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zall='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zsw='rm .zeus.sock'
alias zweep='rm .zeus.sock'
alias x=extract
alias jrspec='jruby --debug -S rspec --debug'
alias jprofile='jruby --profile.api -S rspec'
alias jexec='jruby -S'
alias zi='sudo zypper install'
alias zrf='sudo zypper refresh'
alias zs='zypper search'
alias zup='sudo zypper dist-upgrade'
alias zrm='sudo zypper remove'
alias zp='sudo zypper patch'
alias zps='sudo zypper ps'
alias cloudapp=$ZSH/plugins/cloudapp/cloudapp.rb
alias jira='open_jira_issue'
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'
alias lho='open_lighthouse_ticket'
alias n='nanoc'
alias na='nanoc autocompile'
alias nco='nanoc compile'
alias nci='nanoc create_item'
alias ncl='nanoc create_layout'
alias ncs='nanoc create_site'
alias nd='nanoc deploy'
alias nv='nanoc view'
alias nw='nanoc watch'
alias st=st_run
alias stt='st .'
alias apache2start='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper start'
alias apache2stop='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper stop'
alias apache2restart='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper restart'
alias brews='brew list -1'
alias e64=encode64
alias d64=decode64
alias mysqlstart='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysqlstop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias mysqlrestart='sudo /opt/local/share/mysql5/mysql/mysql.server restart'
alias mysqlstatus='mysqladmin5 -u root -p ping'
alias t=task
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias c='composer'
alias csu='composer self-update'
alias cu='composer update'
alias ci='composer install'
alias ccp='composer create-project'
alias cget='curl -s https://getcomposer.org/installer | php'
alias hgc='hg commit'
alias hgb='hg branch'
alias hgba='hg branches'
alias hgco='hg checkout'
alias hgd='hg diff'
alias hged='hg diffmerge'
alias hgl='hg pull -u'
alias hgp='hg push'
alias hgs='hg status'
alias hgca='hg qimport -r tip ; hg qrefresh -e ; hg qfinish tip'
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
alias rake="noglob rake" # allows square brackts for rake task invocation
alias brake='noglob bundle exec rake' # execute the bundled rake gem
alias srake='noglob sudo rake' # noglob must come before sudo
alias sbrake='noglob sudo bundle exec rake' # altogether now ... 
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
alias W=cat
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias al='alias | grep'
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
alias copy=cp
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias ds='du -sck * | sort -n'
alias ebuild='nocorrect ebuild'
alias edit-aliases='nano ~/.bash_aliases'
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
alias gll='git add -A; git commit -a; git push origin master'
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
alias sr='screen -r'
alias ss='vim $HOME/.zshrc'
alias ssh-config='nano ~/.ssh/config'
alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'
alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias tm='ps -ef | grep'
alias trace=trace
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias uncomment='egrep -v "^#|^$"'
alias unzip-all='7z x -y '\''*.zip'\'
alias up_master='git push origin master'
alias update='sudo apt-get update'
alias update-aliases='wget -q -O - "" https://alias.sh/user//alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh'
alias update-private-aliases='wget -q -O - "" https://alias.sh/user//alias/key/ > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vi=vim
alias vibash='vi ~/.bashrc; source ~/.bashrc'
alias vv='source ~/.vimrc.bundles.local'
alias vvv='source ~/.vimrc.local'
alias w='ls -alF'
alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias zshconfig='subl ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzz='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias d='dirs -v | head -10'
alias [ -group name ...] key address [ address ...]
alias muttdude me@cs.hmc.edu (Michael Elkins)
alias theguys manny, moe, jack
alias juser abd30425@somewhere.net (Joe User)
alias popd="popd;dirpersiststore"
alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdb='_rails_command dbconsole'
alias rdbm='rake db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rgm='_rails_command generate migration'
alias rp='_rails_command plugin'
alias ru='_rails_command runner'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias devlog='tail -f log/development.log'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias ys="yum search"                       # search package
alias yp="yum info"                         # show package info
alias yl="yum list"                         # list packages
alias ygl="yum grouplist"                   # list package groups
alias yli="yum list installed"              # print all installed packages
alias ymc="yum makecache"                   # rebuilds the yum package list
alias yu="sudo yum update"                  # upgrate packages
alias yi="sudo yum install"                 # install package
alias ygi="sudo yum groupinstall"           # install package group
alias yr="sudo yum remove"                  # remove package
alias ygr="sudo yum groupremove"            # remove pagage group
alias yrl="sudo yum remove --remove-leaves" # remove package and leaves
alias yc="sudo yum clean all"               # clean cache
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
alias gpoat='git push origin --all && git push origin --tags'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias mvncie='mvn clean install eclipse:eclipse'
alias mvnci='mvn clean install'
alias mvne='mvn eclipse:eclipse'
alias mvnce='mvn clean eclipse:clean eclipse:eclipse'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias h='history'
alias hsi='hs -i'
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'
alias pd='perldoc'
alias ple='perl -wlne'
alias latest-perl='curl -s http://www.perl.org/get.html | perl -wlne '\''if (/perl\-([\d\.]+)\.tar\.gz/) { print $1; exit;}'\'
alias sf2='php app/console'
alias sf2clear='php app/console cache:clear'
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias kate='kate >/dev/null 2>&1'
alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'
alias sgem='sudo gem'
alias rfind='find . -name "*.rb" | xargs grep -n'
alias rsync-copy="rsync -av --progress -h"
alias rsync-move="rsync -av --progress -h --remove-source-files"
alias rsync-update="rsync -avu --progress -h"
alias rsync-synchronize="rsync -avu --delete --progress -h"
alias kaput="tail -f ~/Library/Logs/Pow/apps/*"
alias pjo="pj open"
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias :3='echo'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias tldr='less'
alias alwayz='tail -f'
alias icanhas='mkdir'
alias gimmeh='touch'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias nowai='chmod'
alias hai='cd'
alias iz='ls'
alias plz='pwd'
alias ihasbucket='df -h'
alias inur='locate'
alias iminurbase='finger'
alias btw='nice'
alias obtw='nohup'
alias nomz='ps aux'
alias nomnom='killall'
alias byes='exit'
alias cya='reboot'
alias kthxbai='halt'
alias ag='apt-get'
alias ap='aptitude'
alias acs="apt-cache search"
alias aps='aptitude search'
alias as="aptitude -F \"* %p -> %d \n(%v/%V)\" \
alias afs='apt-file search --regexp'
alias asrc='apt-get source'
alias app='apt-cache policy'
alias allpkgs='aptitude search -F "%p" --disable-columns ~i'
alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
alias pc="sudo port clean --all installed"
alias pi="sudo port install $1"
alias psu="sudo port selfupdate"
alias puni="sudo port uninstall inactive"
alias puo="sudo port upgrade outdated"
alias pup="psu && puo"
alias ss='thin --stats "/thin/stats" start'
alias sg='ruby script/generate'
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'
alias sr='ruby script/runner'
alias ssp='ruby script/spec'
alias rdbm='rake db:migrate'
alias rdbtp='rake db:test:prepare'
alias migrate='rake db:migrate && rake db:test:prepare'
alias sc='ruby script/console'
alias sd='ruby script/server --debugger'
alias devlog='tail -f log/development.log'
alias artisan='php artisan'
alias bob='php artisan bob::build'
alias et='mate .'
alias ett='mate Gemfile app config features lib db public spec test Rakefile Capfile Todo'
alias etp='mate app config lib db public spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias etts='mate app config lib db public script spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias mr='mate CHANGELOG app config db lib public script spec test'
alias zeus='bundle exec zeus'
alias zi='zeus init'
alias zinit='zeus init'
alias zs='zeus start'
alias ztart='zeus start'
alias zc='zeus console'
alias zonsole='zeus console'
alias zsr='zeus server'
alias zerver='zeus server'
alias zr='zeus rake'
alias zake='zeus rake'
alias zg='zeus generate'
alias zenerate='zeus generate'
alias zrn='zeus runner'
alias zunner='zeus runner'
alias zcu='zeus cucumber'
alias zucumber='zeus cucumber'
alias zspec='zeus rspec'
alias zt='zeus test'
alias zest='zeus test'
alias zu='zeus test test/unit/*'
alias zunits='zeus test test/unit/*'
alias zf='zeus test test/functional/*'
alias zunctional='zeus test test/functional/*'
alias za='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zall='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zsw='rm .zeus.sock'
alias zweep='rm .zeus.sock'
alias x=extract
alias jrspec='jruby --debug -S rspec --debug'
alias jprofile='jruby --profile.api -S rspec'
alias jexec='jruby -S'
alias zi='sudo zypper install'
alias zrf='sudo zypper refresh'
alias zs='zypper search'
alias zup='sudo zypper dist-upgrade'
alias zrm='sudo zypper remove'
alias zp='sudo zypper patch'
alias zps='sudo zypper ps'
alias cloudapp=$ZSH/plugins/cloudapp/cloudapp.rb
alias jira='open_jira_issue'
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'
alias lho='open_lighthouse_ticket'
alias n='nanoc'
alias na='nanoc autocompile'
alias nco='nanoc compile'
alias nci='nanoc create_item'
alias ncl='nanoc create_layout'
alias ncs='nanoc create_site'
alias nd='nanoc deploy'
alias nv='nanoc view'
alias nw='nanoc watch'
alias st=st_run
alias stt='st .'
alias apache2start='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper start'
alias apache2stop='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper stop'
alias apache2restart='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper restart'
alias brews='brew list -1'
alias e64=encode64
alias d64=decode64
alias mysqlstart='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysqlstop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias mysqlrestart='sudo /opt/local/share/mysql5/mysql/mysql.server restart'
alias mysqlstatus='mysqladmin5 -u root -p ping'
alias t=task
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias c='composer'
alias csu='composer self-update'
alias cu='composer update'
alias ci='composer install'
alias ccp='composer create-project'
alias cget='curl -s https://getcomposer.org/installer | php'
alias hgc='hg commit'
alias hgb='hg branch'
alias hgba='hg branches'
alias hgco='hg checkout'
alias hgd='hg diff'
alias hged='hg diffmerge'
alias hgl='hg pull -u'
alias hgp='hg push'
alias hgs='hg status'
alias hgca='hg qimport -r tip ; hg qrefresh -e ; hg qfinish tip'
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
alias rake="noglob rake" # allows square brackts for rake task invocation
alias brake='noglob bundle exec rake' # execute the bundled rake gem
alias srake='noglob sudo rake' # noglob must come before sudo
alias sbrake='noglob sudo bundle exec rake' # altogether now ... 
alias pu='pushd'
alias po='popd'
alias ...='cd ../..'
alias -- -='cd -'
alias _='sudo'
alias please='sudo'
alias history='fc -l 1'
alias lsa='ls -lah'
alias l='ls -lA1'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up
alias afind='ack-grep -il'
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'
alias       do
alias       func
alias   #inc, #include
alias   #inc2, #include2
alias   #ifndef
alias   #def, #define
alias /*
alias size
alias       df
alias       dd
alias       dt
alias       defr
alias       func
alias       tryf
alias       log
alias   neobundle
alias   neobundlelazy
alias       afunction afunc
alias    s:save_cpo cpoptions
alias   loaded
alias   b:undo_ftplugin
alias       $
alias       \begin
alias   \begin{list} \list
alias   \begin{quotation} \quotation
alias   \begin{description} \description
alias   \begin{sloppypar} \sloppypar
alias   \begin{enumerate} \enumerate
alias   \begin{theindex} \theindex
alias   \begin{itemize} \itemize
alias   \begin{titlepage} \titlepage
alias   \begin{verbatim} verb \verbatim
alias   \begin{verbatimtab} \verbatimtab
alias   \begin{trivlist} \trivlist
alias   \begin{verse} \verse
alias   \begin{table} \table
alias   \begin{thebibliography} \thebibliography
alias   \begin{tabbing} \tabbing
alias   \begin{note} \note
alias   \begin{tabular} \tabular
alias   \begin{overlay} \overlay
alias   \begin{array} \array
alias   \begin{slide} \slide
alias   \begin{displaymath} \displaymath
alias   \begin{abstract} \abstract
alias   \begin{eqnarray} \eqnarray
alias   \begin{eqnarray*} \eqnarray*
alias   \begin{appendix} \appendix
alias   \begin{equation} \equation
alias   \begin{equation*} \equation*
alias   \begin{center} \center
alias   \begin{document} \document
alias   \begin{figure} \figure
alias   \begin{filecontents} \filecontents
alias   \begin{lrbox} \lrbox
alias   \begin{flushleft} \flushleft
alias   \begin{flushright} \flushright
alias   \begin{minipage} \minipage
alias   \begin{picture} \picture
alias   \begin{math} \math
alias   \begin{quote} \quote
alias   part \part{
alias   chapter \chapter{
alias   section \section{
alias   subsection \subsection{
alias   subsubsection \subsubsection{
alias   paragraph \paragraph{
alias   subparagraph \subparagraph{
alias   \begin{bfseries} \bfseries
alias   \begin{mdseries} \mdseries
alias   \begin{ttfamily} \ttfamily
alias   \begin{sffamily} \sffamily
alias   \begin{rmfamily} \rmfamily
alias   \begin{upshape} \upshape
alias   \begin{slshape} \slshape
alias   \begin{scshape} \scshape
alias   \begin{itshape} \itshape
alias   \usepackage
alias \ref
alias \label
alias \cite
alias   fore
alias   imt
alias ver
alias   function name(args)...end
alias wh
alias   h
alias func
alias       snip
alias   func
alias instead of the column name.
alias findInHistory="history |grep "
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls ="ls -la --color=auto"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
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
alias df='df -h'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias ls='ls -a'
alias ezshrc='emacs ~/.zshrc* &'
alias resource='source ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -lA'
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls="screen -ls"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv="virtualenv --distribute --no-site-packages venv"
alias la="ls -a"
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path
alias sa="ssh-add "
alias whead="curl --head $1"
alias ls="ls -alh"
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart="sudo service apache2 restart"
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
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
alias gm="git merge"
alias process='ps -ax'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
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
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias m="git add .;git commit -m"
alias al="alias | grep"
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
alias zss2='ssh root@192.168.1.2'
alias W=cat
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias al='alias | grep'
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
alias copy=cp
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias ds='du -sck * | sort -n'
alias ebuild='nocorrect ebuild'
alias edit-aliases='nano ~/.bash_aliases'
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
alias gl='cd ~/zdotfiles ; git add -A && git commit -a; git push origin master'
alias gll='cp ~/.oh-my-zsh/lib/aliases.zsh ~/zdotfiles/zsh/aliases.zsh && gl"
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
alias _='sudo'
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
alias sr='screen -r'
alias ss='vim $HOME/.zshrc'
alias ssh-config='nano ~/.ssh/config'
alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'
alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias tm='ps -ef | grep'
alias trace=trace
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias uncomment='egrep -v "^#|^$"'
alias unzip-all='7z x -y '\''*.zip'\'
alias up_master='git push origin master'
alias update='sudo apt-get update'
alias update-aliases='wget -q -O - "" https://alias.sh/user//alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh'
alias update-private-aliases='wget -q -O - "" https://alias.sh/user//alias/key/ > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vi=vim
alias vibash='vi ~/.bashrc; source ~/.bashrc'
alias vv='source ~/.vimrc.bundles.local'
alias vvv='source ~/.vimrc.local'
alias w='ls -alF'
alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias zshconfig='subl ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzz='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias ex='exit'
alias 'wn'='sudo lshw -class network'
alias n1='ip route show 0.0.0.0/0 | awk '{print }')'
alias _='sudo'
alias ee='echo'
alias eee='cat'
alias wch='sudo chown -hR bani:bani /home/bani'
alias wg='w | grep'
alias popd="popd;dirpersiststore"
alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdb='_rails_command dbconsole'
alias rdbm='rake db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rgm='_rails_command generate migration'
alias rp='_rails_command plugin'
alias ru='_rails_command runner'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias devlog='tail -f log/development.log'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias ys="yum search"                       # search package
alias yp="yum info"                         # show package info
alias yl="yum list"                         # list packages
alias ygl="yum grouplist"                   # list package groups
alias yli="yum list installed"              # print all installed packages
alias ymc="yum makecache"                   # rebuilds the yum package list
alias yu="sudo yum update"                  # upgrate packages
alias yi="sudo yum install"                 # install package
alias ygi="sudo yum groupinstall"           # install package group
alias yr="sudo yum remove"                  # remove package
alias ygr="sudo yum groupremove"            # remove pagage group
alias yrl="sudo yum remove --remove-leaves" # remove package and leaves
alias yc="sudo yum clean all"               # clean cache
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
alias gpoat='git push origin --all && git push origin --tags'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias mvncie='mvn clean install eclipse:eclipse'
alias mvnci='mvn clean install'
alias mvne='mvn eclipse:eclipse'
alias mvnce='mvn clean eclipse:clean eclipse:eclipse'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias h='history'
alias hsi='hs -i'
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'
alias pd='perldoc'
alias ple='perl -wlne'
alias latest-perl='curl -s http://www.perl.org/get.html | perl -wlne '\''if (/perl\-([\d\.]+)\.tar\.gz/) { print $1; exit;}'\'
alias sf2='php app/console'
alias sf2clear='php app/console cache:clear'
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias kate='kate >/dev/null 2>&1'
alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'
alias sgem='sudo gem'
alias rfind='find . -name "*.rb" | xargs grep -n'
alias rsync-copy="rsync -av --progress -h"
alias rsync-move="rsync -av --progress -h --remove-source-files"
alias rsync-update="rsync -avu --progress -h"
alias rsync-synchronize="rsync -avu --delete --progress -h"
alias kaput="tail -f ~/Library/Logs/Pow/apps/*"
alias pjo="pj open"
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias :3='echo'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias tldr='less'
alias alwayz='tail -f'
alias icanhas='mkdir'
alias gimmeh='touch'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias nowai='chmod'
alias hai='cd'
alias iz='ls'
alias plz='pwd'
alias ihasbucket='df -h'
alias inur='locate'
alias iminurbase='finger'
alias btw='nice'
alias obtw='nohup'
alias nomz='ps aux'
alias nomnom='killall'
alias byes='exit'
alias cya='reboot'
alias kthxbai='halt'
alias ag='apt-get'
alias ap='aptitude'
alias acs="apt-cache search"
alias aps='aptitude search'
alias as="aptitude -F \"* %p -> %d \n(%v/%V)\" \
alias afs='apt-file search --regexp'
alias asrc='apt-get source'
alias app='apt-cache policy'
alias allpkgs='aptitude search -F "%p" --disable-columns ~i'
alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
alias pc="sudo port clean --all installed"
alias pi="sudo port install $1"
alias psu="sudo port selfupdate"
alias puni="sudo port uninstall inactive"
alias puo="sudo port upgrade outdated"
alias pup="psu && puo"
alias ss='thin --stats "/thin/stats" start'
alias sg='ruby script/generate'
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'
alias sr='ruby script/runner'
alias ssp='ruby script/spec'
alias rdbm='rake db:migrate'
alias rdbtp='rake db:test:prepare'
alias migrate='rake db:migrate && rake db:test:prepare'
alias sc='ruby script/console'
alias sd='ruby script/server --debugger'
alias devlog='tail -f log/development.log'
alias artisan='php artisan'
alias bob='php artisan bob::build'
alias et='mate .'
alias ett='mate Gemfile app config features lib db public spec test Rakefile Capfile Todo'
alias etp='mate app config lib db public spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias etts='mate app config lib db public script spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias mr='mate CHANGELOG app config db lib public script spec test'
alias zeus='bundle exec zeus'
alias zi='zeus init'
alias zinit='zeus init'
alias zs='zeus start'
alias ztart='zeus start'
alias zc='zeus console'
alias zonsole='zeus console'
alias zsr='zeus server'
alias zerver='zeus server'
alias zr='zeus rake'
alias zake='zeus rake'
alias zg='zeus generate'
alias zenerate='zeus generate'
alias zrn='zeus runner'
alias zunner='zeus runner'
alias zcu='zeus cucumber'
alias zucumber='zeus cucumber'
alias zspec='zeus rspec'
alias zt='zeus test'
alias zest='zeus test'
alias zu='zeus test test/unit/*'
alias zunits='zeus test test/unit/*'
alias zf='zeus test test/functional/*'
alias zunctional='zeus test test/functional/*'
alias za='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zall='zeus test test/unit/*; zeus test test/functional/; zeus cucumber'
alias zsw='rm .zeus.sock'
alias zweep='rm .zeus.sock'
alias x=extract
alias jrspec='jruby --debug -S rspec --debug'
alias jprofile='jruby --profile.api -S rspec'
alias jexec='jruby -S'
alias zi='sudo zypper install'
alias zrf='sudo zypper refresh'
alias zs='zypper search'
alias zup='sudo zypper dist-upgrade'
alias zrm='sudo zypper remove'
alias zp='sudo zypper patch'
alias zps='sudo zypper ps'
alias cloudapp=$ZSH/plugins/cloudapp/cloudapp.rb
alias jira='open_jira_issue'
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'
alias lho='open_lighthouse_ticket'
alias n='nanoc'
alias na='nanoc autocompile'
alias nco='nanoc compile'
alias nci='nanoc create_item'
alias ncl='nanoc create_layout'
alias ncs='nanoc create_site'
alias nd='nanoc deploy'
alias nv='nanoc view'
alias nw='nanoc watch'
alias st=st_run
alias stt='st .'
alias apache2start='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper start'
alias apache2stop='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper stop'
alias apache2restart='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper restart'
alias brews='brew list -1'
alias e64=encode64
alias d64=decode64
alias mysqlstart='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysqlstop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias mysqlrestart='sudo /opt/local/share/mysql5/mysql/mysql.server restart'
alias mysqlstatus='mysqladmin5 -u root -p ping'
alias t=task
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias c='composer'
alias csu='composer self-update'
alias cu='composer update'
alias ci='composer install'
alias ccp='composer create-project'
alias cget='curl -s https://getcomposer.org/installer | php'
alias hgc='hg commit'
alias hgb='hg branch'
alias hgba='hg branches'
alias hgco='hg checkout'
alias hgd='hg diff'
alias hged='hg diffmerge'
alias hgl='hg pull -u'
alias hgp='hg push'
alias hgs='hg status'
alias hgca='hg qimport -r tip ; hg qrefresh -e ; hg qfinish tip'
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
alias rake="noglob rake" # allows square brackts for rake task invocation
alias brake='noglob bundle exec rake' # execute the bundled rake gem
alias srake='noglob sudo rake' # noglob must come before sudo
alias sbrake='noglob sudo bundle exec rake' # altogether now ... 
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
alias W=cat
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias al='alias | grep'
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
alias copy=cp
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias ds='du -sck * | sort -n'
alias ebuild='nocorrect ebuild'
alias edit-aliases='nano ~/.bash_aliases'
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
alias gll='git add -A; git commit -a; git push origin master'
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
alias sr='screen -r'
alias ss='vim $HOME/.zshrc'
alias ssh-config='nano ~/.ssh/config'
alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'
alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias tm='ps -ef | grep'
alias trace=trace
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias uncomment='egrep -v "^#|^$"'
alias unzip-all='7z x -y '\''*.zip'\'
alias up_master='git push origin master'
alias update='sudo apt-get update'
alias update-aliases='wget -q -O - "" https://alias.sh/user//alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh'
alias update-private-aliases='wget -q -O - "" https://alias.sh/user//alias/key/ > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vi=vim
alias vibash='vi ~/.bashrc; source ~/.bashrc'
alias vv='source ~/.vimrc.bundles.local'
alias vvv='source ~/.vimrc.local'
alias w='ls -alF'
alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias zshconfig='subl ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzz='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias d='dirs -v | head -10'
alias [ -group name ...] key address [ address ...]
alias muttdude me@cs.hmc.edu (Michael Elkins)
alias theguys manny, moe, jack
alias juser abd30425@somewhere.net (Joe User)
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias gll='git add -A; git commit -a; git push origin master'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
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
alias W=cat
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias al='alias | grep'
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
alias copy=cp
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias ds='du -sck * | sort -n'
alias ebuild='nocorrect ebuild'
alias edit-aliases='nano ~/.bash_aliases'
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
alias gl='cd ~/zdotfiles ; git add -A && git commit -a; git push origin master'
alias gll='cp ~/.oh-my-zsh/lib/aliases.zsh ~/zdotfiles/zsh/aliases.zsh && gl"
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
alias _='sudo'
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
alias sr='screen -r'
alias ss='vim $HOME/.zshrc'
alias ssh-config='nano ~/.ssh/config'
alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'
alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias tm='ps -ef | grep'
alias trace=trace
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias uncomment='egrep -v "^#|^$"'
alias unzip-all='7z x -y '\''*.zip'\'
alias up_master='git push origin master'
alias update='sudo apt-get update'
alias update-aliases='wget -q -O - "" https://alias.sh/user//alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh'
alias update-private-aliases='wget -q -O - "" https://alias.sh/user//alias/key/ > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vi=vim
alias vibash='vi ~/.bashrc; source ~/.bashrc'
alias vv='source ~/.vimrc.bundles.local'
alias vvv='source ~/.vimrc.local'
alias w='ls -alF'
alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias zshconfig='subl ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzz='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias 'ex'=exit
alias 'wn'='sudo lshw -class network'
alias n1='gateway='
alias n1='ip route show 0.0.0.0/0 | awk '{print }')'
alias _='sudo'
alias ee='echo'
alias eee='cat'
alias eeee='less'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias lsp='ls --color=none'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias dush="du -sm *|sort -n|tail"
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias calc='python -ic "from math import *; from random import *"'
alias cdd="CDDIR=$(pwd)"
alias g='git'
alias tail='tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 80`} - 7))'
alias ulimith="command ulimit -a|sed 's/^.*\([a-z]\))\(.*\)$/-\1\2/;s/^/ulimit /'|tr '\n' ' ';echo"
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias restoremod='chgrp users -R .;chmod u=rwX,g=rX,o=rX -R .;chown $(pwd |cut -d / -f 3) -R .'
alias showip="ifconfig eth0 | grep 'inet addr:' | sed 's/.*addr\:\(.*\) Bcast\:.*/\1/'"
alias to show my own configured ip
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias mkdd='mkdir $(date +%Y%m%d)'
alias osd_cat="osd_cat -o 400 -s 8 -c blue -d 60 -f -*-bitstream\ vera\ sans-*-*-*--200-*-*-*-*-*-*-*"
alias ssh-x='ssh -c arcfour,blowfish-cbc -XC'
alias ll='ls -lisaG'
alias emacs='vim'
alias colortest="python -c \"print('\n'.join([(' '.join([('\033[38;5;' + str((i + j)) + 'm' + str((i + j)).ljust(5) + '\033[0m') if i + j < 256 else '' for j in range(10)])) for i in range(0, 256, 10)]))\""
alias sdr="screen -dR"
alias pp='python -mjson.tool | pygmentize -l javascript'
alias ls='ls --color=auto'
alias g='git'
alias rrm='/bin/rm -i'; alias rm='trash'
alias irc="screen -D -R -S chatclient irssi"
alias ls='if [[ -f .hidden ]]; then while read l; do opts+=(--hide="$l"); done < .hidden; fi; ls --color=auto "${opts[@]}"'
alias md='mkdir -p'; alias rd='rmdir'; mcd () { mkdir "$@" && cd "$_"; }
alias ':q'='exit'; alias ':e'='vim';
alias pasteit="curl -F 'sprunge=<-' http://sprunge.us"
alias myip='curl -s http://checkrealip.com/ | grep "Current IP Address"'
alias vless='/usr/share/vim/vimcurrent/macros/less.sh'
alias fu='curl -s http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext | grep -vE "^$|^#"'
alias html2ascii='lynx -force_html -stdin -dump -nolist'
alias b='cd ../'
alias b='cd ../'
alias bb='cd ../../'
alias bbb='cd ../../../'
alias bbbb='cd ../../../../'
alias man='man -S 2:3:1'
alias tail='tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 80`} - 7))'
alias sshto 'ssh -X -t \!:1 "cd \!:2 ; tcsh"'
alias sudo='sudo '
alias sortfast='sort -S$(($(sed '\''/MemF/!d;s/[^0-9]*//g'\'' /proc/meminfo)/2048)) $([ `nproc` -gt 1 ]&&echo -n --parallel=`nproc`)'
alias rm='echo "rm is disabled, use trash or /bin/rm instead."'
alias tproxy='ssh -ND 8118 user@server&; export LD_PRELOAD="/usr/lib/libtsocks.so"'
alias sshu="ssh -o UserKnownHostsFile=/dev/null "
alias cstdin='echo "Ctrl-D when done." && gcc -Wall -o ~/.stdin.exe ~/.stdin.c && ~/.stdin.exe'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias dush="du -sm *|sort -n|tail"
alias server-etc="ssh -t server 'cd /etc && $SHELL'"
alias psgrep='ps aux | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
alias vim="vim -p"
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias nl2space="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{ }, @F) , qq{\n};}' "
alias nl2space="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{ }, @F) , qq{\n};}' "
alias nl2,="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{,}, @F) , qq{\n};}' "
alias psme='ps -ef | grep $USER'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$F" "$D" &>/dev/null ) & )'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); S=$SECONDS; tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" && logger -s "Tarred $D to $F in $(($SECONDS-$S)) seconds" ) & )'
alias myscp='rsync --progress --partial --rsh="ssh -p 8322" --bwlimit=100 --ipv4'
alias mux='clear && cd ~/Music/ && ls && echo -n "File> " && read msi && mplayer ~/Music/$msi'
alias va='vi ~/.aliases; source ~/.aliases && echo "aliases sourced"'
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias sete='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/q;p"'
alias sete='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/q;p"'
alias setf='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/,\$p"'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias fnext='read cur total && echo -n "[$cur/$total] " && read'
alias -g R=' &; jobs | tail -1 | read A0 A1 A2 cmd; echo "running $cmd"; fg "$cmd"; zenity --info --text "$cmd done"; unset A0 A1 A2 cmd'
alias busy='rnd_file=$(find /usr/include -type f -size +5k | sort -R | head -n 1) && vim +$((RANDOM%$(wc -l $rnd_file | cut -f1 -d" "))) $rnd_file'
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias screenr='screen -r $(screen -ls | egrep -o -e '[0-9]+' | head -n 1)'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias dush="du -sm *|sort -n|tail"
alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias ..='cd ..'
alias ...=".. 2" ....=".. 3"
alias burnaudiocd='mkdir ./temp && for i in *.[Mm][Pp]3;do mpg123 -w "./temp/${i%%.*}.wav" "$i";done;cdrecord -pad ./temp/* && rm -r ./temp'
alias ..="cd .."; alias ...="cd ../.."; alias ....="cd ../../.."
alias ..="cd .." ...="cd ../.." ....="cd ../../.."
alias launchpadkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys"
alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias ':q'='exit'
alias to close terminal with :q
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias whichall='{ command alias; command declare -f; } | command which --read-functions --read-alias -a'
alias which='{ command alias; command declare -f; } | command which --read-functions --read-alias'
alias whicha='command alias | command which --read-alias'
alias whichf='command declare -f | command which --read-functions'
alias whichx='command which'
alias whichall='{ command alias; command declare -f; } | command which --read-functions --read-alias -a'
alias stripansi='perl -ple "s/\033\[(?:\d*(?:;\d+)*)*m//g;"'
alias urlencode='perl -MURI::Escape -ne "\$/=\"\"; print uri_escape \$_"'
alias -g R=' &; jobs | tail -1 | read A0 A1 A2 cmd; echo "running $cmd"; fg "$cmd"; zenity --info --text "$cmd done"; unset A0 A1 A2 cmd'
alias lf='find ./* -ctime -1 | xargs ls -ltr --color'
alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias s='ssh -l root'
alias cd1='cd $( ls -lt | grep ^d | head -1 | cut -b 51- )'
alias ls='/bin/ls $LS_OPTIONS'
alias screensaver='for ((;;)); do echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))"; sleep 0.1 ; done'
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias myscp='rsync --progress --partial --rsh="ssh -p 8322" --bwlimit=100 --ipv4'
alias cd1='cd $( ls -lt | grep ^d | head -1 | cut -b 51- )'
alias cd1='cd $( ls -1t | grep ^d | head -1)'
alias ls='/bin/ls $LS_OPTIONS'
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias cdd="history -a && grep '^ *[0-9]* *cd ' ~/.bash_history| tail -10 >>~/.bash_history && history -r ~/.bash_history"
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$F" "$D" &>/dev/null ) & )'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); S=$SECONDS; tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" && logger -s "Tarred $D to $F in $(($SECONDS-$S)) seconds" ) & )'
alias rot13='perl -pe "y/A-Za-z/N-ZA-Mn-za-m/;"'
alias ls='if [[ -f .hidden ]]; then while read l; do opts+=(--hide="$l"); done < .hidden; fi; ls --color=auto "${opts[@]}"'
alias t 'ls -ltch \!* | head -20'
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias nsl 'netstat -f inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'
alias findInHistory="history |grep "
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls ="ls -la --color=auto"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
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
alias df='df -h'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias ls='ls -a'
alias ezshrc='emacs ~/.zshrc* &'
alias resource='source ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -lA'
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls="screen -ls"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv="virtualenv --distribute --no-site-packages venv"
alias la="ls -a"
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path
alias sa="ssh-add "
alias whead="curl --head $1"
alias ls="ls -alh"
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart="sudo service apache2 restart"
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
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
alias gm="git merge"
alias process='ps -ax'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
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
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias m="git add .;git commit -m"
alias al="alias | grep"
alias findInHistory="history |grep "
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls ="ls -la --color=auto"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
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
alias df='df -h'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias ls='ls -a'
alias ezshrc='emacs ~/.zshrc* &'
alias resource='source ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -lA'
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls="screen -ls"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv="virtualenv --distribute --no-site-packages venv"
alias la="ls -a"
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path
alias sa="ssh-add "
alias whead="curl --head $1"
alias ls="ls -alh"
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart="sudo service apache2 restart"
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
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
alias gm="git merge"
alias process='ps -ax'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
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
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias m="git add .;git commit -m"
alias al="alias | grep"
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias gll='git add -A; git commit -a; git push origin master'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
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
alias W=cat
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias al='alias | grep'
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
alias copy=cp
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias ds='du -sck * | sort -n'
alias ebuild='nocorrect ebuild'
alias edit-aliases='nano ~/.bash_aliases'
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
alias gl='cd ~/zdotfiles ; git add -A && git commit -a; git push origin master'
alias gll='cp ~/.oh-my-zsh/lib/aliases.zsh ~/zdotfiles/zsh/aliases.zsh && gl"
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
alias _='sudo'
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
alias sr='screen -r'
alias ss='vim $HOME/.zshrc'
alias ssh-config='nano ~/.ssh/config'
alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'
alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias tm='ps -ef | grep'
alias trace=trace
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias uncomment='egrep -v "^#|^$"'
alias unzip-all='7z x -y '\''*.zip'\'
alias up_master='git push origin master'
alias update='sudo apt-get update'
alias update-aliases='wget -q -O - "" https://alias.sh/user//alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh'
alias update-private-aliases='wget -q -O - "" https://alias.sh/user//alias/key/ > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vi=vim
alias vibash='vi ~/.bashrc; source ~/.bashrc'
alias vv='source ~/.vimrc.bundles.local'
alias vvv='source ~/.vimrc.local'
alias w='ls -alF'
alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias zshconfig='subl ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzz='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias 'ex'=exit
alias 'wn'='sudo lshw -class network'
alias n1='gateway='
alias n1='ip route show 0.0.0.0/0 | awk '{print }')'
alias _='sudo'
alias ee='echo'
alias eee='cat'
alias eeee='less'
alias debug="set -o nounset; set -o xtrace"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias more='less'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias lsp='ls --color=none'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias dush="du -sm *|sort -n|tail"
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias calc='python -ic "from math import *; from random import *"'
alias cdd="CDDIR=$(pwd)"
alias g='git'
alias tail='tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 80`} - 7))'
alias ulimith="command ulimit -a|sed 's/^.*\([a-z]\))\(.*\)$/-\1\2/;s/^/ulimit /'|tr '\n' ' ';echo"
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias restoremod='chgrp users -R .;chmod u=rwX,g=rX,o=rX -R .;chown $(pwd |cut -d / -f 3) -R .'
alias showip="ifconfig eth0 | grep 'inet addr:' | sed 's/.*addr\:\(.*\) Bcast\:.*/\1/'"
alias to show my own configured ip
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias mkdd='mkdir $(date +%Y%m%d)'
alias osd_cat="osd_cat -o 400 -s 8 -c blue -d 60 -f -*-bitstream\ vera\ sans-*-*-*--200-*-*-*-*-*-*-*"
alias ssh-x='ssh -c arcfour,blowfish-cbc -XC'
alias ll='ls -lisaG'
alias emacs='vim'
alias colortest="python -c \"print('\n'.join([(' '.join([('\033[38;5;' + str((i + j)) + 'm' + str((i + j)).ljust(5) + '\033[0m') if i + j < 256 else '' for j in range(10)])) for i in range(0, 256, 10)]))\""
alias sdr="screen -dR"
alias pp='python -mjson.tool | pygmentize -l javascript'
alias ls='ls --color=auto'
alias g='git'
alias rrm='/bin/rm -i'; alias rm='trash'
alias irc="screen -D -R -S chatclient irssi"
alias ls='if [[ -f .hidden ]]; then while read l; do opts+=(--hide="$l"); done < .hidden; fi; ls --color=auto "${opts[@]}"'
alias md='mkdir -p'; alias rd='rmdir'; mcd () { mkdir "$@" && cd "$_"; }
alias ':q'='exit'; alias ':e'='vim';
alias pasteit="curl -F 'sprunge=<-' http://sprunge.us"
alias myip='curl -s http://checkrealip.com/ | grep "Current IP Address"'
alias vless='/usr/share/vim/vimcurrent/macros/less.sh'
alias fu='curl -s http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext | grep -vE "^$|^#"'
alias html2ascii='lynx -force_html -stdin -dump -nolist'
alias b='cd ../'
alias b='cd ../'
alias bb='cd ../../'
alias bbb='cd ../../../'
alias bbbb='cd ../../../../'
alias man='man -S 2:3:1'
alias tail='tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 80`} - 7))'
alias sshto 'ssh -X -t \!:1 "cd \!:2 ; tcsh"'
alias sudo='sudo '
alias sortfast='sort -S$(($(sed '\''/MemF/!d;s/[^0-9]*//g'\'' /proc/meminfo)/2048)) $([ `nproc` -gt 1 ]&&echo -n --parallel=`nproc`)'
alias rm='echo "rm is disabled, use trash or /bin/rm instead."'
alias tproxy='ssh -ND 8118 user@server&; export LD_PRELOAD="/usr/lib/libtsocks.so"'
alias sshu="ssh -o UserKnownHostsFile=/dev/null "
alias cstdin='echo "Ctrl-D when done." && gcc -Wall -o ~/.stdin.exe ~/.stdin.c && ~/.stdin.exe'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias dush="du -sm *|sort -n|tail"
alias server-etc="ssh -t server 'cd /etc && $SHELL'"
alias psgrep='ps aux | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
alias vim="vim -p"
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias nl2space="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{ }, @F) , qq{\n};}' "
alias nl2space="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{ }, @F) , qq{\n};}' "
alias nl2,="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{,}, @F) , qq{\n};}' "
alias psme='ps -ef | grep $USER'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$F" "$D" &>/dev/null ) & )'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); S=$SECONDS; tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" && logger -s "Tarred $D to $F in $(($SECONDS-$S)) seconds" ) & )'
alias myscp='rsync --progress --partial --rsh="ssh -p 8322" --bwlimit=100 --ipv4'
alias mux='clear && cd ~/Music/ && ls && echo -n "File> " && read msi && mplayer ~/Music/$msi'
alias va='vi ~/.aliases; source ~/.aliases && echo "aliases sourced"'
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias sete='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/q;p"'
alias sete='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/q;p"'
alias setf='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/,\$p"'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias fnext='read cur total && echo -n "[$cur/$total] " && read'
alias -g R=' &; jobs | tail -1 | read A0 A1 A2 cmd; echo "running $cmd"; fg "$cmd"; zenity --info --text "$cmd done"; unset A0 A1 A2 cmd'
alias busy='rnd_file=$(find /usr/include -type f -size +5k | sort -R | head -n 1) && vim +$((RANDOM%$(wc -l $rnd_file | cut -f1 -d" "))) $rnd_file'
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias screenr='screen -r $(screen -ls | egrep -o -e '[0-9]+' | head -n 1)'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias dush="du -sm *|sort -n|tail"
alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias ..='cd ..'
alias ...=".. 2" ....=".. 3"
alias burnaudiocd='mkdir ./temp && for i in *.[Mm][Pp]3;do mpg123 -w "./temp/${i%%.*}.wav" "$i";done;cdrecord -pad ./temp/* && rm -r ./temp'
alias ..="cd .."; alias ...="cd ../.."; alias ....="cd ../../.."
alias ..="cd .." ...="cd ../.." ....="cd ../../.."
alias launchpadkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys"
alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias ':q'='exit'
alias to close terminal with :q
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias whichall='{ command alias; command declare -f; } | command which --read-functions --read-alias -a'
alias which='{ command alias; command declare -f; } | command which --read-functions --read-alias'
alias whicha='command alias | command which --read-alias'
alias whichf='command declare -f | command which --read-functions'
alias whichx='command which'
alias whichall='{ command alias; command declare -f; } | command which --read-functions --read-alias -a'
alias stripansi='perl -ple "s/\033\[(?:\d*(?:;\d+)*)*m//g;"'
alias urlencode='perl -MURI::Escape -ne "\$/=\"\"; print uri_escape \$_"'
alias -g R=' &; jobs | tail -1 | read A0 A1 A2 cmd; echo "running $cmd"; fg "$cmd"; zenity --info --text "$cmd done"; unset A0 A1 A2 cmd'
alias lf='find ./* -ctime -1 | xargs ls -ltr --color'
alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias s='ssh -l root'
alias cd1='cd $( ls -lt | grep ^d | head -1 | cut -b 51- )'
alias ls='/bin/ls $LS_OPTIONS'
alias screensaver='for ((;;)); do echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))"; sleep 0.1 ; done'
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias myscp='rsync --progress --partial --rsh="ssh -p 8322" --bwlimit=100 --ipv4'
alias cd1='cd $( ls -lt | grep ^d | head -1 | cut -b 51- )'
alias cd1='cd $( ls -1t | grep ^d | head -1)'
alias ls='/bin/ls $LS_OPTIONS'
alias env='aae {A..Z} {a..z} "_"|sort|cat -v 2>&1 | sed "s/\\^\\[/\\\\033/g"'
alias cdd="history -a && grep '^ *[0-9]* *cd ' ~/.bash_history| tail -10 >>~/.bash_history && history -r ~/.bash_history"
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'
alias dateh='date --help|sed "/^ *%%/,/^ *%Z/!d;s/ \+/ /g"|while read l;do date "+ %${l/% */}_${l/% */}_${l#* }";done|column -s_ -t'
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$F" "$D" &>/dev/null ) & )'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); S=$SECONDS; tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" && logger -s "Tarred $D to $F in $(($SECONDS-$S)) seconds" ) & )'
alias rot13='perl -pe "y/A-Za-z/N-ZA-Mn-za-m/;"'
alias ls='if [[ -f .hidden ]]; then while read l; do opts+=(--hide="$l"); done < .hidden; fi; ls --color=auto "${opts[@]}"'
alias t 'ls -ltch \!* | head -20'
alias stath="stat --h|sed '/Th/,/NO/!d;/%/!d'"
alias nsl 'netstat -f inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'
alias findInHistory="history |grep "
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls ="ls -la --color=auto"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
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
alias df='df -h'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias ls='ls -a'
alias ezshrc='emacs ~/.zshrc* &'
alias resource='source ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -lA'
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls="screen -ls"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv="virtualenv --distribute --no-site-packages venv"
alias la="ls -a"
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path
alias sa="ssh-add "
alias whead="curl --head $1"
alias ls="ls -alh"
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart="sudo service apache2 restart"
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
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
alias gm="git merge"
alias process='ps -ax'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
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
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias m="git add .;git commit -m"
alias al="alias | grep"
alias findInHistory="history |grep "
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls ="ls -la --color=auto"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
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
alias df='df -h'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias ls='ls -a'
alias ezshrc='emacs ~/.zshrc* &'
alias resource='source ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -lA'
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls="screen -ls"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases"
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv="virtualenv --distribute --no-site-packages venv"
alias la="ls -a"
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path
alias sa="ssh-add "
alias whead="curl --head $1"
alias ls="ls -alh"
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart="sudo service apache2 restart"
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
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
alias gm="git merge"
alias process='ps -ax'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
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
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias m="git add .;git commit -m"
alias al="alias | grep"
alias zzs='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzv='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
alias gll='git add -A; git commit -a; git push origin master'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agdu='sudo apt-get dist-upgrade'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias sdi='sudo dpkg -i'
alias findInHistory='history |grep '
alias debinstall="sudo dpkg -i "
alias la='ls -lah --color=auto'
alias ls='ls -la --color=auto'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh"
alias update-aliases="wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.zsh_alias_sh && source ~/.oh-my-zsh/lib/aliases.zsh"
alias listips='nmap -sP 192.168.2.0/24'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias WW='cat'
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
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias qfind="find . -name "
alias dfree="df -h -x tmpfs"
alias zshconfig="subl ~/.zshrc"
alias snlcp='tr -d "\n" | pbcopy'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias llocal='ifconfig eth0 | grep inet6'
alias 2d='cd ../../'
alias 3d='cd ../../../'
alias eg="git config -e"
alias ddel="rm -Rf"
alias agi="sudo apt-get install -y"
alias convert_pdf="abiword --to=pdf $1"
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias clip="xclip -sel clip"
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias vibash='vi ~/.bashrc; source ~/.bashrc'
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
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias myip='curl ip.appspot.com'
alias hist='history | grep --color=auto'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias psg='ps -ef |grep '
alias up_master="git push origin master"
alias ds='du -ks *|sort -n'
alias cathtml="sed 's/<[^>]*>//g'"
alias md='mkdir -p'
alias xs='cd `pwd -P`'
alias gsl='git shortlog -nsw -e'
alias l='ls -hog'
alias zshrc="vi ~/.zshrc"
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'''\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias la='ls -la --color=auto'
alias netlisteners='lsof -i -P | grep LISTEN'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
alias psf='ps auxf'
alias l='ls -lAh --color'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ll="ls -ailh"
alias a2r="/etc/init.d/apache2 restart";
alias gpo="git pull origin"
alias q='exit'
alias no-assume='git update-index --no-assume-unchanged'
alias assume='git update-index --assume-unchanged'
alias cd=go $1
alias ssh-config="nano ~/.ssh/config"
alias ..='cd ..'
alias ...='cd ../../'
alias freenodetor="dig +short irc.tor.freenode.net cname"
alias grep='grep -Rin --color=always --exclude-dir=.svn --exclude-dir=cache'
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
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
alias ds='du -sck * | sort -n'
alias rm='rm -rf --preserve-root'
alias nfas='grep -c "^>"'
alias hist='history | grep '
alias tart='tar tzvf'
alias tarc='tar czvf'
alias tarx='tar xzvf'
alias trace=trace
alias qless='qstat -u "*" | less
alias sud='sudo -s'
alias lr='ls -R'
alias ll='ls -lF'
alias llr='ll -R'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias edit-aliases='nano ~/.bash_aliases'
alias l='ls -lah'
alias wcr='wc `find . -type f`'
alias rm='rm -I'
alias gg="sr google -browser=$BROWSER"
alias h='cd $HOME'
alias erase='shred -n 35 -z -u'
alias sulast='su -c $(history -p !-1) root'
alias ll='ls -alFrth'
alias sandbox='source ${HOME}/sandbox/bin/activate'
alias prs='ps faux|grep -v grep|grep "$@"'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias d='git diff|tig'
alias grphp='ps -auwx | grep php'
alias ll='ls -lhF'
alias lla='ls -lhFA'
alias back='cd -'
alias cd..='cd ..'
alias fn='find -name'
alias fin='find -iname'
alias fwn='find -wholename'
alias lns='ln -s'
alias confcat="sed -e 's/[#;].*//;/^\s*$/d' "$@""
alias scw='screen -wipe'
alias sls='screen -ls'
alias update-aliases='wget -q -O - \"$@\" https://alias.sh/user/$ALIAS_SH_USER_ID/alias > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias la='ls -a'
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias sa='ssh-add '
alias whead='curl --head $1'
alias ls='ls -alh'
alias logs='tail -n30 /var/log/apache2/error.log'
alias a2-restart='sudo service apache2 restart'
alias aa="git add -A ."
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias gc="git commit -m "
alias co="git checkout "
alias gp="git pull origin "
alias gpm="gp master"
alias pm="git push origin master"
alias gb="git branch"
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
alias ll="ls -l"
alias l="ls -al"
alias update='sudo apt-get update'
alias cgrep='grep --color=always'
alias remove='sudo apt-get remove'
alias install='sudo apt-get install'
alias k9='kill -9'
alias gs='git status'
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
alias gm='git merge'
alias process='ps -ax'
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sniff='sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80''
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'
alias gb="git checkout -b"
alias open='xdg-open'
alias display='less +F'
alias please="sudo"
alias tm='ps -ef | grep'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias ls='ls --color=auto' #For Linux
alias ls='ls -G' #For OSX
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gpm='git push origin master'
alias sc='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
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
alias gl='git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'
alias m="git add .;git commit -m"
alias al='alias | grep'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
alias prs='ps faux|grep -v grep|grep "$@"'
