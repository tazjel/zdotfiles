

#alias A
#B
#C
#D

#AA
#BB
#CC
#DD
#AAA
#BBB
alias 'CCC'=cmdfu'
# ag -i $1 ./abobani/clf-ALL.txt | sort -n | uniq --ignore-case >> zwgrep.txt
#DDD


##
##
#
function cmdfu(){
local t=~/cmdfu
echo -e "\n# $1 {{{1">>$t
curl -L "commandlinefu.com/commands/matching/$1/`echo -n $1|base64`/plaintext"|sed '1,2d;s/^#.*/& {{{2/g'>$t
vim -u /dev/null -c "set ft=sh fdm=marker fdl=1 noswf" -M $t
rm $t
}
#
alias 'Ww_dmesg'='sudo dmesg | tail -4'


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


