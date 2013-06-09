




zfind () {


}

# Easily find an old command you run {{{2
cat .bash_history | tail -100 | grep {command}
# find established tcp connections without using netstat!! {{{2
lsof -i -n | grep ESTABLISHED
# List OSX applications and versions. {{{2
find /Applications -type d -maxdepth 1 -exec sh -c 'echo "{}"; (plutil -convert xml1 -o - "{}/Contents/Info.plist" | xpath /dev/stdin "concat(\"v\", /plist/dict/string[preceding-sibling::key[1]=\"CFBundleShortVersionString\"]/node())" 2>/dev/null)' \;
# show 20 last modified files in current directory including subdirectories {{{2
ls -tl **/*(om[1,20])
# Find files with size over 100MB and output with better lay-out {{{2
p# List all symbolic links in current directory that matches regexp {{{2
perl -e 'print map { -l and $_ .= "\n" } <libxml*>'

# How to search for files and open all of them in tabbed vim editor. {{{2
sudo find / -type f -name config.inc.php -exec vim -p {} +

# Git Global search and replace {{{2
git grep -l foo | xargs sed -i 's/foo/bar/g'

# Copy a file over SSH without SCP {{{2
ssh username1@servername1 -t ssh username2@servername2 uuencode -m testfile1.tar - | uudecode > testfile1.tar

# How to find all open files by a process in Solaris 10 {{{2
for i in `pfiles pid|grep S_IFREG|awk '{print $5}'|awk -F":" '{print $2}'`; do find / -inum $i |xargs ls -lah; done

# Search in files {{{2
grep -i -h 'account.journal.cashbox.line' *.py

i# (DEBIAN-BASED DISTROS) Find total installed size of packages given a search term {{{2
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | grep "\-dev" | sort -n | awk '{ sum+=$1} END {print sum/1024 "MB"}'

n# Oneliner to get domain names list of all existing domain names (from wikipedia) {{{2
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'
t# recursive search and replace old with new string, inside files {{{2
replace old new -- `find -type f`

 -# Search recursively to find a word or phrase in certain file types, such as C code {{{2
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;

# Find and replace text within all files within a directory {{{2
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'

r# Find all files matching 'name.xml' and search for 'text' within them {{{2
grep -nH "text" -r . --include *name.xml

# If a directory contains softlinks, grep will give lot of warnings. So better use it along with find command so that softlinks are excluded. "Hn" operator will take care that both line number and filename is shown in grep output {{{2
find /path/to/search/directory -exec grep -Hn "pattern" {} \;

# List all symbolic links in current directory that matches regexp {{{2
perl -e 'print map { -l and $_ .= "\n" } <libxml*>'

functions(){ read -p "File name> "; sort -d $REPLY | grep "(){" | sed -e 's/(){//g' | less; }

# Ask user to confirm
Confirm() { echo -n "$1 [y/n]? " ; read reply; case $reply in Y*|y*) true ;; *) false ;; esac }

# Ask user to confirm
Confirm() { read -sn 1 -p "$1 [Y/N]? "; [[ $REPLY = [Yy] ]]; }
[38;5;15m-------------------------------------------------------------------------[39m
[38;5;15mUSEFUL[39m[38;5;15m [39m[38;5;15mONE-LINE[39m[38;5;15m [39m[38;5;15mSCRIPTS[39m[38;5;15m [39m[38;5;15mFOR[39m[38;5;15m [39m[38;5;15mSED[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mUnix[39m[38;5;15m [39m[38;5;15mstream[39m[38;5;15m [39m[38;5;15meditor[39m[38;5;197m)[39m[38;5;15m        [39m[38;5;15mDec.[39m[38;5;15m [39m[38;5;15m29,[39m[38;5;15m [39m[38;5;15m2005[39m
[38;5;15mCompiled[39m[38;5;15m [39m[38;5;15mby[39m[38;5;15m [39m[38;5;15mEric[39m[38;5;15m [39m[38;5;15mPement[39m[38;5;15m [39m[38;5;15m-[39m[38;5;15m [39m[38;5;15mpemente[39m[38;5;197m[[39m[38;5;15mat[39m[38;5;197m][39m[38;5;15mnorthpark[39m[38;5;197m[[39m[38;5;15mdot[39m[38;5;197m][39m[38;5;15medu[39m[38;5;15m        [39m[38;5;15mversion[39m[38;5;15m [39m[38;5;15m5.5[39m

[38;5;15mLatest[39m[38;5;15m [39m[38;5;15mversion[39m[38;5;15m [39m[38;5;15mof[39m[38;5;15m [39m[38;5;15mthis[39m[38;5;15m [39m[38;5;15mfile[39m[38;5;15m [39m[38;5;197m([39m[38;5;15min[39m[38;5;15m [39m[38;5;15mEnglish[39m[38;5;197m)[39m[38;5;15m [39m[38;5;15mis[39m[38;5;15m [39m[38;5;15musually[39m[38;5;15m [39m[38;5;15mat:[39m
[38;5;15m   [39m[38;5;15mhttp://sed.sourceforge.net/sed1line.txt[39m
[38;5;15m   [39m[38;5;15mhttp://www.pement.org/sed/sed1line.txt[39m

[38;5;15mThis[39m[38;5;15m [39m[38;5;15mfile[39m[38;5;15m [39m[38;5;15mwill[39m[38;5;15m [39m[38;5;15malso[39m[38;5;15m [39m[38;5;15mavailable[39m[38;5;15m [39m[38;5;15min[39m[38;5;15m [39m[38;5;15mother[39m[38;5;15m [39m[38;5;15mlanguages:[39m
[38;5;15m  [39m[38;5;15mChinese[39m[38;5;15m     [39m[38;5;15m-[39m[38;5;15m [39m[38;5;15mhttp://sed.sourceforge.net/sed1line_zh-CN.html[39m
[38;5;15m  [39m[38;5;15mCzech[39m[38;5;15m       [39m[38;5;15m-[39m[38;5;15m [39m[38;5;15mhttp://sed.sourceforge.net/sed1line_cz.html[39m
[38;5;15m  [39m[38;5;15mDutch[39m[38;5;15m       [39m[38;5;15m-[39m[38;5;15m [39m[38;5;15mhttp://sed.sourceforge.net/sed1line_nl.html[39m
[38;5;15m  [39m[38;5;15mFrench[39m[38;5;15m      [39m[38;5;15m-[39m[38;5;15m [39m[38;5;15mhttp://sed.sourceforge.net/sed1line_fr.html[39m
[38;5;15m  [39m[38;5;15mGerman[39m[38;5;15m      [39m[38;5;15m-[39m[38;5;15m [39m[38;5;15mhttp://sed.sourceforge.net/sed1line_de.html[39m
[38;5;15m  [39m[38;5;15mItalian[39m[38;5;15m     [39m[38;5;15m-[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mpending[39m[38;5;197m)[39m
[38;5;15m  [39m[38;5;15mPortuguese[39m[38;5;15m  [39m[38;5;15m-[39m[38;5;15m [39m[38;5;15mhttp://sed.sourceforge.net/sed1line_pt-BR.html[39m
[38;5;15m  [39m[38;5;15mSpanish[39m[38;5;15m     [39m[38;5;15m-[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mpending[39m[38;5;197m)[39m


[38;5;15mFILE[39m[38;5;15m [39m[38;5;15mSPACING:[39m

[38;5;15m [39m[38;5;242m# double space a file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15mG[39m

[38;5;15m [39m[38;5;242m# double space a file which already has blank lines in it. Output file[39m
[38;5;15m [39m[38;5;242m# should contain no more than one blank line between lines of text.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^$/d;G'[39m

[38;5;15m [39m[38;5;242m# triple space a file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'G;G'[39m

[38;5;15m [39m[38;5;242m# undo double-spacing (assumes even-numbered lines are always blank)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'n;d'[39m

[38;5;15m [39m[38;5;242m# insert a blank line above every line which matches "regex"[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/regex/{x;p;x;}'[39m

[38;5;15m [39m[38;5;242m# insert a blank line below every line which matches "regex"[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/regex/G'[39m

[38;5;15m [39m[38;5;242m# insert a blank line above and below every line which matches "regex"[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/regex/{x;p;x;G;}'[39m

[38;5;15mNUMBERING:[39m

[38;5;15m [39m[38;5;242m# number each line of a file (simple left alignment). Using a tab (see[39m
[38;5;15m [39m[38;5;242m# note on '\t' at end of file) instead of space will preserve margins.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;197m=[39m[38;5;15m [39m[38;5;15mfilename[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'N;s/\n/\t/'[39m

[38;5;15m [39m[38;5;242m# number each line of a file (number on left, right-aligned)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;197m=[39m[38;5;15m [39m[38;5;15mfilename[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'N; s/^/     /; s/ *\(.\{6,\}\)\n/\1  /'[39m

[38;5;15m [39m[38;5;242m# number each line of file, but only print numbers if line is not blank[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/./='[39m[38;5;15m [39m[38;5;15mfilename[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/./N; s/\n/ /'[39m

[38;5;15m [39m[38;5;242m# count lines (emulates "wc -l")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'$='[39m

[38;5;15mTEXT[39m[38;5;15m [39m[38;5;15mCONVERSION[39m[38;5;15m [39m[38;5;15mAND[39m[38;5;15m [39m[38;5;15mSUBSTITUTION:[39m

[38;5;15m [39m[38;5;242m# IN UNIX ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/.$//'[39m[38;5;15m               [39m[38;5;242m# assumes that all lines end with CR/LF[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/^M$//'[39m[38;5;15m              [39m[38;5;242m# in bash/tcsh, press Ctrl-V then Ctrl-M[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/\x0D$//'[39m[38;5;15m            [39m[38;5;242m# works on ssed, gsed 3.02.80 or higher[39m

[38;5;15m [39m[38;5;242m# IN UNIX ENVIRONMENT: convert Unix newlines (LF) to DOS format.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m"s/$/`echo -e \\\r`/"[39m[38;5;15m            [39m[38;5;242m# command line under ksh[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/$'[39m[38;5;186m"/`echo \\\r`/"[39m[38;5;15m             [39m[38;5;242m# command line under bash[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m"s/$/`echo \\\r`/"[39m[38;5;15m               [39m[38;5;242m# command line under zsh[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/$/\r/'[39m[38;5;15m                        [39m[38;5;242m# gsed 3.02.80 or higher[39m

[38;5;15m [39m[38;5;242m# IN DOS ENVIRONMENT: convert Unix newlines (LF) to DOS format.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m"s/$//"[39m[38;5;15m                          [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;15mp[39m[38;5;15m                             [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# IN DOS ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format.[39m
[38;5;15m [39m[38;5;242m# Can only be done with UnxUtils sed, version 4.0.7 or higher. The[39m
[38;5;15m [39m[38;5;242m# UnxUtils version can be identified by the custom "--text" switch[39m
[38;5;15m [39m[38;5;242m# which appears when you use the "--help" switch. Otherwise, changing[39m
[38;5;15m [39m[38;5;242m# DOS newlines to Unix newlines cannot be done with sed in a DOS[39m
[38;5;15m [39m[38;5;242m# environment. Use "tr" instead.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m"s/\r//"[39m[38;5;15m [39m[38;5;15minfile[39m[38;5;15m [39m[38;5;15m>outfile[39m[38;5;15m         [39m[38;5;242m# UnxUtils sed v4.0.7 or higher[39m
[38;5;15m [39m[38;5;15mtr[39m[38;5;15m [39m[38;5;15m-d[39m[38;5;15m [39m[38;5;141m\r[39m[38;5;15m [39m[38;5;15m<[39m[38;5;15minfile[39m[38;5;15m [39m[38;5;15m>outfile[39m[38;5;15m            [39m[38;5;242m# GNU tr version 1.22 or higher[39m

[38;5;15m [39m[38;5;242m# delete leading whitespace (spaces, tabs) from front of each line[39m
[38;5;15m [39m[38;5;242m# aligns all text flush left[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/^[ \t]*//'[39m[38;5;15m                    [39m[38;5;242m# see note on '\t' at end of file[39m

[38;5;15m [39m[38;5;242m# delete trailing whitespace (spaces, tabs) from end of each line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/[ \t]*$//'[39m[38;5;15m                    [39m[38;5;242m# see note on '\t' at end of file[39m

[38;5;15m [39m[38;5;242m# delete BOTH leading and trailing whitespace from each line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/^[ \t]*//;s/[ \t]*$//'[39m

[38;5;15m [39m[38;5;242m# insert 5 blank spaces at beginning of each line (make page offset)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/^/     /'[39m

[38;5;15m [39m[38;5;242m# align all text flush right on a 79-column width[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m's/^.\{1,78\}$/ &/;ta'[39m[38;5;15m  [39m[38;5;242m# set at 78 plus 1 space[39m

[38;5;15m [39m[38;5;242m# center all text in the middle of 79-column width. In method 1,[39m
[38;5;15m [39m[38;5;242m# spaces at the beginning of the line are significant, and trailing[39m
[38;5;15m [39m[38;5;242m# spaces are appended at the end of the line. In method 2, spaces at[39m
[38;5;15m [39m[38;5;242m# the beginning of the line are discarded in centering the line, and[39m
[38;5;15m [39m[38;5;242m# no trailing spaces appear at the end of lines.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m  [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m's/^.\{1,77\}$/ & /;ta'[39m[38;5;15m                     [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m  [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m's/^.\{1,77\}$/ &/;ta'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m's/\( *\)\1/\1/'[39m[38;5;15m  [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# substitute (find and replace) "foo" with "bar" on each line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/foo/bar/'[39m[38;5;15m             [39m[38;5;242m# replaces only 1st instance in a line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/foo/bar/4'[39m[38;5;15m            [39m[38;5;242m# replaces only 4th instance in a line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/foo/bar/g'[39m[38;5;15m            [39m[38;5;242m# replaces ALL instances in a line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/\(.*\)foo\(.*foo\)/\1bar\2/'[39m[38;5;15m [39m[38;5;242m# replace the next-to-last case[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/\(.*\)foo/\1bar/'[39m[38;5;15m            [39m[38;5;242m# replace only the last case[39m

[38;5;15m [39m[38;5;242m# substitute "foo" with "bar" ONLY for lines which contain "baz"[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/baz/s/foo/bar/g'[39m

[38;5;15m [39m[38;5;242m# substitute "foo" with "bar" EXCEPT for lines which contain "baz"[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/baz/!s/foo/bar/g'[39m

[38;5;15m [39m[38;5;242m# change "scarlet" or "ruby" or "puce" to "red"[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/scarlet/red/g;s/ruby/red/g;s/puce/red/g'[39m[38;5;15m   [39m[38;5;242m# most seds[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;186m's/scarlet\|ruby\|puce/red/g'[39m[38;5;15m                [39m[38;5;242m# GNU sed only[39m

[38;5;15m [39m[38;5;242m# reverse order of lines (emulates "tac")[39m
[38;5;15m [39m[38;5;242m# bug/feature in HHsed v1.5 causes blank lines to be deleted[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'1!G;h;$!d'[39m[38;5;15m               [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'1!G;h;$p'[39m[38;5;15m             [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# reverse each character on the line (emulates "rev")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//'[39m

[38;5;15m [39m[38;5;242m# join pairs of lines side-by-side (like "paste")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'$!N;s/\n/ /'[39m

[38;5;15m [39m[38;5;242m# if a line ends with a backslash, append the next line to it[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/\\$/N; s/\\\n//; ta'[39m

[38;5;15m [39m[38;5;242m# if a line begins with an equal sign, append it to the previous line[39m
[38;5;15m [39m[38;5;242m# and replace the "=" with a single space[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'$!N;s/\n=/ /;ta'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'P;D'[39m

[38;5;15m [39m[38;5;242m# add commas to numeric strings, changing "1234567" to "1,234,567"[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;186m':a;s/\B[0-9]\{3\}\>/,&/;ta'[39m[38;5;15m                     [39m[38;5;242m# GNU sed[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'[39m[38;5;15m  [39m[38;5;242m# other seds[39m

[38;5;15m [39m[38;5;242m# add commas to numbers with decimal points and minus signs (GNU sed)[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;15m-r[39m[38;5;15m [39m[38;5;186m':a;s/(^|[^0-9.])([0-9]+)([0-9]{3})/\1\2,\3/g;ta'[39m

[38;5;15m [39m[38;5;242m# add a blank line every 5 lines (after lines 5, 10, 15, 20, etc.)[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;186m'0~5G'[39m[38;5;15m                  [39m[38;5;242m# GNU sed only[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'n;n;n;n;G;'[39m[38;5;15m             [39m[38;5;242m# other seds[39m

[38;5;15mSELECTIVE[39m[38;5;15m [39m[38;5;15mPRINTING[39m[38;5;15m [39m[38;5;15mOF[39m[38;5;15m [39m[38;5;15mCERTAIN[39m[38;5;15m [39m[38;5;15mLINES:[39m

[38;5;15m [39m[38;5;242m# print first 10 lines of file (emulates behavior of "head")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m10q[39m

[38;5;15m [39m[38;5;242m# print first line of file (emulates "head -1")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15mq[39m

[38;5;15m [39m[38;5;242m# print the last 10 lines of a file (emulates "tail")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'$q;N;11,$D;ba'[39m

[38;5;15m [39m[38;5;242m# print the last 2 lines of a file (emulates "tail -2")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'$!N;$!D'[39m

[38;5;15m [39m[38;5;242m# print the last line of a file (emulates "tail -1")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'$!d'[39m[38;5;15m                    [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'$p'[39m[38;5;15m                  [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# print the next-to-the-last line of a file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'$!{h;d;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15mx[39m[38;5;15m              [39m[38;5;242m# for 1-line files, print blank line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'1{$q;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'$!{h;d;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15mx[39m[38;5;15m  [39m[38;5;242m# for 1-line files, print the line[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'1{$d;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'$!{h;d;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15mx[39m[38;5;15m  [39m[38;5;242m# for 1-line files, print nothing[39m

[38;5;15m [39m[38;5;242m# print only lines which match regular expression (emulates "grep")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/regexp/p'[39m[38;5;15m           [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/regexp/!d'[39m[38;5;15m             [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# print only lines which do NOT match regexp (emulates "grep -v")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/regexp/!p'[39m[38;5;15m          [39m[38;5;242m# method 1, corresponds to above[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/regexp/d'[39m[38;5;15m              [39m[38;5;242m# method 2, simpler syntax[39m

[38;5;15m [39m[38;5;242m# print the line immediately before a regexp, but not the line[39m
[38;5;15m [39m[38;5;242m# containing the regexp[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/regexp/{g;1!p;};h'[39m

[38;5;15m [39m[38;5;242m# print the line immediately after a regexp, but not the line[39m
[38;5;15m [39m[38;5;242m# containing the regexp[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/regexp/{n;p;}'[39m

[38;5;15m [39m[38;5;242m# print 1 line of context before and after regexp, with line number[39m
[38;5;15m [39m[38;5;242m# indicating where the regexp occurred (similar to "grep -A1 -B1")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/regexp/{=;x;1!p;g;$!N;p;D;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15mh[39m

[38;5;15m [39m[38;5;242m# grep for AAA and BBB and CCC (in any order)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/AAA/!d; /BBB/!d; /CCC/!d'[39m

[38;5;15m [39m[38;5;242m# grep for AAA and BBB and CCC (in that order)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/AAA.*BBB.*CCC/!d'[39m

[38;5;15m [39m[38;5;242m# grep for AAA or BBB or CCC (emulates "egrep")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/AAA/b'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/BBB/b'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/CCC/b'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15md[39m[38;5;15m    [39m[38;5;242m# most seds[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;186m'/AAA\|BBB\|CCC/!d'[39m[38;5;15m                        [39m[38;5;242m# GNU sed only[39m

[38;5;15m [39m[38;5;242m# print paragraph if it contains AAA (blank lines separate paragraphs)[39m
[38;5;15m [39m[38;5;242m# HHsed v1.5 must insert a 'G;' after 'x;' in the next 3 scripts below[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/./{H;$!d;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'x;/AAA/!d;'[39m

[38;5;15m [39m[38;5;242m# print paragraph if it contains AAA and BBB and CCC (in any order)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/./{H;$!d;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'x;/AAA/!d;/BBB/!d;/CCC/!d'[39m

[38;5;15m [39m[38;5;242m# print paragraph if it contains AAA or BBB or CCC[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/./{H;$!d;}'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'x;/AAA/b'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/BBB/b'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/CCC/b'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15md[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;186m'/./{H;$!d;};x;/AAA\|BBB\|CCC/b;d'[39m[38;5;15m         [39m[38;5;242m# GNU sed only[39m

[38;5;15m [39m[38;5;242m# print only lines of 65 characters or longer[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/^.\{65\}/p'[39m

[38;5;15m [39m[38;5;242m# print only lines of less than 65 characters[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/^.\{65\}/!p'[39m[38;5;15m        [39m[38;5;242m# method 1, corresponds to above[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^.\{65\}/d'[39m[38;5;15m            [39m[38;5;242m# method 2, simpler syntax[39m

[38;5;15m [39m[38;5;242m# print section of file from regular expression to end of file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/regexp/,$p'[39m

[38;5;15m [39m[38;5;242m# print section of file based on line numbers (lines 8-12, inclusive)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'8,12p'[39m[38;5;15m               [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'8,12!d'[39m[38;5;15m                 [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# print line number 52[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'52p'[39m[38;5;15m                 [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'52!d'[39m[38;5;15m                   [39m[38;5;242m# method 2[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'52q;d'[39m[38;5;15m                  [39m[38;5;242m# method 3, efficient on large files[39m

[38;5;15m [39m[38;5;242m# beginning at line 3, print every 7th line[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'3~7p'[39m[38;5;15m               [39m[38;5;242m# GNU sed only[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'3,${p;n;n;n;n;n;n;}'[39m[38;5;15m [39m[38;5;242m# other seds[39m

[38;5;15m [39m[38;5;242m# print section of file between two regular expressions (inclusive)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/Iowa/,/Montana/p'[39m[38;5;15m             [39m[38;5;242m# case sensitive[39m

[38;5;15mSELECTIVE[39m[38;5;15m [39m[38;5;15mDELETION[39m[38;5;15m [39m[38;5;15mOF[39m[38;5;15m [39m[38;5;15mCERTAIN[39m[38;5;15m [39m[38;5;15mLINES:[39m

[38;5;15m [39m[38;5;242m# print all of file EXCEPT section between 2 regular expressions[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/Iowa/,/Montana/d'[39m

[38;5;15m [39m[38;5;242m# delete duplicate, consecutive lines from a file (emulates "uniq").[39m
[38;5;15m [39m[38;5;242m# First line in a set of duplicate lines is kept, rest are deleted.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'$!N; /^\(.*\)\n\1$/!P; D'[39m

[38;5;15m [39m[38;5;242m# delete duplicate, nonconsecutive lines from a file. Beware not to[39m
[38;5;15m [39m[38;5;242m# overflow the buffer size of the hold space, or else use GNU sed.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P'[39m

[38;5;15m [39m[38;5;242m# delete all lines except duplicate lines (emulates "uniq -d").[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'$!N; s/^\(.*\)\n\1$/\1/; t; D'[39m

[38;5;15m [39m[38;5;242m# delete the first 10 lines of a file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'1,10d'[39m

[38;5;15m [39m[38;5;242m# delete the last line of a file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'$d'[39m

[38;5;15m [39m[38;5;242m# delete the last 2 lines of a file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'N;$!P;$!D;$d'[39m

[38;5;15m [39m[38;5;242m# delete the last 10 lines of a file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'$d;N;2,10ba'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'P;D'[39m[38;5;15m   [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'1,10!{P;N;D;};N;ba'[39m[38;5;15m  [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# delete every 8th line[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;186m'0~8d'[39m[38;5;15m                           [39m[38;5;242m# GNU sed only[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'n;n;n;n;n;n;n;d;'[39m[38;5;15m                [39m[38;5;242m# other seds[39m

[38;5;15m [39m[38;5;242m# delete lines matching pattern[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/pattern/d'[39m

[38;5;15m [39m[38;5;242m# delete ALL blank lines from a file (same as "grep '.' ")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^$/d'[39m[38;5;15m                           [39m[38;5;242m# method 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/./!d'[39m[38;5;15m                           [39m[38;5;242m# method 2[39m

[38;5;15m [39m[38;5;242m# delete all CONSECUTIVE blank lines from file except the first; also[39m
[38;5;15m [39m[38;5;242m# deletes all blank lines from top and end of file (emulates "cat -s")[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/./,/^$/!d'[39m[38;5;15m          [39m[38;5;242m# method 1, allows 0 blanks at top, 1 at EOF[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^$/N;/\n$/D'[39m[38;5;15m        [39m[38;5;242m# method 2, allows 1 blank at top, 0 at EOF[39m

[38;5;15m [39m[38;5;242m# delete all CONSECUTIVE blank lines from file except the first 2:[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^$/N;/\n$/N;//D'[39m

[38;5;15m [39m[38;5;242m# delete all leading blank lines at top of file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/./,$!d'[39m

[38;5;15m [39m[38;5;242m# delete all trailing blank lines at end of file[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/^\n*$/{$d;N;ba'[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'}'[39m[38;5;15m  [39m[38;5;242m# works on all seds[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m'/^\n*$/N;/\n$/ba'[39m[38;5;15m        [39m[38;5;242m# ditto, except for gsed 3.02.*[39m

[38;5;15m [39m[38;5;242m# delete the last line of each paragraph[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-n[39m[38;5;15m [39m[38;5;186m'/^$/{p;h;};/./{x;/./p;}'[39m

[38;5;15mSPECIAL[39m[38;5;15m [39m[38;5;15mAPPLICATIONS:[39m

[38;5;15m [39m[38;5;242m# remove nroff overstrikes (char, backspace) from man pages. The 'echo'[39m
[38;5;15m [39m[38;5;242m# command may need an -e switch if you use Unix System V or bash shell.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m"s/.`echo \\\b`//g"[39m[38;5;15m    [39m[38;5;242m# double quotes required for Unix environment[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/.^H//g'[39m[38;5;15m             [39m[38;5;242m# in bash/tcsh, press Ctrl-V and then Ctrl-H[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/.\x08//g'[39m[38;5;15m           [39m[38;5;242m# hex expression for sed 1.5, GNU sed, ssed[39m

[38;5;15m [39m[38;5;242m# get Usenet/e-mail message header[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^$/q'[39m[38;5;15m                [39m[38;5;242m# deletes everything after first blank line[39m

[38;5;15m [39m[38;5;242m# get Usenet/e-mail message body[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'1,/^$/d'[39m[38;5;15m              [39m[38;5;242m# deletes everything up to first blank line[39m

[38;5;15m [39m[38;5;242m# get Subject header, but remove initial "Subject: " portion[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^Subject: */!d; s///;q'[39m

[38;5;15m [39m[38;5;242m# get return address header[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^Reply-To:/q; /^From:/h; /./d;g;q'[39m

[38;5;15m [39m[38;5;242m# parse out the address proper. Pulls out the e-mail address by itself[39m
[38;5;15m [39m[38;5;242m# from the 1-line return address header (see preceding script)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/ *(.*)//; s/>.*//; s/.*[:<] *//'[39m

[38;5;15m [39m[38;5;242m# add a leading angle bracket and space to each line (quote a message)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/^/> /'[39m

[38;5;15m [39m[38;5;242m# delete leading angle bracket & space from each line (unquote a message)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m's/^> //'[39m

[38;5;15m [39m[38;5;242m# remove most HTML tags (accommodates multiple-line tags)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;15m:a[39m[38;5;15m [39m[38;5;15m-e[39m[38;5;15m [39m[38;5;186m's/<[^>]*>//g;/</N;//ba'[39m

[38;5;15m [39m[38;5;242m# extract multi-part uuencoded binaries, removing extraneous header[39m
[38;5;15m [39m[38;5;242m# info, so that only the uuencoded portion remains. Files passed to[39m
[38;5;15m [39m[38;5;242m# sed must be passed in the proper order. Version 1 can be entered[39m
[38;5;15m [39m[38;5;242m# from the command line; version 2 can be made into an executable[39m
[38;5;15m [39m[38;5;242m# Unix shell script. (Modified from a script by Rahul Dhesi.)[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^end/,/^begin/d'[39m[38;5;15m [39m[38;5;15mfile1[39m[38;5;15m [39m[38;5;15mfile2[39m[38;5;15m [39m[38;5;15m...[39m[38;5;15m [39m[38;5;15mfileX[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15muudecode[39m[38;5;15m   [39m[38;5;242m# vers. 1[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/^end/,/^begin/d'[39m[38;5;15m [39m[38;5;186m"$@"[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15muudecode[39m[38;5;15m                    [39m[38;5;242m# vers. 2[39m

[38;5;15m [39m[38;5;242m# sort paragraphs of file alphabetically. Paragraphs are separated by blank[39m
[38;5;15m [39m[38;5;242m# lines. GNU sed uses \v for vertical tab, or any unique char will do.[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'/./{H;d;};x;s/\n/={NL}=/g'[39m[38;5;15m [39m[38;5;15mfile[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msort[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'1s/={NL}=//;s/={NL}=/\n/g'[39m
[38;5;15m [39m[38;5;15mgsed[39m[38;5;15m [39m[38;5;186m'/./{H;d};x;y/\n/\v/'[39m[38;5;15m [39m[38;5;15mfile[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msort[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'1s/\v//;y/\v/\n/'[39m

[38;5;15m [39m[38;5;242m# zip up each .TXT file individually, deleting the source file and[39m
[38;5;15m [39m[38;5;242m# setting the name of each .ZIP file to the basename of the .TXT file[39m
[38;5;15m [39m[38;5;242m# (under DOS: the "dir /b" switch returns bare filenames in all caps).[39m
[38;5;15m [39m[38;5;15mecho[39m[38;5;15m [39m[38;5;15m@echo[39m[38;5;15m [39m[38;5;15moff[39m[38;5;15m [39m[38;5;15m>zipup.bat[39m
[38;5;15m [39m[38;5;15mdir[39m[38;5;15m [39m[38;5;15m/b[39m[38;5;15m [39m[38;5;15m*.txt[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m"s/^\(.*\)\.TXT/pkzip -mo \1 \1.TXT/"[39m[38;5;15m [39m[38;5;15m>>zipup.bat[39m

[38;5;15mTYPICAL[39m[38;5;15m [39m[38;5;15mUSE:[39m[38;5;15m [39m[38;5;15mSed[39m[38;5;15m [39m[38;5;15mtakes[39m[38;5;15m [39m[38;5;15mone[39m[38;5;15m [39m[38;5;15mor[39m[38;5;15m [39m[38;5;15mmore[39m[38;5;15m [39m[38;5;15mediting[39m[38;5;15m [39m[38;5;15mcommands[39m[38;5;15m [39m[38;5;15mand[39m[38;5;15m [39m[38;5;15mapplies[39m[38;5;15m [39m[38;5;15mall[39m[38;5;15m [39m[38;5;15mof[39m
[38;5;15mthem,[39m[38;5;15m [39m[38;5;15min[39m[38;5;15m [39m[38;5;15msequence,[39m[38;5;15m [39m[38;5;15mto[39m[38;5;15m [39m[38;5;15meach[39m[38;5;15m [39m[38;5;15mline[39m[38;5;15m [39m[38;5;15mof[39m[38;5;15m [39m[38;5;15minput.[39m[38;5;15m [39m[38;5;15mAfter[39m[38;5;15m [39m[38;5;15mall[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mcommands[39m[38;5;15m [39m[38;5;15mhave[39m
[38;5;15mbeen[39m[38;5;15m [39m[38;5;15mapplied[39m[38;5;15m [39m[38;5;15mto[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mfirst[39m[38;5;15m [39m[38;5;15minput[39m[38;5;15m [39m[38;5;15mline,[39m[38;5;15m [39m[38;5;15mthat[39m[38;5;15m [39m[38;5;15mline[39m[38;5;15m [39m[38;5;15mis[39m[38;5;15m [39m[38;5;15moutput[39m[38;5;15m [39m[38;5;15mand[39m[38;5;15m [39m[38;5;15ma[39m[38;5;15m [39m[38;5;15msecond[39m
[38;5;15minput[39m[38;5;15m [39m[38;5;15mline[39m[38;5;15m [39m[38;5;15mis[39m[38;5;15m [39m[38;5;15mtaken[39m[38;5;15m [39m[38;5;81mfor [39m[38;5;15mprocessing,[39m[38;5;15m [39m[38;5;15mand[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mcycle[39m[38;5;15m [39m[38;5;15mrepeats.[39m[38;5;15m [39m[38;5;15mThe[39m
[38;5;15mpreceding[39m[38;5;15m [39m[38;5;15mexamples[39m[38;5;15m [39m[38;5;15massume[39m[38;5;15m [39m[38;5;15mthat[39m[38;5;15m [39m[38;5;15minput[39m[38;5;15m [39m[38;5;15mcomes[39m[38;5;15m [39m[38;5;15mfrom[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mstandard[39m[38;5;15m [39m[38;5;15minput[39m
[38;5;15mdevice[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mi.e,[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mconsole,[39m[38;5;15m [39m[38;5;15mnormally[39m[38;5;15m [39m[38;5;15mthis[39m[38;5;15m [39m[38;5;15mwill[39m[38;5;15m [39m[38;5;15mbe[39m[38;5;15m [39m[38;5;15mpiped[39m[38;5;15m [39m[38;5;15minput[39m[38;5;197m)[39m[38;5;15m.[39m[38;5;15m [39m[38;5;15mOne[39m[38;5;15m [39m[38;5;15mor[39m
[38;5;15mmore[39m[38;5;15m [39m[38;5;15mfilenames[39m[38;5;15m [39m[38;5;15mcan[39m[38;5;15m [39m[38;5;15mbe[39m[38;5;15m [39m[38;5;15mappended[39m[38;5;15m [39m[38;5;15mto[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mcommand [39m[38;5;15mline[39m[38;5;15m [39m[38;5;81mif [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15minput[39m[38;5;15m [39m[38;5;15mdoes[39m
[38;5;15mnot[39m[38;5;15m [39m[38;5;15mcome[39m[38;5;15m [39m[38;5;15mfrom[39m[38;5;15m [39m[38;5;15mstdin.[39m[38;5;15m [39m[38;5;15mOutput[39m[38;5;15m [39m[38;5;15mis[39m[38;5;15m [39m[38;5;15msent[39m[38;5;15m [39m[38;5;15mto[39m[38;5;15m [39m[38;5;15mstdout[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mscreen[39m[38;5;197m)[39m[38;5;15m.[39m[38;5;15m [39m[38;5;15mThus:[39m

[38;5;15m [39m[38;5;15mcat[39m[38;5;15m [39m[38;5;15mfilename[39m[38;5;15m [39m[38;5;15m|[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'10q'[39m[38;5;15m        [39m[38;5;242m# uses piped input[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'10q'[39m[38;5;15m [39m[38;5;15mfilename[39m[38;5;15m              [39m[38;5;242m# same effect, avoids a useless "cat"[39m
[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;186m'10q'[39m[38;5;15m [39m[38;5;15mfilename[39m[38;5;15m [39m[38;5;15m>[39m[38;5;15m [39m[38;5;15mnewfile[39m[38;5;15m    [39m[38;5;242m# redirects output to disk[39m

[38;5;15mFor[39m[38;5;15m [39m[38;5;15madditional[39m[38;5;15m [39m[38;5;15msyntax[39m[38;5;15m [39m[38;5;15minstructions,[39m[38;5;15m [39m[38;5;15mincluding[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mway[39m[38;5;15m [39m[38;5;15mto[39m[38;5;15m [39m[38;5;15mapply[39m[38;5;15m [39m[38;5;15mediting[39m
[38;5;15mcommands[39m[38;5;15m [39m[38;5;15mfrom[39m[38;5;15m [39m[38;5;15ma[39m[38;5;15m [39m[38;5;15mdisk[39m[38;5;15m [39m[38;5;15mfile[39m[38;5;15m [39m[38;5;15minstead[39m[38;5;15m [39m[38;5;15mof[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mcommand [39m[38;5;15mline,[39m[38;5;15m [39m[38;5;15mconsult[39m[38;5;15m [39m[38;5;186m"sed &[39m
[38;5;186mawk, 2nd Edition,"[39m[38;5;15m [39m[38;5;15mby[39m[38;5;15m [39m[38;5;15mDale[39m[38;5;15m [39m[38;5;15mDougherty[39m[38;5;15m [39m[38;5;15mand[39m[38;5;15m [39m[38;5;15mArnold[39m[38;5;15m [39m[38;5;15mRobbins[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mO[39m[38;5;186m'Reilly,[39m
[38;5;186m1997; http://www.ora.com), "UNIX Text Processing," by Dale Dougherty[39m
[38;5;186mand Tim O'[39m[38;5;15mReilly[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mHayden[39m[38;5;15m [39m[38;5;15mBooks,[39m[38;5;15m [39m[38;5;15m1987[39m[38;5;197m)[39m[38;5;15m [39m[38;5;15mor[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mtutorials[39m[38;5;15m [39m[38;5;15mby[39m[38;5;15m [39m[38;5;15mMike[39m[38;5;15m [39m[38;5;15mArst[39m
[38;5;15mdistributed[39m[38;5;15m [39m[38;5;15min[39m[38;5;15m [39m[38;5;15mU-SEDIT2.ZIP[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mmany[39m[38;5;15m [39m[38;5;15msites[39m[38;5;197m)[39m[38;5;15m.[39m[38;5;15m [39m[38;5;15mTo[39m[38;5;15m [39m[38;5;15mfully[39m[38;5;15m [39m[38;5;15mexploit[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mpower[39m
[38;5;15mof[39m[38;5;15m [39m[38;5;15msed,[39m[38;5;15m [39m[38;5;15mone[39m[38;5;15m [39m[38;5;15mmust[39m[38;5;15m [39m[38;5;15munderstand[39m[38;5;15m [39m[38;5;186m"regular expressions."[39m[38;5;15m [39m[38;5;15mFor[39m[38;5;15m [39m[38;5;15mthis,[39m[38;5;15m [39m[38;5;15msee[39m
[38;5;186m"Mastering Regular Expressions"[39m[38;5;15m [39m[38;5;15mby[39m[38;5;15m [39m[38;5;15mJeffrey[39m[38;5;15m [39m[38;5;15mFriedl[39m[38;5;15m [39m[38;5;197m([39m[38;5;15mO[39m[38;5;186m'Reilly, 1997).[39m
[38;5;186mThe manual ("man") pages on Unix systems may be helpful (try "man[39m
[38;5;186msed", "man regexp", or the subsection on regular expressions in "man[39m
[38;5;186med"), but man pages are notoriously difficult. They are not written to[39m
[38;5;186mteach sed use or regexps to first-time users, but as a reference text[39m
[38;5;186mfor those already acquainted with these tools.[39m

[38;5;186mQUOTING SYNTAX: The preceding examples use single quotes ('[39m[38;5;15m...[39m[38;5;186m')[39m
[38;5;186minstead of double quotes ("...") to enclose editing commands, since[39m
[38;5;186msed is typically used on a Unix platform. Single quotes prevent the[39m
[38;5;186mUnix shell from intrepreting the dollar sign ($) and backquotes[39m
[38;5;186m(`...`), which are expanded by the shell if they are enclosed in[39m
[38;5;186mdouble quotes. Users of the "csh" shell and derivatives will also need[39m
[38;5;186mto quote the exclamation mark (!) with the backslash (i.e., \!) to[39m
[38;5;186mproperly run the examples listed above, even within single quotes.[39m
[38;5;186mVersions of sed written for DOS invariably require double quotes[39m
[38;5;186m("...") instead of single quotes to enclose editing commands.[39m

[38;5;186mUSE OF '[39m[38;5;141m\t[39m[38;5;186m' IN SED SCRIPTS: For clarity in documentation, we have used[39m
[38;5;186mthe expression '[39m[38;5;141m\t[39m[38;5;186m' to indicate a tab character (0x09) in the scripts.[39m
[38;5;186mHowever, most versions of sed do not recognize the '[39m[38;5;141m\t[39m[38;5;186m' abbreviation,[39m
[38;5;186mso when typing these scripts from the command line, you should press[39m
[38;5;186mthe TAB key instead. '[39m[38;5;141m\t[39m[38;5;186m' is supported as a regular expression[39m
[38;5;186mmetacharacter in awk, perl, and HHsed, sedmod, and GNU sed v3.02.80.[39m

[38;5;186mVERSIONS OF SED: Versions of sed do differ, and some slight syntax[39m
[38;5;186mvariation is to be expected. In particular, most do not support the[39m
[38;5;186muse of labels (:name) or branch instructions (b,t) within editing[39m
[38;5;186mcommands, except at the end of those commands. We have used the syntax[39m
[38;5;186mwhich will be portable to most users of sed, even though the popular[39m
[38;5;186mGNU versions of sed allow a more succinct syntax. When the reader sees[39m
[38;5;186ma fairly long command such as this:[39m

[38;5;186m   sed -e '[39m[38;5;15m/AAA/b[39m[38;5;186m' -e '[39m[38;5;15m/BBB/b[39m[38;5;186m' -e '[39m[38;5;15m/CCC/b[39m[38;5;186m' -e d[39m

[38;5;186mit is heartening to know that GNU sed will let you reduce it to:[39m

[38;5;186m   sed '[39m[38;5;15m/AAA/b;/BBB/b;/CCC/b;d[39m[38;5;186m'      # or even[39m
[38;5;186m   sed '[39m[38;5;15m/AAA[39m[38;5;141m\|[39m[38;5;15mBBB[39m[38;5;141m\|[39m[38;5;15mCCC/b;d[39m[38;5;186m'[39m

[38;5;186mIn addition, remember that while many versions of sed accept a command[39m
[38;5;186mlike "/one/ s/RE1/RE2/", some do NOT allow "/one/! s/RE1/RE2/", which[39m
[38;5;186mcontains space before the '[39m[38;5;15ms[39m[38;5;186m'. Omit the space when typing the command.[39m

[38;5;186mOPTIMIZING FOR SPEED: If execution speed needs to be increased (due to[39m
[38;5;186mlarge input files or slow processors or hard disks), substitution will[39m
[38;5;186mbe executed more quickly if the "find" expression is specified before[39m
[38;5;186mgiving the "s/.../.../" instruction. Thus:[39m

[38;5;186m   sed '[39m[38;5;15ms/foo/bar/g[39m[38;5;186m' filename         # standard replace command[39m
[38;5;186m   sed '[39m[38;5;15m/foo/[39m[38;5;15m [39m[38;5;15ms/foo/bar/g[39m[38;5;186m' filename   # executes more quickly[39m
[38;5;186m   sed '[39m[38;5;15m/foo/[39m[38;5;15m [39m[38;5;15ms//bar/g[39m[38;5;186m' filename      # shorthand sed syntax[39m

[38;5;186mOn line selection or deletion in which you only need to output lines[39m
[38;5;186mfrom the first part of the file, a "quit" command (q) in the script[39m
[38;5;186mwill drastically reduce processing time for large files. Thus:[39m

[38;5;186m   sed -n '[39m[38;5;15m45,50p[39m[38;5;186m' filename           # print line nos. 45-50 of a file[39m
[38;5;186m   sed -n '[39m[38;5;15m51q;45,50p[39m[38;5;89;48;5;233m'[39;49m[38;5;15m [39m[38;5;15mfilename[39m[38;5;15m       [39m[38;5;242m# same, but executes much faster[39m

[38;5;15mIf[39m[38;5;15m [39m[38;5;15myou[39m[38;5;15m [39m[38;5;15mhave[39m[38;5;15m [39m[38;5;15many[39m[38;5;15m [39m[38;5;15madditional[39m[38;5;15m [39m[38;5;15mscripts[39m[38;5;15m [39m[38;5;15mto[39m[38;5;15m [39m[38;5;15mcontribute[39m[38;5;15m [39m[38;5;15mor[39m[38;5;15m [39m[38;5;81mif [39m[38;5;15myou[39m[38;5;15m [39m[38;5;15mfind[39m[38;5;15m [39m[38;5;15merrors[39m
[38;5;15min[39m[38;5;15m [39m[38;5;15mthis[39m[38;5;15m [39m[38;5;15mdocument,[39m[38;5;15m [39m[38;5;15mplease[39m[38;5;15m [39m[38;5;15msend[39m[38;5;15m [39m[38;5;15me-mail[39m[38;5;15m [39m[38;5;15mto[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mcompiler.[39m[38;5;15m [39m[38;5;15mIndicate[39m[38;5;15m [39m[38;5;15mthe[39m
[38;5;15mversion[39m[38;5;15m [39m[38;5;15mof[39m[38;5;15m [39m[38;5;15msed[39m[38;5;15m [39m[38;5;15myou[39m[38;5;15m [39m[38;5;15mused,[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15moperating[39m[38;5;15m [39m[38;5;15msystem[39m[38;5;15m [39m[38;5;15mit[39m[38;5;15m [39m[38;5;15mwas[39m[38;5;15m [39m[38;5;15mcompiled[39m[38;5;15m [39m[38;5;81mfor[39m[38;5;15m,[39m[38;5;15m [39m[38;5;15mand[39m
[38;5;15mthe[39m[38;5;15m [39m[38;5;15mnature[39m[38;5;15m [39m[38;5;15mof[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mproblem.[39m[38;5;15m [39m[38;5;15mTo[39m[38;5;15m [39m[38;5;15mqualify[39m[38;5;15m [39m[38;5;15mas[39m[38;5;15m [39m[38;5;15ma[39m[38;5;15m [39m[38;5;15mone-liner,[39m[38;5;15m [39m[38;5;15mthe[39m[38;5;15m [39m[38;5;15mcommand [39m[38;5;15mline[39m
[38;5;15mmust[39m[38;5;15m [39m[38;5;15mbe[39m[38;5;15m [39m[38;5;15m65[39m[38;5;15m [39m[38;5;15mcharacters[39m[38;5;15m [39m[38;5;15mor[39m[38;5;15m [39m[38;5;15mless.[39m[38;5;15m [39m[38;5;15mVarious[39m[38;5;15m [39m[38;5;15mscripts[39m[38;5;15m [39m[38;5;15min[39m[38;5;15m [39m[38;5;15mthis[39m[38;5;15m [39m[38;5;15mfile[39m[38;5;15m [39m[38;5;15mhave[39m[38;5;15m [39m[38;5;15mbeen[39m
[38;5;15mwritten[39m[38;5;15m [39m[38;5;15mor[39m[38;5;15m [39m[38;5;15mcontributed[39m[38;5;15m [39m[38;5;15mby:[39m

[38;5;15m [39m[38;5;15mAl[39m[38;5;15m [39m[38;5;15mAab[39m[38;5;15m                   [39m[38;5;242m# founder of "seders" list[39m
[38;5;15m [39m[38;5;15mEdgar[39m[38;5;15m [39m[38;5;15mAllen[39m[38;5;15m              [39m[38;5;242m# various[39m
[38;5;15m [39m[38;5;15mYiorgos[39m[38;5;15m [39m[38;5;15mAdamopoulos[39m[38;5;15m      [39m[38;5;242m# various[39m
[38;5;15m [39m[38;5;15mDale[39m[38;5;15m [39m[38;5;15mDougherty[39m[38;5;15m           [39m[38;5;242m# author of "sed & awk"[39m
[38;5;15m [39m[38;5;15mCarlos[39m[38;5;15m [39m[38;5;15mDuarte[39m[38;5;15m            [39m[38;5;242m# author of "do it with sed"[39m
[38;5;15m [39m[38;5;15mEric[39m[38;5;15m [39m[38;5;15mPement[39m[38;5;15m              [39m[38;5;242m# author of this document[39m
[38;5;15m [39m[38;5;15mKen[39m[38;5;15m [39m[38;5;15mPizzini[39m[38;5;15m              [39m[38;5;242m# author of GNU sed v3.02[39m
[38;5;15m [39m[38;5;15mS.G.[39m[38;5;15m [39m[38;5;15mRavenhall[39m[38;5;15m           [39m[38;5;242m# great de-html script[39m
[38;5;15m [39m[38;5;15mGreg[39m[38;5;15m [39m[38;5;15mUbben[39m[38;5;15m               [39m[38;5;242m# many contributions & much help[39m
