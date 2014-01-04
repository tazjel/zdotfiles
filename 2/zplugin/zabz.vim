abbr #b #!/bin/bash
abbr #p #!/usr/bin/env python<CR>

abbreviate CAR Conflict Analysis & Resolution

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

"cabbrev ws %s:^:snippet$\{0\:"\}:gc
"cabbrev ws %s:^\(.*\):snippet\t\1\/\n\t\1:gc

cabbrev ws_ s/\s/_/gc
cabbrev wsh !bash %
cabbrev ww <C-r>"<BS>
cabbrev wwpy vsplit ~/.config/ipython/profile_default/startup/ww.ipy
iabbr ws when where who what why
iabbrev ### #####################################################<CR>
iabbrev $$ ${0: }<left><left>
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


