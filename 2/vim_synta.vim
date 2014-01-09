
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

nmap <silent>  wn :call ToggleSyntax()<CR>



    "map <F1> <plug>NERDCommenterToggle
