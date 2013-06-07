#which <command> > /dev/null 2>&1 && echo Success!
# Google verbatim search on your terminal
#function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }
# get a random number in bash
alias 'w_RANDOM'='echo $[RANDOM % 100]  # range 0-99'
#
#rec -r 44100 -p | sox -p "audio_name-$(date '+%Y-%m-%d').ogg" silence -l 1 00:00:00.5 -45d -1 00:00:00.5 -45d<]*/

#function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }
#function {
#curl -u abobani --silent https://mail.google.com/mail/feed/atom | perl -ne 'print t if /<name>/
#print n if /<(title|name)>(.*)<\/\1>/;
#}

alias which <command> > /dev/null 2>&1 && echo Success!
