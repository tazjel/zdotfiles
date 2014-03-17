# commandlinefu.com by David Winterbottom

# Merge Multiple PDFs
pdftk *.pdf cat output merged.pdf

# Show total disk space on all partitions
df -h --total | awk 'NR==1; END{print}'

# Check fstab volumes and volumes mounted.
diff <(cat /etc/fstab | grep vol | grep -v "^#" | awk '{print $1}') <(df -h | grep vol)

# Just convert your all books DJVU format to PDF, with one line
for i in *.djvu; do djvu2pdf $i && echo "Finished -> $i"; done;

# Merge some PDF files into a single one
pdfunite 1.pdf 2.pdf 3.pdf result.pdf

# Prints the latest modified files in a directory tree recursively
find . -name '*pdf*' -print0 | xargs -0 ls -lt | head -20

# Convert multi layered TIFF file to multi page PDF document
convert multi_layer.tif -compress jpg multi_page.pdf

# Like top but for files
watch -d -n 2 'df; ls -FlAt;'

# find php command backdoor
grep -RPl --include=*.{php,txt,asp} "(passthru|shell_exec|system|phpinfo|base64_decode|chmod|mkdir|fopen|fclose|readf?ile) *\(" /var/www/

# Show how old your linux OS installtion is
sudo tune2fs -l $(df -h / |(read; awk '{print $1; exit}')) | grep -i created

# Graphically show percent of mount space used
for m in `df -P | awk -F ' ' '{print $NF}' | sed -e "1d"`;do n=`df -P | grep "$m$" | awk -F ' ' '{print $5}' | cut -d% -f1`;i=0;if [[ $n =~ ^-?[0-9]+$ ]];then printf '%-25s' $m;while [ $i -lt $n ];do echo -n '=';let "i=$i+1";done;echo " $n";fi;done

# Unite pdf files
pdfunite 1.pdf 2.pdf united.pdf

# Convert multiple pdf's to jpg in linux using the convert command
for i in *.pdf ; do convert "$i" "${i%.*}.jpg" ; done

# Convert several JPEG files to PDF
convert *.jpeg output.pdf

# Batch remove protection from all pdf files in a directory
mkdir -p temp && for f in *.pdf ; do qpdf --password=YOURPASSWORDHERE --decrypt "$f" "temp/$f"; done && mv temp/* . && rm -rf temp

# Count words in a TeX/LaTeX document.
pdftotext file.pdf - | wc -w

# grep all pdf files in a folder
for i in *.pdf; do echo --------$i-------; echo; pdftotext $i - | grep -i Yourpattern; done

# If your disk space Used =100% displayed even after deleting the files generated the below command then Just REBOOT the System .
dd if=/dev/zero of=/fs/to/fill/dummy00 bs=8192 count=$(df --block-size=8192 / | awk 'NR!=1 {print $4-100}')

# Scan a document to PDF
scanimage -p --resolution 250 --mode Gray -x 215.9 -y 279.4 | pnmtops -imageheight 11 -imagewidth 8.5 | ps2pdf - output.pdf

# Remove security limitations from PDF documents using QPDF
qpdf --decrypt inputfile.pdf outputfile.pdf

# find potentially malicious PHP commands used in backdoors and aliked scripts
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;

# Convert multiple images to multi page PDF (with specific page order)
convert {1..12}.png MyMultiPageFile.pdf

# Useful to check if the disks as of same size or not. Helpful in checking Raid configs
df | awk '{if ($2!=dspace) print "different"; dspace=$2;}'

# Remaining Disk space for important mounted drives
df -H | grep -vE '^Filesystem|tmpfs|cdrom|none' | awk '{ print $5 " " $1 }'

# Extract text from all PDFs in curdir & subdirs to new files named as source+.txt, linux only.
echo '#!/bin/bash' > junk.sh ; find . -iname *.pdf -type f -printf \p\s\2\a\s\c\i\i\ \"%p\"\ \ \"%p\.\t\x\u\"\;\ \p\a\r\ \<\"%p\.\t\x\u\"\ \>\"%p\.\t\x\t\"\ \;\ \r\m\ \"%p\.\t\x\u\"\ \\n >>junk.sh; chmod 766 junk.sh; ./junk.sh ; rm junk.sh

