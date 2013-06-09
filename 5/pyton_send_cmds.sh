# commandlinefu.com by David Winterbottom

# Convert JSON to YAML
python -c 'import sys, yaml, json; yaml.dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < file.json > file.yaml

# Convert YAML to JSON
python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < file.yaml > file.json

# List all available python modules
python -c "help('modules')"

# Random music player
FILE='mp3.list';LNNO=`wc -l $FILE|cut -d' ' -f 1`;LIST=( `cat $FILE` );for((;;)) do SEED=$((RANDOM % $LNNO));RNNO=$(python -c "print int('`openssl rand -rand ${LIST[$SEED]} 8 -hex 2>/dev/null`', 16) % $LNNO");mplayer ${LIST[$RNNO]};sleep 2s; done

# Read Python logs with tracebacks in color
pygmentize -l pytb myapp.log | less -SR

# Grep recursively your Python project with color highlighting the result and line numbers
grep --color=always -nr 'setLevel' --include=*py | less -SRqg

# Create cookies to log in to website
curl -L -d "uid=<username>&pwd=<password>" http://www.example.com -c cookies.txt

# Generate a 18 character password, print the password and sha512 salted hash
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 18 | head -1 | python -c "import sys,crypt; stdin=sys.stdin.readline().rstrip('\n'); print stdin;print crypt.crypt(stdin)"

# Simple way to share a directory over http without touching your router
python -m SimpleHTTPServer 8000 &; sudo localtunnel -k ~/.ssh/id_rsa.pub 8000

# ANSI 256 Color Test
alias colortest="python -c \"print('\n'.join([(' '.join([('\033[38;5;' + str((i + j)) + 'm' + str((i + j)).ljust(5) + '\033[0m') if i + j < 256 else '' for j in range(10)])) for i in range(0, 256, 10)]))\""

# ANSI Terminal Color Test using python
colortest-python

# Colorized JSON pretty printing
alias pp='python -mjson.tool | pygmentize -l javascript'

# How to reliably open a file in the same directory as a Python script
__location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))

# Python unicode `explain`
import unicodedata; map(unicodedata.name, '\u2022'.decode('ascii'))

# Serve current dir with python3
python3 -m http.server 80 &

# Google URL shortener
python -c 'import googl; print googl.Googl("<your_google_api_key>").shorten("'$someurl'")[u"id"]'

# Realtime lines per second in a log file
tail -F /var/log/nginx/access.log | python -c 'exec("import sys,time\nl=0\ne=int(time.time())\nfor line in sys.stdin:\n\tt = int(time.time())\n\tl += 1\n\tif t > e:\n\t\te = t\n\t\tprint l\n\t\tl = 0")'

# Append the line # -*- coding: utf-8 -*- to a file
sed -i -e '1i \# -*- coding: utf-8 -*-' yourfile.py

# python - covert image to base64 string for data URI use
python -c 'print open("path/to/image.png", "rb").read().encode("base64").replace("\n","")'

# switch case of a text file
python3 -c 'import sys; print(sys.stdin.read().swapcase(), end="")' <input.txt

# Quickly re-launch your script (python for example)
while read ; do python <script> ; done

# Quick syntax highlighting with multiple output formats
pygmentize -l sh ~/.bashrc | less -R

# convert ascii string to hex
python -c 'print "hello".encode("hex")'

# convert from decimal to hexadecimal
python -c 'print hex(1337)'

# An alternative to: python -m SimpleHTTPServer for Arch Linux
python3 -m http.server

