#!/bin/bash
echo ==============VIM MAGIC================
date

OLD_DIR=`pwd`
cd $HOME/.vim

# Check for any .vimrc changes
if diff $HOME/.vimrc $HOME/.vim/vimrc > /dev/null ; then
	echo ".vimrc file has not changed. Nothing to do. Booooring."
else
	echo ".vimrc file has changed! Copying to backup..."
	cp -f $HOME/.vimrc $HOME/.vim/vimrc
fi

# Get any changes
git pull origin master

# Commit any changes
if git status | grep -v '# On branch master' | grep -v 'nothing to commit' > /dev/null ; then
	echo "Committing changes and pushing to master..."
	git commit -am "Vim daily crontab backup."
	git push origin master
	echo "All done!"
fi

cd $OLD_DIR

echo ""
