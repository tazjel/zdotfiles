# commandlinefu.com by David Winterbottom

# get a random 0/1, use it for on/off, yes/no
echo $[RANDOM % 2]

# get a random number in bash
echo $[RANDOM % 100]  # range 0-99

# Change wallpaper random
feh --bg-scale "`ls -d $HOME/backgrounds/* |sort -R |tail -1`"

# Create random password in reasonable time
dd if=/dev/urandom  | tr -d -c [:print:] | tr -d " " | dd count=1 bs=20  2> /dev/null; echo

# A fun little harmless prank to pull on your friends.
while true; do sleep $(($RANDOM%50)); timeout 1 speaker-test -f 20000 -t sine 2>/dev/null; done&

# Create executable, automountable filesystem in a file, with password!
dd if=/dev/zero of=T bs=1024 count=10240;mkfs.ext3 -q T;E=$(echo 'read O;mount -o loop,offset=$O F /mnt;'|base64|tr -d '\n');echo "E=\$(echo $E|base64 -d);eval \$E;exit;">F;cat <(dd if=/dev/zero bs=$(echo 9191-$(stat -c%s F)|bc) count=1) <(cat T;rm T)>>F

# sleep for a random amount of time up to an hour
sleep `shuf -i 0-3600 -n 1`

# Play all the music in a folder, on shuffle
while [[ 1 ]]; do n=( */* ); s=${n[$(($RANDOM%${#n[@]}))]}; echo -e " - $s"; mpg123 -q "$s"; done

# Random music player
FILE='mp3.list';LNNO=`wc -l $FILE|cut -d' ' -f 1`;LIST=( `cat $FILE` );for((;;)) do SEED=$((RANDOM % $LNNO));RNNO=$(python -c "print int('`openssl rand -rand ${LIST[$SEED]} 8 -hex 2>/dev/null`', 16) % $LNNO");mplayer ${LIST[$RNNO]};sleep 2s; done

# Open/Close your co-worker's cd player
while true; do eject && sleep `expr $RANDOM % 5` && eject -t; done;

# Simulate typing but with mistakes
echo -e "You are a jerk\b\b\b\bwonderful person" | pv -qL $[10+(-2 + RANDOM%5)]

# Meter your entropy
pv /dev/random > /dev/null

# Download the last most popular 20 pictures from 500px
for line in `wget --referer='http://500px.com/' --quiet -O- http://500px.com/popular | grep "from=popular" | sed -n 's/.*<img src="\([^"]*\)".*/\1/p' | sed s/"3.jpg"/"4.jpg"/ | sed s/"?t".*$//`; do wget -O $RANDOM.jpg --quiet "$line"; done

# command for conky. To update a random command for each 300 sec from commandline.com
${execi 300 lynx --dump http://www.commandlinefu.com/commands/random/plaintext | grep .}

# Matrix Style
while true; do printf "\e[32m%X\e[0m" $((RANDOM%2)); for ((i=0; i<$((RANDOM%128)); i++)) do printf " "; done; done

# Generate random number with shuf
echo $((RANDOM % 10 + 1))

# Generate random number with shuf
seq 10| shuf | head -1

# Play a random avi file in the current directory tree
mplayer $(find . -iname '*.avi' | shuf -n1)

# Create a secure password using /dev/urandom and whirlpool
genpassdeep() { cat /dev/urandom | tr -dc [:alnum:] | head -c64 | whirlpooldeep; echo; }

# Create a secure password using /dev/urandom and sha256
genpassdeep() { cat /dev/urandom | tr -dc [:alnum:] | head -c64 | sha256deep; echo; }

# Encrypt your file using RC4 encryption
hashkey=`echo -ne <your-secret> | xxd -p`; openssl rc4 -e -nosalt -nopad -K $hashkey -in myfile.txt -out myfile.enc.txt

# generate a random 10 character password
pwgen -B -y 10

# generate a random 10 character password
pwgen 10   # generate a table of 10 character random passwords

# Get Lorum Ipsum random text from lorumipsum.com
p=1 ; lynx -source http://www.lipsum.com/feed/xml?amount=${p} | grep '<lipsum>' -A$(((p-1))) | perl -p -i -e 's/\n/\n\n/g' | sed -n '/<lipsum>/,/<\/lipsum>/p' | sed -e 's/<[^>]*>//g'

# generate a randome 3 character password
tr -dc '[:graph:]' </dev/urandom  | head -c30; echo

