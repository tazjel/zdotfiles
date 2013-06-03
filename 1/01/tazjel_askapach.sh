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

#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
# pm - Function 
#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
function pm()
{
  [[ "$#" -lt "1" ]] && echo "Usage: $FUNCNAME " >&2 && return 2
  local I=${1:-3};
  echo -en "$R\n"; #tm 0;
    case ${2:-1} in
     0) echo -en "${CC[6]}-- $X$R";  ;;
     1) echo -e  "${CC[2]}>>> $X$I$R"; ;;
     2) echo -en  "${CC[4]} > $X$I$R"; ;;
     3) echo -e  "${CC[4]} :: $X$I$R"; ;;
    esac;
}


#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
# aa_try_for_path - Function that automatically sets up your path
#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
function aa_try_for_path()
{
  local GP=$HOME/bin:$HOME/sbin
  [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]] && export PATH="/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
  
  local P=$PATH:$HOME/libexec
  [[ "$EUID" -eq 0 ]] && P="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11"

  P=${P}:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games
  P=${P}:/bin:/etc:/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/bin/mh:/usr/libexec
  P=${P}:/usr/X11R6/bin:/usr/libexec:/etc/X11:/etc/X11/xinit
  
  [[ "$DREAMHOST" == "yes" ]] && (
    P=${P}:/usr/local/dh/apache/template/bin:/usr/local/dh/apache2/template/bin
    P=${P}:/usr/local/dh/apache2/template/build:/usr/local/dh/apache2/template/sbin
    P=${P}:/usr/local/dh/bin:/usr/local/dh/java/bin:/usr/local/dh/java/jre/bin
	P=${P}:/usr/lib/ruby/gems/1.8/bin:$HOME/.gem/ruby/1.8/bin
  )
  
  P=${P}:/usr/local/php5/bin
  for p in ${P//:/ }; do [[ -d "${p}" && -x "${p}" ]] && GP=${GP}:$p; done;

  export PATH=$( echo -en "${GP//:/\\n}" | sed -n 'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; h; P' | tr "\n" : ).;
}


#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
# aa_safe_aliases - Function that sets up safe shell aliases with warnings for common commands, run if root usually
#--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--#
function aa_safe_aliases()
{
  local MYMVR=$(command type -t mymvmymv)
  [[ "$MYMVR" == "alias" ]] && pm "Turning Safe Aliases Off" && for fa in "chmod" "mkdir" "rm" "cp" "mv" "mymvmymv"; do unalias $fa; done && return;
  pm "Turning Safe Aliases On" 
  alias chmod='command chmod -c'
  alias mkdir='command mkdir -pv'
  alias rm='command rm -v'
  alias cp='command cp -v'
  alias mv='command mv -v'
  alias mymvmymv='echo'
}












#----------------------------
# CUSTOM SETTING VARIABLES
#----------------------------
# uncomment this manually to use root
[[ "$EUID" -eq 0 ]] && echo "If root you should edit this file $0 before letting it run"


AAPN='AskApache Bash Profile Script'
AAPV='6.8'
AAPT='12/07/2009'
AAPS=`echo "$0" | sed -e 's,.*/,,'`


# Be Bourne compatible
(unset GREP_OPTIONS GREP_COLOR) >/dev/null 2>&1 && unset GREP_OPTIONS GREP_COLOR


: ${PATH_SEPARATOR=:}
: ${SHELL=`command type -P bash 2>$N6`}
[[ "$SHELL" == *jail* ]] && export SHELL=`command type -P bash 2>$N6` && exec bash -l
: ${LANG=C} #en_US.UTF-8
: ${LC_ALL=C}
: ${LC_COLLATE=C}
: ${LC_CTYPE=C}
: ${LC_MESSAGES=C}
: ${LC_MONETARY=C}
: ${LC_NUMERIC=C}
: ${LC_TIME=C}

: ${HOME=~}
: ${USER=`whoami 2>$N6 || id -un 2>$N6 || logname 2>$N6`}
: ${GROUPNAME=`id -gn 2>$N6`}
: ${HOSTNAME=`(hostname || uname -n) 2>$N6 | sed 1q`}
: ${TMPDIR=/tmp}


# try and make sure the awesome ll function will work
alias ll='ll';alias ls='ls';unalias ll;unalias ls;(unset ll) >/dev/null 2>&1 && unset ll
echo "Bani"
