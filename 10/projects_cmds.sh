# commandlinefu.com by David Winterbottom

# When using mkvirtualenv, make the current directory your base and cd into that directory every time you workon that project
echo 'echo "cd `pwd`" >> $VIRTUAL_ENV/bin/postactivate' >> $VIRTUAL_ENV/../postmkvirtualenv

# Print the current time on the whole screen, updated every second
while(true); do printf "%s\f" $(date +%T); sleep 1; done  | sm -

# Grep recursively your Python project with color highlighting the result and line numbers
grep --color=always -nr 'setLevel' --include=*py | less -SRqg

# Remove .svn dirs
find . -name ".svn" -type d -exec rm -rf {} \;

# Recursively set the files to ignore in all folders for svn
for folder in $( find $( pwd ) -maxdepth 1 -type d | grep -v .svn ); do svn propset svn:ignore -F ignorelist ${folder}; done

# import a new set of files located in a local directory into a remote Subversion repository
svn import /home/kaz/myproject svn+ssh://svn.FOO.codehaus.org/home/projects/FOO/scm/project1/trunk

# Open the current project on Github by typing gh
git remote -v | grep fetch | sed 's/\(.*github.com\)[:|/]\(.*\).git (fetch)/\2/' | awk {'print "https://github.com/" $1'} | xargs open

# List users in a group
lsgrp() { read GID USERS <<< "$(grep "^$1:" /etc/group | cut -d: -f3,4 | tr ':,' ' ')" ; echo -e "${USERS// /\n}" | egrep -v "^($1)?$" ; egrep :[0-9]+:$GID: /etc/passwd | cut -d: -f1 ; }

# Remove hidden CVS merge helper files
find . -name ".#*" -exec rm {} \;

# Across an entire subtree, list not-empty directories that have no child-directories, globally sorted by their respective mtime
ls -ltr --directory $(find . -regex "./.*[^/]*\'" -type f | xargs -n 1 dirname | sort | uniq)

# ttyS0 - terminal on serial connection
setserial -q /dev/ttyS0

# Count total amount of code lines in a PHP Project (short version)
find . -type f -name "*.php" -exec wc -l {} +;

# List all extneral depencies of an svn-repository
svn propget svn:externals -R [svn-repository-name]

# Find lost passwords of PDFs files
pdfcrack <FILE>

# copy GPT partition table from /dev/sda to /dev/sdb
sgdisk /dev/sda -R /dev/sdb && sgdisk -G /dev/sdb

# Copy files from one tree to another (say, project to project) while preserving their directory structure.
cd ~/ruby/project_a ; find . -name "*profile*" -exec pax -rw {} ~/ruby/project_b/ \;

# Fixing maven POM messed up by a broken release.
find . -iname pom.xml -type f -exec bash -c "cat {} | sed s/1\.0\.46\-SNAPSHOT/1\.0\.48\-SNAPSHOT/g > {}.tmp " \; -exec mv {}.tmp {} \;

# checkout directory and the files it contains, without any further subdirectories
cvs checkout -l project/src/

# Grep with one result at a time
search="whatyouwant";data=$(grep "$search" * -R --exclude-dir=.svn -B2 -A2);for((i=$(echo "$data" | wc -l);$i>0;i=$(($i-6)) )); do clear;echo "$data"| tail -n $i | head -n 5; read;done

# Find lines of code (LOC) of a filetype in a project.
find . -type f -name "*.py" -exec wc -l {} \; | awk '{ SUM += $1} END {print SUM }'

# Edit all source files of project with vim, each on separate tab
vim -p `ls *.java *.xml *.txt *.bnd 2>/dev/null`

# How many lines in your PHP project without comments
find . -type f -name '*.php' | xargs cat | sed -re ':top /\/\*.*\*\// { s/\/\*.*\*\///g ; t top }; /\/\*/ { N ; b top }' | awk '$0 !~ /^[\t[:space:]]*($|(\/\/)|(#))/' | wc -l

# How many lines in your c project?
find . -type f -name *.[ch] -exec wc -l {} \;

# How many lines in your c project?
find -name *.\[c\|h\] | xargs wc -l

# Find the files that include a TODO statement within a project
find . -iname '*TODO*'

