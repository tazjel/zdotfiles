#!/bin/bash
# https://raw.githubusercontent.com/jelera/dotfiles/master/install_scripts/install_patched_fonts.sh
###############################################################################
#         Name: install_patched_fonts.sh
#        Usage: ./install_patched_fonts.sh
#
#  Description: This is a helper script that automates the installation of
#                software for Development, SysAdmin, etc.
#
# Last Updated: Thu 21 Jan 2016 02:39:16 PM CST
#
#    Tested on: Ubuntu 14.04 LTS Trusty Tahr
#
#   Maintainer: Jose Elera (https://github.com/jelera)
#      License: MIT
#               Copyright (c) 2016 Jose Elera Campana
#               Permission is hereby granted, free of charge, to any person
#               obtaining a copy of this software and associated documentation
#               files (the "Software"), to deal in the Software without
#               restriction, including without limitation the rights to use,
#               copy, modify, merge, publish, distribute, sublicense, and/or
#               sell copies of the Software, and to permit persons to whom the
#               Software is furnished to do so, subject to the following
#               conditions:
#
#               The above copyright notice and this permission notice shall be
#               included in all copies or substantial portions of the Software.
#
#               THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#               EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#               OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#               NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#               HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#               WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#               FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#               OTHER DEALINGS IN THE SOFTWARE.
###############################################################################

function color_echo(){
# Usage  : color_echo "string" color
# Credit : http://stackoverflow.com/a/23006365/428786
local exp=$1;
local color=$2;
if ! [[ $color =~ ^[0-9]$ ]] ; then
	case $(echo "$color" | tr '[:upper:]' '[:lower:]') in
		black) color=0 ;;
	red) color=1 ;;
green) color=2 ;;
			yellow) color=3 ;;
		blue) color=4 ;;
	magenta) color=5 ;;
cyan) color=6 ;;
			white|*) color=7 ;; # white or invalid color
		esac
	fi

	tput setaf $color;
	printf "\n%s\n" "$exp"
	tput sgr0;
}
# Set source and target directories
powerline_fonts_dir="${PWD}/patched-fonts"

find_command="find \"$powerline_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

if [[ $(uname) == 'Darwin' ]]; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.fonts"
  mkdir -p "$font_dir"
fi

# Copy all fonts to user fonts directory
eval "$find_command" | xargs -0 -I % cp "%" "$font_dir/"

# Reset font cache on Linux
if [[ -n $(which fc-cache) ]]; then
  fc-cache -f "$font_dir"
fi

color_echo "--------------------------------------" green
color_echo "|  All fonts installed to $font_dir  |" green
color_echo "--------------------------------------" green
