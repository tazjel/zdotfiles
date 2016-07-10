" ============================================================================
" File:        vimdiff_menu.vim
"
" ============================================================================
if exists("g:loaded_nerdtree_vimdiff_menu")
    finish
endif
let g:loaded_nerdtree_vimdiff_menu = 1

call NERDTreeAddMenuItem({'text': '(v)imdiff with current node', 'shortcut': 'v', 'callback': 'NERDTreeDiffNode'})

" FUNCTION: NERDTreeDiffNode()
function! NERDTreeDiffNode()
    let currentNode = g:NERDTreeFileNode.GetSelected()
    let confirmed = 1

    if currentNode.path.isDirectory
        let choice =input("Diff with the current node\n" .
                         \ "==========================================================\n" .
                         \ "STOP! Cannot diff with directory\n" .
                         \ "" . currentNode.path.str() . ": ")
        let confirmed = 0
    endif

    if confirmed
        try
            execute "wincmd p"
            execute "vertical diffsplit " currentNode.path.str()
            "" no folding
            execute 'set nofoldenable'
            execute 'wincmd p'
            execute 'set nofoldenable'
            execute 'wincmd p'
        catch /^NERDTree/
            call s:echoWarning("Could not diff")
        endtry
    else
        call s:echo("diff aborted")
    endif

endfunction
