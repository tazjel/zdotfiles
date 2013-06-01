# commandlinefu.com by David Winterbottom

# Use Vim to convert text to HTML.
vimhtml() { [[ -f "$1" ]] || return 1; vim +'syn on | run! syntax/2html.vim | wq | q' "$1";}

# convert a string from lower case into uppercase
echo lowercaseword  | tr  '[a-z]'   '[A-Z]'

# Convert HAML to HTML on file change
while true; do filechanged=$(inotifywait -e close_write,moved_to --format "%w%f" .); haml $filechanged -q --no-escape-attrs > ${filechanged/.haml/.html}; done

# Convert red-cyan 3D anaglyph to side-by-side
convert infile.png \( +clone -channel GB -evaluate set 0 +channel \) +append -region 50%x100% -channel R -evaluate set 0 +channel outfile.png

# Convert JSON to YAML
cp data.{json,yaml}

# Convert JSON to YAML
mv data.{json,yaml}

# Convert JSON to YAML
cat data.json >data.yml

# Convert JSON to YAML
ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < file.json > file.yaml

# Convert JSON to YAML
python -c 'import sys, yaml, json; yaml.dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < file.json > file.yaml

# Convert YAML to JSON
python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < file.yaml > file.json

# List OSX applications and versions.
find /Applications -type d -maxdepth 1 -exec sh -c 'echo "{}"; (plutil -convert xml1 -o - "{}/Contents/Info.plist" | xpath /dev/stdin "concat(\"v\", /plist/dict/string[preceding-sibling::key[1]=\"CFBundleShortVersionString\"]/node())" 2>/dev/null)' \;

# Convert multiple images to multi page PDF (with specific page order)
convert {1..12}.png MyMultiPageFile.pdf

# Convert videos to AVI format
mencoder FILENAME.3gp -ovc lavc -lavcopts vcodec=msmpeg4v2 -oac mp3lame -lameopts vbr=3 -o FILENAME.avi

# convert single digit to double digits
for f ([0-9].txt) zmv $f '${(l:1::0:)}'$f

# rename multiple files with different name, eg converting all txt to csv
zmv '(*).txt' '$1.csv'

# convert uppercase to lowercase
tr '[:upper:]' '[:lower:]' < input.txt > output.txt

# convert finenames containing a numeric index from differing to fixed index-length; padding required zeroes in front of first number
export l=$1; shift; rename 'my $l=$ENV{'l'}; my $z="0" x $l; s/\d+/substr("$z$&",-$l,$l)/e' "$@"

# convert .ppk file to .ssh file
puttygen my_ssh_key.ppk -O private-openssh -o my_openssh_key.ssh

# Extract text from picture [OCR reader]
gocr -i ~/Screenshot.png

# resize all images in folder and create new images (w/o overwriting)
for file in *; do convert $file -resize 800x600 resized-$file; done

# convert single digit to double digits
rename 's/\d+/sprintf("%02d",$&)/e' -- $@

# rename multiple files with different name, eg converting all txt to csv
touch file{1..10}.txt ; ls *txt| sed -e "p;s/\.txt$/\.csv/"|xargs -n2 mv

# resize all the images returned by ls command and append "new_" to the resized images
for file in `ls *.png`;do convert $file -resize 65% new_$file; done

# Turn white color to transparent for a series of png images
mogrify -transparent white image*.png

# Convert video file to sequence of images
ffmpeg -i source.mpg -r 24 -f image2 still-%6d.png

