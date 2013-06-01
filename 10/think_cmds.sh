# commandlinefu.com by David Winterbottom

# What is my public IP address
curl ifconfig.me

# OSX: Use Say Command to Help You Play Hide-and-Seek
txt="";for i in {1..20};do txt=$txt"$i. ";done;say $txt" Ready or not, here I come"

# Debug your makefile
make -d | egrep --color -i '(considering|older|newer|remake)'

# Calculate a transcendental number (pi)
seq 1 2 99999999 | sed 's!^!4/!' | paste -sd-+ | bc -l

# Binary clock
echo "10 i 2 o $(date +"%H%M"|cut -b 1,2,3,4 --output-delimiter=' ') f"|dc|tac|xargs printf "%04d\n"|tr "01" ".*"

# Get sunrise time for any city, by name
sunrise() { city=${1-Seattle}; w3m "google.com/search?q=sunrise:$city" | sed -r '1,/^\s*1\./d; /^\s*2\./,$d; /^$/d' ;}

# Check syntax of all Perl modules or scripts underneath the current directory
for code in $(find . -type f -name '*.p[ml]'); do perl -c "$code"; done

# Give {Open,True}Type files reasonable names
shopt -s extglob; for f in *.ttf *.TTF; do g=$(showttf "$f" 2>/dev/null | grep -A1 "language=0.*FullName" | tail -1 | rev | cut -f1 | rev); g=${g##+( )}; mv -i "$f" "$g".ttf; done

# bash / vim workflow
vim -

# Quick and dirty convert to flash
ffmpeg -i inputfile.mp4 outputfile.flv

# Remove newlines from output
grep . filename

# DELETE all those duplicate files but one based on md5 hash comparision in the current directory tree
find . -type f -print0|xargs -0 md5sum|sort|perl -ne 'chomp;$ph=$h;($h,$f)=split(/\s+/,$_,2);print "$f"."\x00" if ($h eq $ph)'|xargs -0 rm -v --

# A death cow thinking in your fortune cookie
fortune -s -c -a | cowthink -d -W 45

