#!/bin/bash

echo ===============BASH MAGIC===============
date
WW_diff() {
	if  [  -f  "$1" ]; then
	    echo "$1  exists..."
	    if diff "$1" "$2"> /dev/null; then
		    echo "file has not changed"
	    else
	    	echo "$1 has changed! Copying to backup..."
	    	cp -f "$1" "$2"
		fi
	else
		echo "$1  does not exists..."
	fi
}
filesz='$home/.kde/share/config '

old_dir=`pwd`
if [ -z "$1" ]; then
    echo "usage: bash_magic.sh /path/to/bin/dir {--crontab}"
    exit 1
else
    bin_dir=$1
fi

#if [ -z "$2" ]; then
#crontab="false"
#else
    crontab="true"
#fi
autokey_dir= $home/.config/autokey/data

bin_dir=$home/zdotfiles/link/w/bin_dir
cd $bin_dir
#
# check if .bashrc exists
if [ -f "$home/.bashrc" ]; then
    echo ".bashrc exists..."
# check for any .bashrc changes
if diff $home/.bashrc $bin_dir/bashrc > /dev/null; then
    echo ".bashrc file has not changed. nothing to do. booooring."
else
    echo ".bashrc file has changed! copying to backup..."
    cp -f $home/.bashrc $bin_dir/bashrc
fi
    else
    echo ".bashrc does not exist"
fi

# check if .screenrc exists
if [ -f "$home/.screenrc" ]; then
    echo ".screenrc exists..."
# check for any .screenrc changes
if diff $home/.screenrc $bin_dir/screenrc > /dev/null; then
    echo ".screenrc file has not changed. nothing to do. booooring."
else
    echo ".screenrc file has changed! copying to backup..."
    cp -f $home/.screenrc $bin_dir/screenrc
fi
else
echo ".screenrc does not exist"
fi

# check if .tmux.conf exists
if [ -f "$home/.tmux.conf" ]; then
    echo ".tmux.conf exists..."
# check for any .tmux.conf changes
if diff $HOME/.tmux.conf $BIN_DIR/tmux.conf > /dev/null; then
    echo ".tmux.conf file has not changed. Nothing to do. Booooring."
else
    echo ".tmux.conf file has changed! Copying to backup..."
    cp -f $HOME/.tmux.conf $BIN_DIR/tmux.conf
fi
else
echo ".tmux.conf does not exist"
fi

# Check if .lynxrc exists
if [ -f "$HOME/.lynxrc" ]; then
    echo ".lynxrc exists..."
# Check for any .lynxrc changes
if diff $HOME/.lynxrc $BIN_DIR/lynxrc > /dev/null; then
    echo ".lynxrc file has not changed. Nothing to do. Booooring."
else
    echo ".lynxrc file has changed! Copying to backup..."
    cp -f $HOME/.lynxrc $BIN_DIR/lynxrc
fi
else
    echo ".lynxrc does not exist"
fi

# Check if .zshrc exists
if [ -f "$HOME/.zshrc" ]; then
    echo ".zshrc exists..."
# Check for any .zshrc changes
if diff $HOME/.zshrc $BIN_DIR/zshrc > /dev/null; then
    echo ".zshrc file has not changed. Nothing to do. Booooring."
else
    echo ".zshrc file has changed! Copying to backup..."
    cp -f $HOME/.zshrc $BIN_DIR/zshrc
fi
    else
        echo ".zshrc does not exist"
fi

if [ $CRONTAB == "true" ]; then
    # Backup Crontab
    echo "--crontab is set. Backing up crontab..."
    # crontab -l > $BIN_DIR/crontab.bkp.`hostname`
    # removed `hostname` b/c our dns is screwy
    crontab -l > $BIN_DIR/crontab.bkp.bbelyeumb
fi

# Receive any updates
git pull origin master

# Push any modified files
if git status | grep -v '# On branch master' | grep -v 'nothing to commit' > /dev/null ; then
    echo "Committing changes and pushing to master..."
    git commit -am "Bash daily crontab backup."
    git push origin master
    echo "All done!"
fi

cd $OLD_DIR

echo ""
