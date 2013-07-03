# Replaces spaces in filename with _ and converts upper to lower case
for file in  * ; do mv "$file" `echo "$file" | tr ' ' '_' | tr '[A-Z]' '[a-z]'`; done

