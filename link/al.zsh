
# Matching Strings
#grep -l <string-to-match> * | xargs grep -c <string-not-to-match> | grep '\:0'

# Deleting directory recurcive. Directories will be deleled when empty or contains only .svn subdirectory
#for I in $(find . -depth -type d -not -path  "*/.svn*" -print) ; do N="$(ls -1A ${I} | wc -l)"; if [[ "${N}" -eq 0 || "${N}" -eq 1 &&  -n $(ls -1A | grep .svn) ]] ; then svn rm --force "${I}"; fi ; done
#find . -type f ! -perm /u+x -printf "\"%p\"\n"
