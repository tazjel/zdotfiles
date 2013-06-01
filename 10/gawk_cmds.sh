# commandlinefu.com by David Winterbottom

# list unique file extensions recursively for a path, include extension frequency stats
find /some/path -type f | gawk -F/ '{print $NF}' | gawk -F. '/\./{print $NF}' | sort | uniq -c | sort -rn

# find duplicate messages in a Maildir
find $folder -name "[1-9]*" -type f -print|while read file; do echo $file $(sed -e '/^$/Q;:a;$!N;s/\n //;ta;s/ /_/g;P;D' $file|awk '/^Received:/&&!r{r=$0}/^From:/&&!f{f=$0}r&&f{printf "%s%s",r,f;exit(0)}');done|sort -k 2|uniq -d -f 1

# fbari
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=521826202&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# fb1
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=4&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# face are
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=100000475200812&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# Find highest context switches
grep -H voluntary_ctxt /proc/*/status |gawk '{ split($1,proc,"/"); if ( $2 > 10000000 ) { printf $2 " - Process : "; system("ps h -o cmd -p "proc[3]) } }' | sort -nk1,1 | sed 's/^/Context Switches: /g'

# Capture screen and mic input using FFmpeg and ALSA
a=$(xwininfo |gawk 'BEGIN {FS="[x+ \t]*"} /-geometry/ {print int(($3+1)/2)*2"x"int(($4+1)/2)*2"+"$5"+"$6}') ; echo ${a} ; ffmpeg -f x11grab -s ${a} -r 10 -i :0.0 -sameq -f mp4 -s wvga -y /tmp/out.mpg

# Prefix command output with duration for each line
program | gawk 'BEGIN { l=systime() ; p="-- start --" } { t=systime(); print t-l "s " p; l=t; p=$0 } END { t=systime(); print t-l "s " p}'

# Command to kill PID
ps auxww | grep application | grep processtobekilled | gawk '{print $2}' | grep -v grep | xargs kill -9

# gawk gets fixed width field
ls -l | gawk -v FIELDWIDTHS='1 3 3 3' '{print $2}'

# find an unused unprivileged TCP port
netstat -tan | awk '$1 == "tcp" && $4 ~ /:/ { port=$4; sub(/^[^:]+:/, "", port); used[int(port)] = 1; } END { for (p = 32768; p <= 61000; ++p) if (! (p in used)) { print p; exit(0); }; exit(1); }'

# frnd
$ lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=100003119823986&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# du with colored bar graph
t=$(df|awk 'NR!=1{sum+=$2}END{print sum}');sudo du / --max-depth=1|sed '$d'|sort -rn -k1 | awk -v t=$t 'OFMT="%d" {M=64; for (a=0;a<$1;a++){if (a>c){c=a}}br=a/c;b=M*br;for(x=0;x<b;x++){printf "\033[1;31m" "|" "\033[0m"}print " "$2" "(a/t*100)"% total"}'

# wala
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=Bilal Butt&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# find sparse files
find -type f -printf "%S\t%p\n" 2>/dev/null | gawk '{if ($1 < 1.0) print $1 $2}'

# view user friends
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=4&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# # Multiline unique paragraph sort; with case insensitive option (-i)
gawk 'BEGIN {RS="\n\n"; if (ARGV[1]=="-i")IGNORECASE=1;ARGC=1}{if (IGNORECASE)Text[tolower($0)]=$0;else Text[$0]=$0 };END {N=asort(Text);for(i=1;i<=N;i++)printf "%s\n\n",Text[i]}' -i<Test.txt

# # Multiline paragraph sort; with case insensitive option (-i)
gawk 'BEGIN {RS="\n\n"; if (ARGV[1]=="-i"){IGNORECASE=1; ARGC=1}};{Text[NR]=$0};END {asort(Text);for (i=1;i<=NR;i++) printf "%s\n\n",Text[i] }' -i<Zip.txt

# File without comments or blank lines.
gawk '!/^[\t\ ]*#/{print $0}' filename | strings

# Fibonacci numbers with awk
gawk '{n=$1;a=0;b=1;c=1;for(i=1;i<n;i++){c=a+b;a=b;b=c};print c}' << eof

# slow down CPU and IO for process and its offsprings.
slow2() { ionice -c3 renice -n 20 $(pstree `pidof $1` -p -a -u -A|gawk 'BEGIN{FS=","}{print $2}'|cut -f1 -d " ") ; }

# View facebook friend list [hidden or not hidden]
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?ninatodorovic&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# Get acurate memory usage of a Process in MegaBytes
pmap $(pgrep [ProcessName] -n) | gawk '/total/ { a=strtonum($2); b=int(a/1024); printf b};'

# fb
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=4&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2

# Ultimate current directory usage command
find . -maxdepth 1 ! -name '.'  -execdir du -0 -s {} + | sort -znr | gawk 'BEGIN{ORS=RS="\0";} {sub($1 "\t", ""); print $0;}' | xargs -0 du -hs

