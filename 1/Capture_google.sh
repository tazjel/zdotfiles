#!/bin/bash
#
# google.sh
# ---------
#  Automatic Google search from the command line.
#
#    Syntax : $ google {search terms}
#
if [ -z $1 ]
then
  # If no search term --> start Links on the Google page
  #
  links http://google.ca/
else
  #URL construction
  #
  url='http://google.ca/search?num=50&hl=en&safe=off&q='

  appended=0
  for searchTerm in "$@"
  do
    # Replace white spaces in the search terms
    #
    searchTerm=`echo $searchTerm | sed 's/ /%20/g'`

    url="$url%22$searchTerm%22"

    if [ $appended -lt `expr $# - 1` ]
    then
      url="$url"\+
    else
      url="$url"\&btnG\=Google\+Search\&meta\=
    fi

    let "appended+=1"
  done

  links $url
fi

exit 0

