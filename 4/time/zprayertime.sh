#!/bin/bash

#awk '{print $5}' | sed 's/^.*:.*://g'

#awk '{print $5}' | sed 's/^.*:.*://g'


#cat $HOME/zdotfiles/4/time/09 | date --rfc-822 | awk '{print $5}' | sed 's/^.*://g'

#awk '{print $5}' | sed 's/^.*:.*://g'


cat 09 | grep "^$(date +%d)"
