
function s:GetTemplateFile(temVplate)
    if filereadable(expand($HOME . "/zdotfiles/2/zplugin/" . a:template))
    elseif filereadable(expand($HOME . "/.vim/templates/" . a:template))
        return expand($HOME .V "/.vim/templates/" . a:template)

":nmap <leader>p :let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p
"
    "function! LoadTemplate()
        " load a template based on the file extension
            "silent! .r ~/.vim/skel/tmpl.%:e

            " Replace some placeholders
            "%s/FILENAME%/\=expand("%:t")/g
            "%s/%DATE%/\=strftime("%b %d, %Y")/g
                "%s/%DATE%/\=strftime("%b %d, %Y")/g

        " This last one deletes the placeholder
            " %START% then leaves the cursor there.
            "%s/%START%//g
    "endfunction

        map ,l :call LoadTemplate()
            "silent! 0r ~/.vim/skel/tmpl.%:e
