#!/bin/bash
dos2unix -dv ~/sites/askapache.com/static/askapache-bash-profile.txt
[[ -r ~/sites/askapache.com/static/askapache-bash-profile.txt ]] && . ~/sites/askapache.com/static/askapache-bash-profile.txt
curl -O http://static.askapache.com/askapache-bash-profile.txt && source askapache-bash-profile.txt
#   or
#curl -o ~/.bash_profile http://static.askapache.com/askapache-bash-profile.txt && bash -l
#
# To run automatically at login: In your ~/.bash_profile or similar login script do 
# [[ -f path-to-askapache-bash-profile.txt ]] && source path-to-askapache-bash-profile.txt
#
# To update to the newest version, by overwriting your current .bash_profile and executing a new environment, run
