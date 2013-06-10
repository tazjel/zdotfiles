#!/bin/bash

# Capture_website
today=`date +%Y%m%d`

website="$($1)"

# process file

website_downloaded=$website_downloaded_$today
folder_website_downloades=$HOME/Downloads
extracted_urls=$folder_website_downloades/website_downloaded_urls

if [ ! -d $folder_website_downloades]; then
    mkdir -p $folder_website_downloades
fi


local_downloaded_site=$folder_website_downloades/$website_downloaded

dotfiles_org=http://dotfiles.org/

function Capture_website() {
    curl  $website >> $local_downloaded_site
}
#wget -O - http://dotfiles.org/.vimrc VV | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'
function extract_urls () {
    sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" $website_downloaded | sed "s/^'\///g" | sed "s/'$//g" >> $extracted_urls
    cat $extracted_urls
    echo ""
    echo ""
    echo "Done"
    echo "Done"
}



####################################################
