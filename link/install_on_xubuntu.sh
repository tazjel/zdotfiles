#!/bin/bash
# Reference : https://github.com/jelera/dotfiles/blob/master/install_scripts/install_ubuntu_trusty.sh

###############################################################################
#         Name: install_ubuntu_trusty
#        Usage: sudo ./install_ubuntu_trusty.sh
#
#  Description: This is a helper script that automates the installation of
#                software for Development, SysAdmin, etc.
#
# Last Updated: Mon 02 May 2016 03:19:42 PM CDT
#
#    Tested on: Ubuntu 14.04 LTS Trusty Tahr
#
#   Maintainer: Jose Elera (https://github.com/jelera)
#     Based on: https://github.com/thoughtbot/laptop
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

#############################################################################//
#
# => HELPER FUNCTIONS
#
#############################################################################//

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

function figlet_echo(){
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
	printf "\n%s" "$exp"
	tput sgr0;
}



#############################################################################//
#
# => SETUP
#
#############################################################################//

#-----------------------------//
# => Exit install script if
#    any command fails
#-----------------------------//
set -e

#-----------------------------//
# => Require root privileges
#-----------------------------//
if [[ $EUID -ne 0 ]]; then
	echo "ERROR: This script must be run with sudo" 1>&2
	exit 1

fi

#-----------------------------//
# => Distro Testing
#-----------------------------//
if ! grep -qiE 'trusty' /etc/os-release; then
	echo "ERROR: This Linux Distro is not currently supported" 1>&2
	echo "       Try forking it and implement it" 1>&2
	exit 1

fi




figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░░░█▀▀░█▀█░█▀▀░▀█▀░█░█░█▀█░█▀▄░█▀▀░░░" green
figlet_echo "░░░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░░░▀▀█░█░█░█▀▀░░█░░█▄█░█▀█░█▀▄░█▀▀░░░" green
figlet_echo "░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░░░░▀░░▀░▀░▀░▀░▀░▀░▀▀▀░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░█░█░█▀▄░█░█░█▀█░▀█▀░█░█░░░█▀▄░█▀▀░█▀▀░█░█░▀█▀░█▀█░█▀█░░░░░░" green
figlet_echo "░░░░░░░░█░█░█▀▄░█░█░█░█░░█░░█░█░░░█░█░█▀▀░▀▀█░█▀▄░░█░░█░█░█▀▀░░░░░░" green
figlet_echo "░░░░░░░░▀▀▀░▀▀░░▀▀▀░▀░▀░░▀░░▀▀▀░░░▀▀░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n\n" green


#############################################################################//
#
# => ADDING REPOSITORIES
#
#############################################################################//

#-----------------------------//
# => GetDeb and PlayDeb Repos
#-----------------------------//
color_echo "Adding GetDeb.net Repo" cyan
if grep -qiE 'trusty' /etc/os-release; then
	if ! grep -qiE 'Linux Mint' /etc/issue; then
		apt-add-repository "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps"
		wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
		apt-get update
	else
		color_echo "Linux Mint already includes GetDeb Repo" yellow
	fi
fi

color_echo "Adding PlayDeb.net Repo" cyan
if grep -qiE 'trusty' /etc/os-release; then
	apt-add-repository "deb http://archive.getdeb.net/ubuntu trusty-getdeb games"
	wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
	apt-get update
fi



#############################################################################//
#
# => SOFTWARE INSTALLATION (DESKTOP)
#
#############################################################################//

#===============================================//
# => Look and Feel
#===============================================//
color_echo "Installing Steam ... " cyan
  apt-get install -y steam

color_echo "Installing Fonts ... " cyan
  apt-get install -y fonts-roboto
  apt-get install -y fonts-inconsolata
  apt-get install -y fonts-font-awesome

color_echo "Install MS Core Fonts" cyan
  echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
  apt-get install -y ttf-mscorefonts-installer

color_echo "Installing Themes and Icons ... " cyan
  apt-get install -y shimmer-themes
  apt-get install -y elementary-icon-theme
  apt-get install -y humanity-icon-theme
  apt-get install -y ubuntu-mono
  apt-get install -y libreoffice-style-galaxy

#===============================================//
# => Desktop Software
#===============================================//
color_echo "Installing restricted extras ... " cyan
  apt-get install -y xubuntu-restricted-extras

color_echo "Installing Skype ... " cyan
  apt-get install -y skype

color_echo "Installing Dropbox ... " cyan
  apt-get install -y dropbox

color_echo "Installing Filezilla FTP Client ... " cyan
  apt-get install -y filezilla

color_echo "Installing Font Manager ... " cyan
  apt-get install -y font-manager

color_echo "Installing Hexchat IRC Client ... " cyan
  apt-get install -y hexchat

#===============================================//
# => Web Browsers
#===============================================//
color_echo "Installing Chromium, an Open Source version of Google Chrome ... " cyan
  apt-get install -y chromium-browser

color_echo "Installing Pepper Flash Plugin for Chromium ... " cyan
  apt-get install -y pepperflashplugin-nonfree

#===============================================//
# => Multimedia
#===============================================//
color_echo "Installing VLC Media Player ... " cyan
  apt-get install -y vlc

color_echo "Installing Clementine Music Player ... " cyan
  apt-get install -y clementine

color_echo "Installing RadioTray, a lightweight Internet Radio Player ... " cyan
  apt-get install -y radiotray

#===============================================//
# => Graphic Tools
#===============================================//
color_echo "Installing Inkscape Vector Image Editor ... " cyan
  apt-get install -y inkscape

color_echo "Installing Gimp Image Raster Editor ... " cyan
  apt-get install -y gimp

color_echo "Installing Gimp Plugins and extras ... " cyan
  apt-get install -y gimp-plugin-registry gimp-data-extras gnome-xcf-thumbnailer gimp-gmic gimp-texturize

color_echo "Installing Gthumb ... " cyan
  apt-get install -y gthumb

color_echo "Installing Gcolor2 Color Picker ... " cyan
  apt-get install -y gcolor2

color_echo "Installing Gpick Color Picker ... " cyan
  apt-get install -y gpick

color_echo "Installing Scribus, an Open Source Publishing Tool ... " cyan
  apt-get install -y scribus

color_echo "Installing pngquant, PNG quantization tool for reducing image filesize  ... " cyan
  apt-get install -y pngquant

#===============================================//
# => Games
#===============================================//

color_echo "Installing OpenTTD, a Open Source Transport Tycoon clone ... " cyan
  apt-get install -y openttd

color_echo "Installing DosBox,an Emulator of IBM PC compatible computer running DOS... " cyan
  apt-get install -y dosbox


#===============================================//
# => Utilities
#===============================================//
color_echo "Installing Rar, Unzip and other Archiving utilities ... " cyan
  apt-get install -y unzip unace p7zip-rar sharutils rar arj lunzip lzip

color_echo "Installing Curl ... " cyan
  apt-get install -y curl

color_echo "Installing Par, a text formatter filter... " cyan
  apt-get install -y par

# color_echo "Installing Guake, the Dropdown Terminal ... " cyan
#   apt-get install -y guake

color_echo "Installing Hardinfo, a system information tool ... " cyan
  apt-get install -y hardinfo

# color_echo "Installing Glipper, a Gnome/Mate Clipboard Manager ... " cyan
#   apt-get install -y glipper

color_echo "Installing Gufw, a GUI for UFW firewall ... " cyan
  apt-get install -y gufw

color_echo "Installing LuckyBackup, a Rsync frontend ... " cyan
  apt-get install -y luckybackup

#===============================================//
# => PPA's, DEB's and Source Compilation
#===============================================//
#-----------------------------//
# => Google Chrome
#-----------------------------//
color_echo "Installing Google Chrome, A fast Web Browser... " cyan
  cd /tmp
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  # This is a fix for Google's error when stopping support for 32-bit chrome and not fixing their repo
  # sed -i -e 's/deb http/deb [arch=amd64] http/' "/etc/apt/sources.list.d/google-chrome.list"
  # sed -i -e 's/deb http/deb [arch=amd64] http/' "/opt/google/chrome/cron/google-chrome"
  dpkg -i google-chrome-stable_current_amd64.deb
  cd "$HOME"

#-----------------------------//
# => Pandoc
#-----------------------------//
color_echo "Installing Pandoc, a swiss armyknife for Documents... " cyan
  cd /tmp
  wget https://github.com/jgm/pandoc/releases/download/1.16.0.2/pandoc-1.16.0.2-1-amd64.deb
  dpkg -i pandoc-1.16.0.2-1-amd64.deb
  cd "$HOME"

#-----------------------------//
# => Pithos
#-----------------------------//
color_echo "Installing Pithos, a Pandora.com client ... " cyan
  add-apt-repository -y ppa:pithos/ppa
  apt-get update
  apt-get install -y pithos

#-----------------------------//
# => Pencil
#-----------------------------//
color_echo "Pencil, a wireframe and UI designer" cyan
  cd /tmp
  wget https://github.com/prikhi/pencil/releases/download/v2.0.15/pencil-2.0.15-ubuntu-all.deb
  dpkg -i pencil-2.0.15-ubuntu-all.deb
  sed -i -e 's/MaxVersion\=42/MaxVersion\=49/g' /usr/share/pencil/application.ini
  cd "$HOME"

#-----------------------------//
# => X-Tile
#-----------------------------//
# color_echo "Installing X-tile Tiling Manager ... " cyan
#   cd /tmp
#   wget http://www.giuspen.com/software/x-tile_2.5.1-1_all.deb
#   dpkg -i x-tile_2.5.1-1_all.deb
#   cd "$HOME"

#-----------------------------//
# => Albert Launcher
#-----------------------------//
# color_echo "Installing Albert Launcher ... " cyan
#   add-apt-repository -y ppa:flexiondotorg/albert
#   apt-get update
#   apt-get install -y albert

#-----------------------------//
# => Zeal Docs
#-----------------------------//
color_echo "Installing Zeal Documentation Browser ... " cyan
  add-apt-repository -y ppa:zeal-developers/ppa
  apt-get update
  apt-get install -y zeal

#-----------------------------//
# => Shutter
#-----------------------------//
color_echo "Installing Shutter Screenshot Manager ... " cyan
  add-apt-repository -y ppa:shutter/ppa
  apt-get update
  apt-get install -y shutter

#-----------------------------//
# => Wine
#-----------------------------//
color_echo "Installing Wine, Wine is not an Emulator ... " cyan
  add-apt-repository -y ppa:ubuntu-wine/ppa
  apt-get update
  apt-get install -y wine1.7

#-----------------------------//
# => PlayOnLinux
#-----------------------------//
color_echo "Installing PlayOnLinux, A Frontend for Wine ... " cyan
  wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
  wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
  apt-get update
  apt-get install -y playonlinux

#-----------------------------//
# => Handbrake
#-----------------------------//
color_echo "Installing Handbrake, an open source video converter ..." cyan
  add-apt-repository -y ppa:stebbins/handbrake-releases
  apt-get update
  apt-get install -y handbrake-gtk handbrake-cli


#############################################################################//
#
# => SOFTWARE INSTALLATION (DEVELOPMENT)
#
#############################################################################//

#===============================================//
# => Development Tools
#===============================================//
color_echo "Installing Vim text editor... " cyan
  apt-get install -y vim-gtk

color_echo "Installing ZSH shell ... " cyan
  apt-get install -y zsh

color_echo "Installing Tmux terminal multiplexer ... " cyan
  apt-get install -y tmux

color_echo "Installing Htop ... " cyan
  apt-get install -y htop

color_echo "Installing Meld Diff Viewer ... " cyan
  apt-get install -y meld

color_echo "Installing Giggle Git Viewer ... " cyan
  apt-get install -y giggle

color_echo "Installing Git-Flow, a great workflow for git ... " cyan
  apt-get install -y git-flow

color_echo "Installing Git-extras, more porcelain for git ... " cyan
  apt-get install -y git-extras

color_echo "Installing Ag The Silver Searcher as a Grep replacement ... " cyan
  apt-get install -y silversearcher-ag

#===============================================//
# => Common shared libraries for compilation
#===============================================//
color_echo "Installing Essential tools for building and compiling ... " cyan
  apt-get install -y build-essential automake cmake

color_echo "Installing Ruby 2.0 and its Development Libraries ... " cyan
  apt-get install -y ruby2.0 ruby2.0-dev

color_echo "Installing Python 3.4 Development Libraries ... " cyan
  apt-get install -y python3 python3-dev python3.4-dev python3-pip

color_echo "Installing iPython 2/3 with QT Consoles ..." cyan
  apt-get install -y ipython-qtconsole ipython3-qtconsole

color_echo "Installing Common Libraries for Python and Ruby ... " cyan
  apt-get install -y libxslt1-dev libcurl4-openssl-dev libksba8 libksba-dev libqtwebkit-dev libreadline-dev libssl-dev zlib1g-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev python-software-properties libffi-dev postgresql-server-dev-all python-pip libbz2-dev php5-gd txt2tags

#===============================================//
# => STACKS
#===============================================//
color_echo "Installing LAMP Stack ... " cyan
  apt-get install -y lamp-server^


#===============================================//
# => PPA's, DEB's and Source Compilation
#===============================================//

#-----------------------------//
# => Node.js
#-----------------------------//
color_echo "Installing Node.js ... " cyan
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  apt-get install -y nodejs

#-----------------------------//
# => Universal Ctags
#-----------------------------//
color_echo "Installing Universal Ctags, a more updated alternative to Exuberant Ctags ... " cyan
  # Getting Ctags
  cd /tmp
  wget -q https://github.com/universal-ctags/ctags/archive/master.zip -O /tmp/u_ctags.zip
  unzip -q /tmp/u_ctags.zip; cd /tmp/ctags-master

  # Building Ctags
  ./autogen.sh
  ./configure --prefix=/usr/local
  make
  make install
  cd "$HOME"

#-----------------------------//
# => Git SCM
#-----------------------------//
color_echo "Installing Git Source Code Management ... " cyan
  add-apt-repository -y ppa:git-core/ppa
  apt-get update
  apt-get install -y git

#-----------------------------//
# => VirtualBox
#-----------------------------//
color_echo "Installing VirtualBox 5 ... " cyan
if grep -qiE 'trusty' /etc/os-release; then
	apt-add-repository "deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -	
	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
	apt-get update
	apt-get install -y virtualbox-5.0
fi

#-----------------------------//
# => Vagrant
#-----------------------------//
color_echo "Installing Vagrant 1.8 ... " cyan
  cd /tmp
  wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
  dpkg -i vagrant_1.8.1_x86_64.deb
  cd "$HOME"

#-----------------------------//
# => Git-cola
#-----------------------------//
color_echo "Installing Git-Cola Git Viewer ... " cyan
  apt-get install -y python3-pyqt4
  cd /tmp
  wget https://github.com/git-cola/git-cola/archive/v2.5.tar.gz -O git-cola.tar.gz
  tar xfz git-cola.tar.gz
  cd git-cola-2.5
  python setup.py install
  cd "$HOME"

#-----------------------------//
# => Atom Text Editor
#-----------------------------//
color_echo "Installing Atom text editor ... " cyan
  cd /tmp
  wget https://atom.io/download/deb -O atom.deb
  dpkg -i atom.deb
  cd "$HOME"

#-----------------------------//
# => xcape
#-----------------------------//
color_echo "Installing Xcape, remap pressing one time CTRL to ESC, very good for Vim" cyan
  apt-get install -y gcc make pkg-config libx11-dev libxtst-dev libxi-dev
  cd /tmp
  git clone https://github.com/alols/xcape.git
  cd xcape
  make
  make install
  cd "$HOME"

#===============================================//
# => Ruby Gems
#===============================================//
color_echo "Install Sass, a CSS Preprocessor" cyan
  gem2.0 install sass

#===============================================//
# => NPM Packages
#===============================================//
color_echo "Upgrading npm with npm" cyan
  npm install -g npm

color_echo "Installing Commonmark, an strict superset of Markdown" cyan
  npm install -g commonmark
  ln -s /usr/bin/commonmark /usr/bin/markdown

  color_echo "Installing Markdown to PDF" cyan
  npm install -g markdown-pdf

color_echo "Installing Tern, Code-analysis engine for JavaScript ... " cyan
  npm install -g tern

color_echo "Installing JSCtags, Ctags tags generator for JavaScript Sources ... " cyan
  npm install -g git+https://github.com/ramitos/jsctags.git

color_echo "Installing Gulp Task Runner ... " cyan
  npm install -g gulp

color_echo "Installing Grunt Task Runner ... " cyan
  npm install -g grunt

color_echo "Installing Bower Package Manager ... " cyan
  npm install -g bower

color_echo "Installing BrowserSync, Live preview for Web Development ... " cyan
  npm install -g browser-sync

color_echo "Installing Node-Sass, Node implementation of libsass ... " cyan
  npm install -g node-sass

color_echo "Installing Yeoman and generator for webapps ... " cyan
  npm install -g yo
  npm install -g generator-web
  npm install -g generator-gulp-webapp

color_echo "Installing Write-good, Linter for English proves for devs... " cyan
  npm install -g write-good

#===============================================//
# => LAMP STACK SETUP
#===============================================//

color_echo "Creating $HOME/Sites..." cyan
cd /var/www

sudo chown "$USERNAME":www-data ./* -R
sudo usermod -a -G www-data "$USERNAME"

sudo chgrp -R www-data /var/www
sudo chmod -R g+rw /var/www
find /var/www -type d -print0 | sudo xargs -0 chmod g+s
ln -s /var/www "$HOME"/Sites

# Installing WP-Cli
color_echo "Installing WP-CLI, a Command Line Interface for WordPress" cyan
cd "$HOME"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

color_echo "Setting Up /etc/hosts for virtual domains" cyan
# Create a backup for /etc/hosts
sudo cp /etc/hosts /etc/hosts.backup

# Add lines to /etc/hosts
echo "# These are the Virtual Domains " | sudo tee -a /etc/hosts
echo "# for developing WordPress Sites" | sudo tee -a /etc/hosts
echo "#===============================" | sudo tee -a /etc/hosts
echo "# 127.0.1.1      test.dev" | sudo tee -a /etc/hosts

#===============================================//
# => LINTERS
#===============================================//
color_echo "Installing CSSLint, for CSS" cyan
  npm install -g csslint

color_echo "Installing HTMLHint, for HTML5" cyan
  npm install -g htmlhint

color_echo "Installing HTML5 Tidy, for HTML5" cyan
	wget https://github.com/htacg/tidy-html5/archive/master.zip -O /tmp/tidy-html5-master.zip
	unzip /tmp/tidy-html5-master.zip
	cd /tmp/tidy-html5-master
	cd build/cmake
	cmake ../..
	make && make install
	cd "$HOME"

color_echo "Installing JSHint, for JavaScript" cyan
  npm install -g jshint

color_echo "Installing JSONlint, for JSON" cyan
  npm install -g jsonlint

color_echo "Installing MDL, for Markdown" cyan
  gem2.0 install mdl

color_echo "Installing Flake8, for Python" cyan
  pip3 install flake8

color_echo "Installing Reek, for Ruby" cyan
  gem2.0 install reek

color_echo "Installing XML, for XML" cyan
  apt-get install -y libxml2-utils

color_echo "Installing JS-Yaml, for YAML" cyan
  npm install -g js-yaml

color_echo "Installing Language-check, for Text Proof-reading" cyan
  pip3 install --upgrade language-check

color_echo "Install Haml_lint, a Linter for HAML" cyan
  gem2.0 install haml_lint

# BASH
color_echo "Installing ShellCheck, for Bash" cyan
cd /tmp
wget http://security.ubuntu.com/ubuntu/pool/universe/s/shellcheck/shellcheck_0.3.3-1~ubuntu14.04.1_amd64.deb
dpkg -i shellcheck_0.3.3-1~ubuntu14.04.1_amd64.deb
cd "$HOME"



#############################################################################//
#
# => CLEANUP
#
#############################################################################//

color_echo "Cleaning up!..." cyan
  apt-get purge -y banshee
  apt-get autoremove
  rm -rf /tmp/* 2> /dev/null
echo
echo
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░█░█░█▀█░█░█░█▀▄░░░█▀▀░█▀█░█▄█░█▀█░█░█░▀█▀░█▀▀░█▀▄░░░" green
figlet_echo "░░░░█░░█░█░█░█░█▀▄░░░█░░░█░█░█░█░█▀▀░█░█░░█░░█▀▀░█▀▄░░░" green
figlet_echo "░░░░▀░░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░░▀░░▀▀▀░▀░▀░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░╻┏━┓░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░┃┗━┓░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░╹┗━┛░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░█▀▄░█▀▀░█▀█░█▀▄░█░█░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░█▀▄░█▀▀░█▀█░█░█░░█░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░▀░▀░▀▀▀░▀░▀░▀▀░░░▀░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░" green
figlet_echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n\n" green
