date --rfc-822 
date --rfc-822 | awk '{print $5}' | sed 's/^.*:.*://g'

date --rfc-822 | awk '{print $5}' | sed 's/^.*://g'

