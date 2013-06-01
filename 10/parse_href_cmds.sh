# commandlinefu.com by David Winterbottom

# Convert JSON to YAML
ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < file.json > file.yaml

# Simulate typing but with mistakes
echo -e "You are a jerk\b\b\b\bwonderful person" | pv -qL $[10+(-2 + RANDOM%5)]

# List the size (in human readable form) of all sub folders from the current location
du -hs *

# Open (in vim) all modified files in a git repository
vim `git status --porcelain | sed -ne 's/^ M //p'`

# This little command edits your gitignore from anywhere in your repo
vim $(git rev-parse --show-toplevel)/.gitignore

# get current git branch
git rev-parse --symbolic-full-name --abbrev-ref HEAD

# add untracked/changed items to a git repository before doing a commit and/or sending upstream
git status --porcelain | awk '{print $2}' | xargs git add

# Show a random oneliner from commandlinefu.com
echo -e "`curl -sL http://www.commandlinefu.com/commands/random/json|sed -re 's/.*,"command":"(.*)","summary":"([^"]+).*/\\x1b[1;32m\2\\n\\n\\x1b[1;33m\1\\x1b[0m/g'`\n"

# Find a list of all installed packages on a Redhat/CentOS system
rpm -qa | sort | sed -n -e "s/\-[0-9].[0-9]*.*//p" | uniq

# Prints per-line contribution per author for a GIT repository
git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr

# Create a git archive of the latest commit with revision number as name of file
git archive HEAD --format=zip -o `git rev-parse HEAD`.zip

# parse html/stdin with lynx
alias html2ascii='lynx -force_html -stdin -dump -nolist'

# multiline data block parse and CSV data extraction with perl
cat z.log |  perl -ne 'BEGIN{ print "DATE;RATE\n"; } /\[(\d.*)\]/ && print $1; /CURRENT RATE: +(\S+) msg.*/ && print ";" .$1 . "\n"; '

# Preserve existing aliases on sudo commands
alias sudo='sudo '

# Multi (file)source SSH host tab-completion
complete -W "$( { awk '/^Host / { print $2 }' ~/.ssh/config | egrep -v '\*|,'      echo $( grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //' )      while IFS=' ,' read host t; do echo $host; done < ~/.ssh/known_hosts ;} )" ssh

# Style a block of code in a blog that accepts HTML.
overflow:auto;padding:5px;border-style:double;font-weight:bold;color:#00ff00;background-color:0;"><pre style="white-space:pre-wrap;white-space:-moz-pre-wrap !important;white-space:-pre-wrap;white-space:-o-pre-wrap;word-wrap:break-word;_white-space:pre;

# extract element of xml
xml2 < file.xml | grep ^/path/to/element | cut -f2- -d=

# Print diagram of user/groups
awk 'BEGIN{FS=":"; print "digraph{"}{split($4, a, ","); for (i in a) printf "\"%s\" [shape=box]\n\"%s\" -> \"%s\"\n", $1, a[i], $1}END{print "}"}' /etc/group|display

# Draw kernel module dependancy graph.
lsmod | awk 'BEGIN{print "digraph{"}{split($4, a, ","); for (i in a) print $1, "->", a[i]}END{print "}"}'|display

# Draw kernel module dependancy graph.
lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -

# google tts
say() { curl -sA Mozilla -d q=`python3 -c 'from urllib.parse import quote_plus; from sys import stdin; print(quote_plus(stdin.read()[:100]))' <<<"$@"` 'http://translate.google.com/translate_tts' | mpg123 -q -; }

# One liner to parse all epubs in a directory and use the calibre ebook-convert utility to convert them to mobi format
for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" --prefer-author-sort --output-profile=kindle --linearize-tables --smarten-punctuation --asciiize --enable-heuristics;done

# Find Malware in the current and sub directories by MD5 hashes
IFS=$'\n' && for f in `find . -type f -exec md5sum "{}" \;`; do echo $f | sed -r 's/^[^ ]+/Checking:/'; echo $f | cut -f1 -d' ' | netcat hash.cymru.com 43 ; done

# Multiple variable assignments from command output in BASH
eval $(date +"day=%d; month=%m; year=%y")

# Make redirects to localhost via /etc/hosts more interesting
sudo socat TCP4-LISTEN:80,bind=127.0.0.1,fork EXEC:'echo "HTTP/1.1 503 Service Unavailable";'

