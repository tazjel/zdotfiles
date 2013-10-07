import re

xp = """
    sed G
    sed '/^$/d;G'
    sed 'G;G'
    sed 'n;d'
    sed '/regex/{x;p;x;}'
    sed '/regex/G'
    sed '/regex/{x;p;x;G;}'
    sed = filename | sed 'N;s/\n/\t/'
    sed = filename | sed 'N; s/^/     /; s/ *\(.\{6,\}\)\n/\1  /'
    sed '/./=' filename | sed '/./N; s/\n/ /'
    sed -n '$='
    sed 's/.$//'               # assumes that all lines end with CR/LF
    sed 's/^M$//'              # in bash/tcsh, press Ctrl-V then Ctrl-M
    sed 's/\x0D$//'            # works on ssed, gsed 3.02.80 or higher
    sed "s/$/`echo -e \\\r`/"            # command line under ksh
    sed 's/$'"/`echo \\\r`/"             # command line under bash
    sed "s/$/`echo \\\r`/"               # command line under zsh
    sed 's/$/\r/'                        # gsed 3.02.80 or higher
    sed "s/$//"                          # method 1
    sed -n p                             # method 2
    sed "s/\r//" infile >outfile         # UnxUtils sed v4.0.7 or higher
    sed 's/^[ \t]*//'                    # see note on '\t' at end of file
    sed 's/[ \t]*$//'                    # see note on '\t' at end of file
    sed 's/^[ \t]*//;s/[ \t]*$//'
    sed 's/^/     /'
    sed -e :a -e 's/^.\{1,78\}$/ &/;ta'  # set at 78 plus 1 space
    sed  -e :a -e 's/^.\{1,77\}$/ & /;ta'                     # method 1
    sed  -e :a -e 's/^.\{1,77\}$/ &/;ta' -e 's/\( *\)\1/\1/'  # method 2
    sed 's/foo/bar/'             # replaces only 1st instance in a line
    sed 's/foo/bar/4'            # replaces only 4th instance in a line
    sed 's/foo/bar/g'            # replaces ALL instances in a line
    sed 's/\(.*\)foo\(.*foo\)/\1bar\2/' # replace the next-to-last case
    sed 's/\(.*\)foo/\1bar/'            # replace only the last case
    sed '/baz/s/foo/bar/g'
    sed '/baz/!s/foo/bar/g'
    sed 's/scarlet/red/g;s/ruby/red/g;s/puce/red/g'   # most seds
    sed '1!G;h;$!d'               # method 1
    sed -n '1!G;h;$p'             # method 2
    sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//'
    sed '$!N;s/\n/ /'
    sed -e :a -e '/\\$/N; s/\\\n//; ta'
    sed -e :a -e '$!N;s/\n=/ /;ta' -e 'P;D'
    sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'  # other seds
    sed 'n;n;n;n;G;'             # other seds
    sed 10q
    sed q
    sed -e :a -e '$q;N;11,$D;ba'
    sed '$!N;$!D'
    sed '$!d'                    # method 1
    sed -n '$p'                  # method 2
    sed -e '$!{h;d;}' -e x              # for 1-line files, print blank line
    sed -e '1{$q;}' -e '$!{h;d;}' -e x  # for 1-line files, print the line
    sed -e '1{$d;}' -e '$!{h;d;}' -e x  # for 1-line files, print nothing
    sed -n '/regexp/p'           # method 1
    sed '/regexp/!d'             # method 2
    sed -n '/regexp/!p'          # method 1, corresponds to above
    sed '/regexp/d'              # method 2, simpler syntax
    sed -n '/regexp/{g;1!p;};h'
    sed -n '/regexp/{n;p;}'
    sed -n -e '/regexp/{=;x;1!p;g;$!N;p;D;}' -e h
    sed '/AAA/!d; /BBB/!d; /CCC/!d'
    sed '/AAA.*BBB.*CCC/!d'
    sed -e '/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d    # most seds
    sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;'
    sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;/BBB/!d;/CCC/!d'
    sed -e '/./{H;$!d;}' -e 'x;/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d
    sed -n '/^.\{65\}/p'
    sed -n '/^.\{65\}/!p'        # method 1, corresponds to above
    sed '/^.\{65\}/d'            # method 2, simpler syntax
    sed -n '/regexp/,$p'
    sed -n '8,12p'               # method 1
    sed '8,12!d'                 # method 2
    sed -n '52p'                 # method 1
    sed '52!d'                   # method 2
    sed '52q;d'                  # method 3, efficient on large files
    sed -n '3,${p;n;n;n;n;n;n;}' # other seds
    sed -n '/Iowa/,/Montana/p'             # case sensitive
    sed '/Iowa/,/Montana/d'
    sed '$!N; /^\(.*\)\n\1$/!P; D'
    sed -n 'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P'
    sed '$!N; s/^\(.*\)\n\1$/\1/; t; D'
    sed '1,10d'
    sed '$d'
    sed 'N;$!P;$!D;$d'
    sed -e :a -e '$d;N;2,10ba' -e 'P;D'   # method 1
    sed -n -e :a -e '1,10!{P;N;D;};N;ba'  # method 2
    sed 'n;n;n;n;n;n;n;d;'                # other seds
    sed '/pattern/d'
    sed '/^$/d'                           # method 1
    sed '/./!d'                           # method 2
    sed '/./,/^$/!d'          # method 1, allows 0 blanks at top, 1 at EOF
    sed '/^$/N;/\n$/D'        # method 2, allows 1 blank at top, 0 at EOF
    sed '/^$/N;/\n$/N;//D'
    sed '/./,$!d'
    sed -e :a -e '/^\n*$/{$d;N;ba' -e '}'  # works on all seds
    sed -e :a -e '/^\n*$/N;/\n$/ba'        # ditto, except for gsed 3.02.*
    sed -n '/^$/{p;h;};/./{x;/./p;}'
    sed "s/.`echo \\\b`//g"    # double quotes required for Unix environment
    sed 's/.^H//g'             # in bash/tcsh, press Ctrl-V and then Ctrl-H
    sed 's/.\x08//g'           # hex expression for sed 1.5, GNU sed, ssed
    sed '/^$/q'                # deletes everything after first blank line
    sed '1,/^$/d'              # deletes everything up to first blank line
    sed '/^Subject: */!d; s///;q'
    sed '/^Reply-To:/q; /^From:/h; /./d;g;q'
    sed 's/ *(.*)//; s/>.*//; s/.*[:<] *//'
    sed 's/^/> /'
    sed 's/^> //'
    sed -e :a -e 's/<[^>]*>//g;/</N;//ba'
    sed '/^end/,/^begin/d' file1 file2 ... fileX | uudecode   # vers. 1
    sed '/^end/,/^begin/d' "$@" | uudecode                    # vers. 2
    sed '/./{H;d;};x;s/\n/={NL}=/g' file | sort | sed '1s/={NL}=//;s/={NL}=/\n/g'
    sed '10q' filename              # same effect, avoids a useless "cat"
    sed '10q' filename > newfile    # redirects output to disk
    """
#get tags

def getwords(text, splitchars='\n'):
    words_iter = re.finditer("([%s]+)" % "".join([("^" + c) for c in splitchars]),text)
    for word in words_iter:
        yield word.group()


options = [x for x in getwords(xp)]
zlist = []
for i,zxp in enumerate(options):
    zlist.append("[{'%s:%s'}]" % (i , zxp))

for xz in zlist:
    print xz


#raw = raw_input("\nEnter :")
    #print(raw)
    #def getwords(text, splitchars=' \t|!?.;:,"_'):
    #words_iter = re.finditer("([%s]+)" % "".join([("^" + c) for c in splitchars]),text)
    #for word in words_iter:
        #yield word.group()

