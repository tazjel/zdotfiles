abbr #b #!/bin/bash
abbr #p #!/usr/bin/env python<CR>

abbreviate CAR Conflict Analysis & Resolution


abbreviate w# """"""""""""""""""""""""
""""""""""""""""""""""""""""""""

cabbrev h tab h


cabbrev pw vsplit ~/.config/ipython/profile_default/startup/w.ipy
cabbrev s1 vsplit ~/.spf13-vim-3/.vim/bundle/neosnippet/autoload/neosnippet/snippets/sh.snip
cabbrev t5 vsplit ~/.spf13-vim-3/.vim/bundle/neosnippet/autoload/neosnippet/snippets/text.snip

cabbrev w111 vsp ~/zdotfiles/1.sh

cabbrev w99 w! ~/zdotfiles/9/web2py/applications/qastack/languages/es-es.py
cabbrev wak vsplit ~/zdotfiles/6/autokey/data/API/AK/ak_vim.txt
cabbrev wf !firefox %
cabbrev wp vsplit ~/.config/ipython/profile_default/startup/ww.py
cabbrev wpy !python %
cabbrev wpy vsplit ~/.config/ipython/profile_default/startup/w.ipy
cabbrev ws %s/\s\+$//gc

cabbrev wsnp %s:^:snippet$\{0\:#\}:gc
cabbrev wsnp %s:^\(.*\):snippet\t\1\/\n\t\1:gc


"cabbrev ws %s:^:snippet$\{0\:"\}:gc
"cabbrev ws %s:^\(.*\):snippet\t\1\/\n\t\1:gc


cabbrev ws_ s/\s/_/gc
cabbrev wsh !bash %
cabbrev ww <C-r>"<BS>
cabbrev wwpy vsplit ~/.config/ipython/profile_default/startup/ww.ipy
iabbr ws when where who what why

"""""""""""""""""""""""""""""""""""""""
map <silent> 2 :diffget 2<CR>:diffupdate<CR>
map <silent> 3 :diffget 3<CR>:diffupdate<CR>
map <silent> 4 :diffget 4<CR>:diffupdate<CR>

map <silent> <F10> [c
map <silent> <F11> ]c

map <silent> <F12> :w<CR>:diffupdate<CR>


iabbrev ## #####################################################<CR>
iabbrev $$ ${0: }<left><left>


iabbrev ### #####################################################<CR>

"iabbrev $$ ${0: }<left><left>


iabbrev WWW () {<CR>
nnoremap wl :call Zget_line()<CR>
cabbrev wc call Z

function! Zget_line()
    let pos = [line('.'), col('.')]
    let zsaved_register = @@
    let a:zline = getline('.')
    exe "normal o" . a:zline
endfunction

nnoremap wl :call Zget_line()<CR>
cabbrev wc call

