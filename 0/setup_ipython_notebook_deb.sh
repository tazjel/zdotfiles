#!/bin/sh
# setup_ipython_notebook_deb.sh

# Install and configure ipython notebook

sudo apt-get install -y ipython-notebook

ipython profile create

conf="$HOME/zdotfiles/1/ipython_config.py"
dest="$HOME/.config/ipython/profile_default/ipython_config.py

mv $dest $dest.orig.py

ln -s $conf $dest
