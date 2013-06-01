# Get sunrise time for any city, by name
sunrise() { city=${1-Seattle}; w3m "google.com/search?q=sunrise:$city" | sed -r '1,/^\s*1\./d; /^\s*2\./,$d; /^$/d' ;}
