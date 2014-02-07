" vim:fdm=marker:et:ts=4:

wincmd w | tab split


function! Tabtag(word)
    echo a:word
    tab split
    exec "!cat " . a:word .">>" . a:file .
endfunction
command! -nargs=1 -complete=tag Tag call Tabtag("<args>")

if filereadable(expand('~/.vim/local/bundles.vim'))
    execute 'source ' . expand('~/.vim/local/bundles.vim')
endif

if filereadable("~/zdotfiles/" )
    tab split @B
else
    call Zwindows()
endif

set ro | set noro

set undodir=~/.vim/tmp/undodir
set undolevels=1000
set undofile
set undoreload=10000

function! ReloadCommandOutput(cmd)
    se noro
    %d
    exec 'r !cat' . @e
    1d
    se nomod
    se ro
endfunction




