#!/bin/bash

echo ===============BASH MAGIC===============
date

OLD_DIR=`pwd`
if [ -z "$1" ]; then
    echo "Usage: bash_magic.sh /path/to/bin/dir {--crontab}"
    exit 1
else
    BIN_DIR=$1
fi

#if [ -z "$2" ]; then
#CRONTAB="false"
#else
    CRONTAB="true"
#fi

cd $BIN_DIR

# Check if .bashrc exists
if [ -f "$HOME/.bashrc" ]; then
    echo ".bashrc exists..."
# Check for any .bashrc changes
if diff $HOME/.bashrc $BIN_DIR/bashrc > /dev/null; then
    echo ".bashrc file has not changed. Nothing to do. Booooring."
else
    echo ".bashrc file has changed! Copying to backup..."
    cp -f $HOME/.bashrc $BIN_DIR/bashrc
fi
    else
    echo ".bashrc does not exist"
fi

# Check if .screenrc exists
if [ -f "$HOME/.screenrc" ]; then
    echo ".screenrc exists..."
# Check for any .screenrc changes
if diff $HOME/.screenrc $BIN_DIR/screenrc > /dev/null; then
    echo ".screenrc file has not changed. Nothing to do. Booooring."
else
    echo ".screenrc file has changed! Copying to backup..."
    cp -f $HOME/.screenrc $BIN_DIR/screenrc
fi
else
echo ".screenrc does not exist"
fi

# Check if .tmux.conf exists
if [ -f "$HOME/.tmux.conf" ]; then
    echo ".tmux.conf exists..."
# Check for any .tmux.conf changes
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
