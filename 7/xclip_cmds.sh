# commandlinefu.com by David Winterbottom

# Copy your public key to clipboard
xclip -sel clip < ~/.ssh/id_rsa.pub

# copy string to clipboard
pwd | xclip

# Get your outgoing IP address
echo -n $(curl -Ss  http://icanhazip.com) | xclip

# Get your external ip right into your xclipboard
w3m mon-ip.com -dump|grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"|uniq|xclip -selection clipboard

# Generate random sensible passwords, and copy them to the clipboard
while true; do curl -s http://sensiblepassword.com/?harder=1 | tail -n 15 | head -n 1 | sed 's;<br/>;;' | cut -c 5- | cb; sleep 1; done

# Screenshot pipe to remote host, adding URL to clipboard, notifying when done. (without saving locally)
DATE=$(date +%Y-%m-%d_%H-%M-%S)-$(($(date +%N)/10000000)); HOST=ssh_host; DEST=file_dest; URL=url/screenshot_$DATE.png; import -window root png:- | ssh $HOST "cat > $DEST/screenshot_$DATE.png"; echo $URL | xclip; notify-send -u low "Title" "Message"

# Posts a file to sprunge.us and copies the related url to the clipboard
sprunge () { curl -s -F "sprunge=@$1" http://sprunge.us | xclip -selection clipboard && xclip -selection clipboard -o; }

# copy file to clipboard
xclip file.txt

# Quickly share code or text from vim to others.
:w !curl -F "sprunge=<-" http://sprunge.us | xclip

# Copy file content to X clipboard
!xclip -i %

# get xclip to own the clipboard contents
xclip -o -selection clipboard | xclip -selection clipboard

# encode image to base64 and copy to clipboard
uuencode -m $1 /dev/stdout | sed '1d' | sed '$d' | tr -d '\n' | xclip -selection clipboard

# preprocess code to be posted in comments on this site
sed 's/^/$ /' "$script" | xclip

# OSX command to take badly formatted xml from the clipboard, cleans it up and puts it back into the clipboard.
pbpaste | tidy -xml -wrap 0 | pbcopy

# cat large file to clipboard with speed-o-meter
pv large.xml | xclip

# cat large file to clipboard
cat large.xml | xclip

# Run a command, store the output in a pastebin on the internet and place the URL on the xclipboard
ls | curl -F 'sprunge=<-' http://sprunge.us | xclip

# Spell check the text in clipboard (paste the corrected clipboard if you like)
xclip -o > /tmp/spell.tmp; aspell check /tmp/spell.tmp ; cat /tmp/spell.tmp | xclip

# Copy stdin to your X11 buffer
ssh user@host cat /path/to/some/file | xclip

# Copy the full path of a file to the clipboard (requires xclip or similar)
>realpath ./somefile.c | xclip -selection c

