#!/usr/bin/env bash


echo "do " && ( cat > $HOME/.vimrcw <<_AAVIMRC
set nocompatible
backspace=indent,eol,start
autoindent
ts=4
textwidth=0
set showmatch
backupcopy=yes
history=5000
ruler
so=5
cmdheight=2
hh=20
wh=65
t_Co=256
t_Sf=m
t_Sb=m
bg=dark
showcmd
incsearch
syntax on
if has("autocmd")
  if has("filetype")
      filetype on
      filetype plugin on
      filetype indent on
      set fileformats=unixos,mac
  endif
_AAVIMRC
)

