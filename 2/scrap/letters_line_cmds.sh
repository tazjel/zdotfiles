# commandlinefu.com by David Winterbottom

# Scan a document to PDF
scanimage -p --resolution 250 --mode Gray -x 215.9 -y 279.4 | pnmtops -imageheight 11 -imagewidth 8.5 | ps2pdf - output.pdf

# Remove ( color / special / escape / ANSI ) codes, from text, with sed
sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"

# Capitalize the first letter of every word
sed "s/\b\(.\)/\u\1/g"

# launch bash without using any letters
${0##-}

# launch bash without using any letters
$0

# Set hidden attribe to a file in fat
fatattr -h <file>

# The letter your commands most often start with
for i in {a..z}; do echo $(cat ~/.bash_history | grep ^$i.* | wc -l) $i; done | sort -n -r

# Put uppercase letters in curly brackets in a BibTeX database
sed '/^\s*[^@%]/s=\([A-Z][A-Z]*\)\([^}A-Z]\|},$\)={\1}\2=g' literature.bib > output.bib

# launch bash without using any letters
${0/-/}

# launch bash without using any letters
"$(- 2>&1)";${_%%:*}

# Matrix Style
while true; do printf "\e[32m%X\e[0m" $((RANDOM%2)); for ((i=0; i<$((RANDOM%128)); i++)) do printf " "; done; done

# Generate pretty secure random passwords
pwgen -Bnyc

# Validate an email address
perl -e "print 'yes' if `exim -bt $s_email_here | grep -c malformed`;"

# Generate Random Text based on Length
genRandomText() { cat /dev/urandom|tr -dc 'a-zA-Z'|head -c $1 }

# sort monthwise
sort -M filename

# Prints "hello, world" to the console in very large letters
paste <(banner hello,\ ) <(banner world)

# generate random string
python -c 'import string, random; print "".join(random.choice(string.letters+string.digits) for x in range(6))'

# build DTT channel list with w-scan
w_scan -X -P -t 2 -E 0 -c IT > dvb-channels.conf

# Capitalize first letter of each word in a string - A ruby alternative
ruby -ne 'puts $_.split.collect(&:capitalize).join(" ")' <<< "pleAse cOuld YOu capiTalizE Me"

# Common key binding for 'less' to search for a string
less file.ext

# Capitalize first letter of each word in a string
echo 'fOo BaR' | ruby -e "p STDIN.gets.split.map(&:capitalize).join(' ')"

# Capitalize first letter of each word in a string
read -ra words <<< "<sentence>" && echo "${words[@]^}"

# Capitalize first letter of each word in a string
echo 'fOo BaR' | tr '[A-Z]' '[a-z]' | sed 's/\(^\| \)\([a-z]\)/\1\u\2/g'

# Apply fade effect to a audio
sox input.mp3 output.mp3 fade h 5 00:02:58 5

# Execute the command given by history event number
!<number>

