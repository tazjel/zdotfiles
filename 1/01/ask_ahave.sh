#!/bin/bash 
#
#  The recommeded way to keep updated is to save this file and source it from your .bash_profile or any script, like:
# 
#      #!/bin/bash
#      dos2unix -dv ~/sites/askapache.com/static/askapache-bash-profile.txt
#      [[ -r ~/sites/askapache.com/static/askapache-bash-profile.txt ]] && . ~/sites/askapache.com/static/askapache-bash-profile.txt
# curl -O http://static.askapache.com/askapache-bash-profile.txt && source askapache-bash-profile.txt
#   or
# curl -o ~/.bash_profile http://static.askapache.com/askapache-bash-profile.txt && bash -l
#
# To run automatically at login: In your ~/.bash_profile or similar login script do 
# [[ -f path-to-askapache-bash-profile.txt ]] && source path-to-askapache-bash-profile.txt
#
# To update to the newest version, by overwriting your current .bash_profile and executing a new environment, run
#   aaup
#
#
# Copyright (C) 2009 www.AskApache.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
############################################################################################################################################################


# http://www.linuxfromscratch.org/lfs/view/6.4/chapter06/chapter06.html










##################################################################################################################################################################################
# Advanced Shell (set)tings, (u)ser(limit)s, and (sh)ell(opt)ions
##################################################################################################################################################################################
[[ ! -z "${BASH_ARGC}${BASH_ARGV}" ]] && ISINCLUDED=yes || ISINCLUDED=no
[[ -z "$PS3" ]] && [[ "$ISINCLUDED" == "no" ]] && return # dont do anything for non-interactive shells
[[ $- != *v* && $- != *x* ]] && set +C +f +H +v +x +n -b -h -i -m -B
ulimit -S -c 0 # Don't want any coredumps
shopt -s histappend histreedit histverify cmdhist extglob dotglob checkwinsize cdable_vars checkhash promptvars
umask 0022

export N6=/dev/null





#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
# ahave - Function to check if a program exists in path
#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
function ahave() 
{ unset -v ahave; command command type $1 &>$N6 && ahave="yes" || return 1; }


#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
# ahelp - Function to check if help has been called
#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
function ahelp() 
{ unset -v ahelp; [[ "$#" -gt "0" ]] && [[ "$1" == "-h" || "$1" == "--h" || "$1" == "--help" || "$1" == "-help" || "$1" == "-?" ]] && ahelp="yes"; }

