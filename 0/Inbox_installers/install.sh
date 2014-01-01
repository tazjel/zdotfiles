#!/bin/bash

files=".vim .vimrc .zshrc .gitconfig .tmux.conf .lynxrc .tmuxinator"

for file in $files
do
  if [ -L $HOME/$file ]; then
    unlink $HOME/$file
  fi
  ln -s $HOME/.dotfiles/$file $HOME
done
