#!/bin/bash


#!/bin/sh

# array of URLs
urls=( http://www.example.com/file1.zip http://www.example.com/file2.zip http://www.example.com/file3.zip )
# names of downloaded files
names=( myname1.zip myname2.zip myname3.zip )

for ((i = 0; i < ${#urls[@]}; ++i)); do
    printf "Launching subprocess to DL %s to %s\n" "${urls[i]}" "${names[i]}"
    curl -s -o "${names[i]}" "${urls[i]}" &
done


# Or try something like this if you want it to be similar to using {} w/ curl:

#!/bin/sh

# desired filenames
names=( myname0.zip myname1.zip myname2.zip )

for (( i = 0; i < ${#names[@]}; ++i )); do
  printf "Launching subprocess to DL http://example.com/file%s.zip to %s\n" "$i" "${names[i]}"
  curl -s -o "${names[i]}" http://example.com/file"$i".zip &
done
