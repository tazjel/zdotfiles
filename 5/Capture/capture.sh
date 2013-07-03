#cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R - }
#Confirm() { echo -n "$1 [y/n]? " ; read reply; case $reply in Y*|y*) true ;; *) false ;; esac }
zselect() {
    PS3="Enter a number: "
    select f in "$@";do
        #$EDITOR $f;
        echo $f
    break;
    done
}

echo "Hi"
