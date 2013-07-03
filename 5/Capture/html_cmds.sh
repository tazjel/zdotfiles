# commandlinefu.com by David Winterbottom

# Run the built in PHP-server in current folder
php -S 127.0.0.1 8080

# Use Vim to convert text to HTML.
vimhtml() { [[ -f "$1" ]] || return 1; vim +'syn on | run! syntax/2html.vim | wq | q' "$1";}

# copy files listed in a text file
(while read fn; do; cp "$fn" $DESTINATION\.; done<filename.txt)

# Convert HAML to HTML on file change
while true; do filechanged=$(inotifywait -e close_write,moved_to --format "%w%f" .); haml $filechanged -q --no-escape-attrs > ${filechanged/.haml/.html}; done

# Notepad in a browser
firefox 'data:text/html, <html contenteditable>'

# Notepad in a browser (type this in the URL bar)
data:text/html, <html contenteditable>

# remove old index.html if you download it again and organiaz the java script tag on the file index.html
rm index.html | wget www.google.com;cat index.html | sed 's/<script>/\n\n\<script>\n\n/g' | sed 's/<\/script>/>\n\n/g'

# make a bunch of files based on a template file
echo "template file: ";read tpl;echo "new file(s separated w. space):"; read fl;touch $fl;find $fl -exec cp -ap $tpl "{}" \;

# Get a list of HTTP status codes
curl http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html 2>/dev/null | grep '^<h3' | grep -v '^\d' | perl -pe 's/^.*(?<=(\d\d\d)) (.*)<\/h3>$/$1 : $2/' | grep -v h3

# Show reason of revocation for 0xDEADBEEF with gpg.
gpg --export 0xDEADBEEF | gpg --list-packets | grep -Pzao ':signature packet:.*\n\t.*sigclass 0x20(\n\t.*)*'

# Sync files in /var/www/html dir with other server excluding files in exclude_files.txt
rsync  -arl  --rsh=ssh --progress --exclude-from=/etc/localbin/exclude_files.txt  /var/www/html/source/* <user>@<server>:/var/www/html/source/

# a find and replace within text-based files
sed -i 's/http:\/\/old\/new\///g' index.html

# cygwin startx
startx -- -fullscreen -noresize -unixkill

# Advanced ls using find to show much more detail than ls ever could
alias LS='find -mount -maxdepth 1 -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'

# Turn white color to transparent for a series of png images
mogrify -transparent white image*.png

# Check if system is 32bit or 64bit
uname -m   # display machine "hardware name"

# Oneliner to get domain names list of all existing domain names (from wikipedia)
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'

# Remove the first character of each line in a file
cat files |sed 's/.\(.*\)/\1/'

# find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern

# Remove UTF-8 Byte Order Mark BOM
find . -type f -regex '.*html$' -exec sed -i 's/\xEF\xBB\xBF//' '{}' \;

# Transform an XML document with an XSL stylesheet
xsltproc --stringparam name value <xsl_stylesheet> <xml_document>

# Change mysql prompt to be more verbose
export MYSQL_PS1="mysql://\u@\h:/\d - \R:\m:\s > "

# save stderr only to a file
command 3>&1 1>&2 2>&3 | tee file

# find geographical location of an ip address
function ip-where { wget -qO- -U Mozilla http://www.ip-adress.com/ip_tracer/$1  | html2text -nobs -style pretty | sed -n /^$1/,/^$/p;}

# What is my ip?
curl -s mi-ip.net | grep '"ip"' | cut -f2 -d ">" | egrep -o '[0-9.]+'

