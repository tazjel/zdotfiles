#!/bin/bash
dos2unix -dv ~/sites/askapache.com/static/askapache-bash-profile.txt
[[ -r ~/sites/askapache.com/static/askapache-bash-profile.txt ]] && . ~/sites/askapache.com/static/askapache-bash-profile.txt
#curl -O http://static.askapache.com/askapache-bash-profile.txt && source askapache-bash-profile.txt
#   or
curl -o ~/.bash_profile http://static.askapache.com/askapache-bash-profile.txt && bash -l
