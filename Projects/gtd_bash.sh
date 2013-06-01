#!/bin/sh
 
TODAY=$(date +%m)
FILE=~/.duesoon
 
# This may be more complex than need be, but it permits months with or without leading zeroes
let THISMO=$TODAY-0
if [ $THISMO = 12 ]; then
let NEXTMO=01
else
let NEXTMO=$THISMO+1
fi
if [ $THISMO = 01 ]; then
let LASTMO=12
else
let LASTMO=$THISMO-1
fi
 
# Empty file where matches will be stored
> "$FILE"
 
# Find all qq tasks where due date is this month or next month
mdfind -onlyin ~/Dropbox/notes "qq due" | while read -r line; do
 
# Get all matches where due date is in body of file
grep -E "due\([0]*($THISMO|$NEXTMO|$LASTMO)+.+\)" "$line" | while read -r match; do
DUEDATE=$(echo "$match" | grep -o '[0-9]\{1,2\}-[0-9]\{1,2\}-[0-9]\{2\}')
echo $(expr '(' $(date -jf %m-%d-%y $DUEDATE +%s) - $(date +%s) + 86399 ')' / 86400) "days\t" "$match" >> "$FILE"
done
 
# Get all matches where due date is in filename
basename "$line" | grep -E "due\([0]*($THISMO|$NEXTMO|$LASTMO)+.+\)" | while read -r match; do
DUEDATE=$(echo "$match" | grep -o '[0-9]\{1,2\}-[0-9]\{1,2\}-[0-9]\{2\}')
echo $(expr '(' $(date -jf %m-%d-%y $DUEDATE +%s) - $(date +%s) + 86399 ')' / 86400) "days\t" "$match" >> "$FILE"
done
 
done
 
# Now print all tasks due in the next 14 days, in order
sort -g "$FILE" | grep -E '(^[^0-9][0-9]+|^[0-9]{1}|^1[0-4]+) days'
