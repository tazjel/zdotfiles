
"Modeline and Notes {

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"   _____       _______        ___ __
"  |_   _| ___/|\___  /   (_) / _ |||       __   __(_)_ __ ___
"    | |  / _ ||   / /    | || (_)|||    ___\ \ / /| | '_ ` _ \
"    | | | (_) | _/ /__  _| || \_  ||__ |___|\ V / | | | | | | |
"    |_|  \.__/\|_____/ |___| \__| |___|      \_/  |_|_| |_| |_|
"
"
"   This is the personal .vimrc file of Ahmed Alghamdi.

"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
"   This is a mirror of :http://spf13.com


        au FocusLost * :wa
        set cursorline
        set wrap
        set textwidth=79
        call matchadd('ColorColumn', '\%81v.', 100)
        syntax on
        syntax enable
        set termencoding=utf-8
        set encoding=utf-8

        "syntax
        set background=dark
        "encoding
        set encoding=utf-8
        " change default file encoding when writing new files
        setglobal fileencoding=utf-8
        set fillchars+=stl:\ ,stlnc:\

        "  complete menu
        set wildmenu
        set noswapfile nobackup nowritebackup
        set showmatch matchtime=3 matchpairs+=<:>
        set complete=.,w,b,k,d,i,t

            "" Fix slow O inserts
                set timeout timeoutlen=1000 ttimeoutlen=100
                set timeout timeoutlen=5000 ttimeoutlen=100
                set shortmess=aTI

                        " set folding
                            setlocal foldmethod=expr
                            setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
                            set foldtext=getline(v:foldstart)
                            set fillchars=fold:\ "(there's a space after that \)
                            highlight Folded ctermfg=DarkGreen ctermbg=Black

                            function! ToggleSyntax()
                                if exists("g:syntax_on")
                                    syntax off
                                else
                                    syntax enable
                                endif
                            endfunction
                            nmap <silent>  wn :call ToggleSyntax()<CR>

                        if exists("syntax_on")
                            syntax reset
                        endif

                        if has('autocmd')
                            filetype plugin indent on
                        endif

                        if has('syntax') && !exists('g:syntax_on')
                            syntax enable
                        endif

                        if has("multi_byte")
                            if &termencoding == ""
                                let &termencoding = &encoding
                            endif
                        endif

         " <F[1-12]>
            " <F1>
                map <F1> <plug>NERDCommenterToggle<CR>
            " <F2>
                nnoremap <F2> :reg<CR>
                nnoremap <S-F2> :marks <CR>
            " <F3>
                map <F3> :ls<CR>:sb
                map <F3> :ls<CR>:sball

            " <F4>
                nnoremap <F4> :verbos map<Space>
                nnoremap <S-F4>  :let @a=""\|:let @a=colors_name\|:let @"=@a<CR>\|:echo @"<CR>

            " <F5>
                nnoremap <silent> <F5> :source ~/zdotfiles/link/.vimrc.local<CR>\|:echo colors_name<CR>
                nnoremap <silent> <S-F5> :vsplit ~/zdotfiles/2/vimrc.txt<CR>:vsplit ~/zdotfiles/link/.vimrc.local<CR>
                nnoremap <silent> <C-S-F5> nnoremap <silent> <C-F5> :vsplit ~/zdotfiles/1/.zsh/al.zsh<CR>

            "<F6>
                    "vnoremap <F6> :w! >> ~/zdotfiles/6/
                    "nnoremap <C-F6> :vsplit ~/zdotfiles/6/
                    "nnoremap <S-F6> :vsp ~/zdotfiles/6/
                    "nnoremap <F6> V}y<C-w><C-w>ggGp



            " <F7>
                map <F7> :let @a.=''\|g/ /y A \|:let @*=@a <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
                map <S-F7> :%s/<C-r><C-w>//gc<Left><Left><Left>

                imap <F7> <C-X><C-l>
            " <F8>
                    map <F8> :TagbarToggle<CR>
                    map <S-F8> :diffthis<cr><esc><c-w><c-w>:diffthis<cr>
                    map <f8><f8> :diffoff<cr>
                    set diffopt=filler,context:4,iwhite

                        if &diff
                            "Vimdiff use c-j and c-k to navigate"
                            nnoremap <C-j> ]c
                            nnoremap <C-Right> ]c
                            nnoremap <C-k> [c
                            nnoremap <C-Left> :diffupdate
                            colorscheme solarized
                            nnoremap q :qa! <CR>
                        endif
                        cnoremap <C-Left> :diffput \| diffupdate <CR>


            " <F9>
                nnoremap <silent> <F9> :SessionList<CR>
                nnoremap <silent> <S-F9> :SessionSave<CR>
                nnoremap <M-F9> :sessionopen
                nnoremap <C-F9> :SessionSaveAs

            " <F10>
                map <silent> <F10> <Esc>:call InsertCmd( '' )<CR><Insert>
                map N Nzz
                map n nzz
                "
                    "imap <silent> <F10> <Esc>:call InsertCmd( zwz )<CR><Insert>
                    "map <silent> <F10>  :call InsertCmd( 'hostname' )<CR>
                    "nnoremap <C-F10> call setqflist([]) | :bufdo grepadd! w %
            " <F11>
                "map <F11> y<C-W>n<C-W>Lp:w ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_ak.snip
                "map <F11> y:vsplit ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_w.snip<CR>

            " <F12>
                " F12 - tagbar toggle
                                                " S-F12 - show tag under curser in the preview window (tagfile must exist!)
                noremap <silent> <F12> <Esc>:TagbarToggle<CR>
                inoremap <silent> <F12> <Esc><Esc>:TagbarToggle<CR>

                            "Conflict Analysis & Resolution
                                function! AA()
                                    :g/\(Miall\|Cheldelin\|Cloke\|Ramsbotham\|McDonald\|Tidwell\|Pruitt\|Miall\|Hugh\|Oliver\|Ramsbotham\|and\|Tom\|Woodhouse\|Lederach\|John\|Paul\|Cheldelin\|Druckman\|and\|Fast\|eds\|Pruitt\|Dean\|and\|Kim\|Sung\|Hee\|Cloke\|Kenneth\|McDonald\|John\|and\|Louise\|Diamond\|Tidwell\|Alan\|C.\|Burton\|John\|Cheryl\|Duckworth\|Ph.D.Cheldelin\)/
                                endfunction

                            "Marks
                                "' jumps to the precise location of a marks (`)
                                "Apply the commands recorded in q on the vilual selection
                                vnoremap ` :normal @q<CR>

                        " Make shift insert work in the gui as it does in the shell.
                            if has('gui_running')
                                silent noremap! <S-Insert> <MiddleMouse>
                            endif



set background=dark
colorscheme solarized
let g:solarized_termcolors=256
                " Syntastic settings
                    let g:syntastic_enable_signs=1          " Use :sign interace to mark syntax errors
                    let g:syntastic_check_on_open=1         " Check for errors on buffer load
                    let g:syntastic_auto_loc_list=1         " Open Error window automatically
                    let g:syntastic_auto_jump=1             " Automatically jump to first detected error
                    let g:syntastic_loc_list_height=3
                    let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

                " Gist settings
                        let g:gist_open_browser_after_post=1
                        let g:gist_detect_filetype=1
                        let g:gist_browser_command = 'w3m %URL%'
                        let g:gist_clip_command = 'xclip -selection clipboard'
                        let g:gist_get_multiplefile = 1
                        let g:gist_post_private = 1


                            " Python
                                let python_highlight_all = 1
                                hi pythonBuiltin        ctermfg=blue    cterm=NONE
                                hi pythonSync           ctermfg=red

                                autocmd FileType python setl autoindent
                                autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
                                autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
                                autocmd FileType python setl omnifunc=pythoncomplete#Complete


                    " Neosnippet
                        let g:neosnippet#disable_runtime_snippets
                        let g:neosnippet#enable_snipmate_compatibility = 1
                        let g:neocomplete#enable_at_startup                 = 1
                        let g:neocomplete#sources#syntax#min_keyword_length = 3
                        let g:neocomplete#min_keyword_length                = 0
                        let g:neocomplete#enable_auto_delimiter             = 1
                        let g:neosnippet#enable_snipmate_compatibility      = 1
                        let g:neocomplete#enable_insert_char_pre            = 1
                        let g:neocomplete#enable_smart_case                 = 1
                        let g:neocomplete#enable_fuzzy_completion           = 1
                        let g:neocomplete#enable_auto_select                = 0
                        let g:neocomplete#enable_refresh_always             = 0


                        " PythonSyntax: Highlight everything
                            let python_highlight_all=1
                            autocmd FileType python setl omnifunc=pythoncomplete#Complete
                            " Font
                           set guifont=Monaco\ for\ Powerline:h11
                            " Airline
                                    set noshowmode
                                    let g:airline_theme = 'solarized'
                                    let g:airline_enable_branch = 1
                                    let g:airline_powerline_fonts = 1
                                    let g:airline_detect_whitespace = 1
                                    let g:airline#extensions#hunks#non_zero_only = 1
                                    let g:airline#extensions#tabline#enabled = 2
                                    let g:airline#extensions#tabline#fnamemod = ':t'
                                    let g:airline#extensions#tabline#buffer_min_count = 1

                                    let g:syntastic_python_checkers = ['pyflakes']

                                    " indentLine
                                    let g:indentLine_char = '┊'
                                    let g:indentLine_color_term = 239


                                " Syntastic
                                        let g:syntastic_python_pylint_exe = "pylint2"
                                        let g:syntastic_error_symbol = '✘'
                                        let g:syntastic_warning_symbol = '⚠'
                                        let g:syntastic_style_error_symbol = '⚡'
                                        let g:syntastic_style_warning_symbol = '⚡'

                                            let g:pymode_lint_checker = 'pylint,pep8,mccabe,pep257'
                                            let g:pymode_lint_config = $HOME.'/.pylintrc'
                                            let g:pymode_lint_cwindow = 0

                                        " Custom symbols will be supported in the future (I hope).
                                        " See: https://github.com/klen/python-mode/pull/295
                                        let g:pymode_lint_todo_symbol = '⚠'
                                        let g:pymode_lint_comment_symbol = '⑊'
                                        let g:pymode_lint_visual_symbol = '⑆'
                                        let g:pymode_lint_error_symbol = '✘'
                                        let g:pymode_lint_info_symbol = '●'
                                        let g:pymode_lint_pyflakes_symbol = '●'

                    " Font
                        let g:Powerline_symbols = 'fancy'

                            " USe the current system list of words as dictionary for completion with
                                " C-X C-K  ( :he i_CTRL-X_CTRL-K )
                                if filereadable("/usr/share/dict/words")
                                    set dictionary+=/usr/share/dict/words
                                endif

                        " Set British English as the language for spelling corrections
                            set spelllang=en_gb

                        " Tagbar: show the tag corresponding to the current cursor position
                                let g:tagbar_autoshowtag = 1
                            "tab
                                cmap <C-Left> :tabprevious<cr>
                                cmap <C-Right> :tabnext<cr>
                                        """" """" """"
                                                "map <leader>to :tabnew<cr>
                                                " map <leader>te :tabedit
                                                "map <leader>tc :tabclose<cr>
                                                " map <leader>to :tabonly<cr>
                                                "map <leader>tn :tabnext<cr>
                                                "map <leader>tp :tabprevious<cr>
                                                " map <leader>tf :tabfirst<cr>
                                                " map <leader>tl :tablast<cr>
                                                " map <leader>tm :tabmove
                                                "nmap <C-Left> :tabpreious<cr>
                                                "vmap <C-Left> :tabprevious<cr>
                                                "vmap <C-Right> :tabnext<cr>



                    " Buffer navigation
                            map <Tab> >>
                            map <s-tab> <<
                            set splitbelow splitright
                            map <M-Left> :bprevious<CR>
                            map <M-Right> :bnext<CR>
                            "map <S-Up> <C-W>_
                            "map <M-Up> <C-W>j<C-W>_
                            "map <M-Down> <C-W>k<C-W>_


                        " [QA-Stack]
                            cab qmd vsplit ~/zdotfiles/9/web2py/applications/qastack/models/db.py
                            cab qcd vsplit ~/zdotfiles/9/web2py/applications/qastack/controllers/default.py<CR>
                            cab qvd vsplit ~/zdotfiles/9/web2py/applications/qastack/views/default/index.html<CR>

                        "cab to the [1-10]
                            cab w99 w! ~/zdotfiles/9/web2py/applications/qastack/
                            cab w88 w! ~/zdotfiles/8/
                            cab w77 w! ~/zdotfiles/7/
                            cab w66 w! ~/zdotfiles/6/
                            cab w55 w! ~/zdotfiles/5/
                            cab w44 w! ~/zdotfiles/4/
                            cab w33 w! ~/zdotfiles/3/
                            cab w22 w! ~/zdotfiles/2/
                            cab w11 w! ~/zdotfiles/1/
                            cab w00 w! ~/zdotfiles/0/
                            cab 6w vsplit ~/zdotfiles/6/zapi_python.py
        cabbrev W call

                                nnoremap <silent> w1 :vsplit ~/zdotfiles/1/.zsh/al.sh<cr>
                                nnoremap <silent> w2 :vsplit ~/zdotfiles/2/.vimrc.localw<cr>
                                "ipython"
                                    cabbrev wpy vsplit ~/.config/ipython/profile_default/startup/w.ipy
                                    cabbrev wwpy vsplit ~/.config/ipython/profile_default/startup/ww.ipy
                                    cabbrev wpy !python %
                                    cabbrev wak vsplit ~/zdotfiles/6/autokey/data/API/AK/ak_vim.txt
                                    cabbrev wf !firefox %

                            "abbreviate
                                abbreviate CAR Conflict Analysis & Resolution
                                abbreviate w# """"""""""""""""""""""""<CR>
                                cabbrev ws %s/\s\+$//gc
                                cabbrev ws_ s/\s/_/gc
                                abbr #b #!/usr/bin/env bash
                                abbr #p #!/usr/bin/env python<CR>

                " w
                                cabbrev h tab h
                                nmap w<left> :exe "normal \<c-o>"<CR>
                                nmap w<right> :exec "normal gf"<CR>
                                nnoremap <silent> ; :q!<CR>
                                nnoremap ww Y
                                ":let @a=""\|:let @a=colors_name\|:let @"=@a<CR>\|:echo @"<CR>
                                "normal"
                                cabbrev wsh !bash %
                                imap <C-s> <C-o>:w<CR>
                                map <C-s> :w<CR>

                                nmap <Space><Left> %
                                nmap <Space><Right> *
                                nnoremap <Space><CR> :nohlsearch<CR><CR>
                                "html substitute "!sed 's/<[^>]*>//g' %
                                "imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>ka
                                "nnoremap <silent> wF :%s/\(.*\)\(conflict\)\(.*\)/\1\2\31/gc
                                map W :NeoSnippetEdit -vertical<CR>

                                vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

                            cabbrev wwww <C-r>#
                            cabbrev www <C-r>%
                            cabbrev ww <C-r>"<BS>
                                let @a=@q
                            let @x="V}y<Esc>:vsplit ~/.vimrc.local.w<CR>ggGp<ESC><C-W><C-W>"
                                    map <CR> :



            vnoremap <silent> WW y<C-W><C-W>Gp<C-W><C-W>
            nnoremap <silent> WW y<C-W><C-W>Gp<C-W><C-W>
            vnoremap <silent> WW y<C-W><C-W>Gp<C-W><C-W>
                                " Select all.
                                    map <c-a> ggVG
                                " Undo in insert mode.
                                    imap <c-z> <c-o>u




                                fun! RangerChooser()
                                    exec "silent !python ~/zdotfiles/5/ranger-1.6.1/ranger.py --choosefile=/tmp/chosenfile " . expand("%:p:h")
                                    if ilereadable('/tmp/chosenfile')
                                        exec 'edit ' . system('cat /tmp/chosenfile')
                                        call system('rpythonm /tmp/chosenfile')
                                    endif
                                    redraw!
                                endfun
                                    "nnoremap <C-Left> :call RangerChooser()<CR>

                            " Split the Line at Cursor
                                nnoremap K i<cr><esc><right>
                                nnoremap <C-Up> m`o<Esc>``
                                nnoremap <C-Down> m`O<Esc>``

                            "Fold System
                                nnoremap 8 zMzvzz
                                nnoremap 9 zM
                                nnoremap 0 zR
                                nnoremap <space> za
                                vnoremap <space> zf

                                cnoremap <C-e> <End>
        " Shell command {
            function! s:W_find_py(cmdline)
                botright new
                setlocal buftype=nofile
                setlocal bufhidden=delete
                setlocal nobuflisted
                setlocal noswapfile
                setlocal nowrap
                setlocal filetype=python
                setlocal syntax=py
                colorscheme solarized

                call setline(1, a:cmdline)
                call setline(2, substitute(a:cmdline, '.', '=', 'g'))
                execute 'silent $read !' . escape(a:cmdline, '%#')
                "setlocal nomodifiable
                redraw!
                setlocal syntax=vim
                1
            endfunction

            command! -complete=file -nargs=+ Wfindpy call s:W_find_py(<q-args>)
                " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %

                        "let zwz = 'grep -RHn' "let cmd = @a

                        function! Zshell(cmd)
                            exe ':silent !'.a:cmd.' > /tmp/vim.insert.xxx 2>/dev/null'
                            botright new
                            setlocal buftype=nofile
                            setlocal bufhidden=delete
                            setlocal nobuflisted
                            setlocal noswapfile
                            setlocal nowrap
                            setlocal filetype=shell
                            setlocal syntax=sh
                            colorscheme solarized
                            "let l = readfile( '/tmp/vim.insert.xxx' )
                            "call setline(1, a:cmd)
                            "call setline(2, substitute(a:cmd, '.', '=', 'g'))
                            "execute 'silent $read !' . escape(a:cmd, '%#')
                            exec 'edit ' . system('cat /tmp/vim.insert.xxx')
                            redraw!
                        endfunction

            " SnipMate {
                " Setting the author var
                " If forking, please overwrite in your .vimrc.local file
                let g:snips_author = 'Ahmed Alghamdi <tazjel@gmail.com>'
            " }

               let g:spf13_no_easyWindows = 1

        "find files

        fun! FindFiles()
            let $filename = input("Enter file name to find: ")
            let $error_file = $HOME."/.findfile.output"
            silent! exe "!find . -iname \"".$filename."\" \| xargs file \| perl -pe 's/:/:1:/' > ".$error_file
            cfile $error_file
            copen
            redraw!
        endfun

        " A function to save word under cursor to a file
        function! SaveWord()
           normal yiw
           exe ':!echo '.@0.' >> $HOME/.vimrc.local.w'
        endfunction
        map <C-F6> :call SaveWord()<CR>


        " Using templates
        function! LoadTemplate(extension)
            silent! :execute '0r $HOME/.vim/templates/' . a:extension . '.tpl'
            silent! execute 'source $HOME/.vim/templates/' . a:extension . '.patterns.tpl'
        endfunction
        "
         "autocmd BufNewFile * silent! call LoadTemplate('%:e')

         "Map Ctrl+j for jumping between templates placeholders
        nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
        inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
                inoremap <Tab> <C-R>=SuperCleverTab()<cr>

                " Map <C-right> to go next buffer
                    map <C-right> <ESC>:bn<CR>
                " Map <C-left> to go previous buffer
                    map <C-left> <ESC>:bp<CR>

                let g:acp_enableAtStartup = 0
                " Use neocomplcache.
                let g:neocomplcache_enable_at_startup = 1
                " Use smartcase.
                let g:neocomplcache_enable_smart_case = 1
                " Set minimum syntax keyword length.
                let g:neocomplcache_min_syntax_length = 1
                let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

                " Enable heavy features.
                " Use camel case completion.
                let g:neocomplcache_enable_camel_case_completion = 1
                " Use underbar completion.
                let g:neocomplcache_enable_underbar_completion = 1

                " Define dictionary.

                " Plugin key-mappings.
                inoremap <expr><C-g>     neocomplcache#undo_completion()
                inoremap <expr><C-l>     neocomplcache#complete_common_string()

                " Recommended key-mappings.
                " <CR>: close popup and save indent.
                inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
                function! s:my_cr_function()
                  return neocomplcache#smart_close_popup() . "\<CR>"
                  " For no inserting <CR> key.
                  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
                endfunction
                " <TAB>: completion.
                inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
                inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y>  neocomplcache#close_popup()
                inoremap <expr><C-e>  neocomplcache#cancel_popup()
                " Close popup by <Space>.
                "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

                " For cursor moving in insert mode(Not recommended)
                inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
                inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
                inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
                inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
                "
                " Or set this.

                let g:neocomplcache_enable_cursor_hold_i = 1
                " Or set this.
                let g:neocomplcache_enable_insert_char_pre = 1

                " AutoComplPop like behavior.
                let g:neocomplcache_enable_auto_select = 1

                " Shell like behavior(not recommended).
                set completeopt+=longest
                let g:neocomplcache_enable_auto_select = 1
                let g:neocomplcache_disable_auto_complete = 1
                inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

                " Enable omni completion.
                autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
                autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
                autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
                autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
                autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

                " Enable heavy omni completion.
                let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
                let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


                map ,, :call SaveLine()
                map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
                map ,h :sp <C-R>=expand("%:p:h") . "/" <CR>
                map ,l :call LoadTemplate()
                map ,l :call SaveLine()
                map ,v :vsp <C-R>=expand("%:p:h") . "/" <CR>
                inoremap <c-f> <c-r>=expand('%:r')<cr>
                match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
                "/^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$
                "" shortcut to jump to next conflict marker
                """"""""
                autocmd filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
                autocmd filetype python setlocal textwidth=78
                autocmd filetype python match ErrorMsg '\%>120v.\+'
                autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
                autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
                autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
                autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

        let NERDTreeWinPos                = 'right'
        let NERDTreeShowBookmarks         = 1
        "
        highlight WhitespaceEOL ctermbg=red guibg=red
        match WhitespaceEOL /\s\+$/

        autocmd BufNewFile,Bufread * set fileformat=unix
        autocmd BufLeave *.* silent mkview
        autocmd BufEnter *.* silent loadview

        set browsedir=current
        set completeopt=menuone,longest



nmap ,al :left<CR>
nmap ,ar :right<CR>
nmap ,ac :center<CR>
" }}}
" Working with tabs {{{
nmap ,t <Esc>:tabedit .<CR>
nmap ,T <Esc>:tabnew<CR>
nmap gt <C-w>gf
nmap gT <C-w>gF
nmap ,1 :tabn 1<CR>
nmap ,2 :tabn 2<CR>
nmap ,3 :tabn 3<CR>
nmap ,4 :tabn 4<CR>
nmap ,5 :tabn 5<CR>
nmap ,6 :tabn 6<CR>
nmap ,7 :tabn 7<CR>
nmap ,8 :tabn 8<CR>
nmap ,9 :tabn 9<CR>
nmap ,0 :tabn 10<CR>
nmap ,<Left> :tabprevious<CR>
nmap ,<Right> :tabnext<CR>
"
"
" NERDTree settings {{{from :
"https://github.com/cmdel/config-rc-files/blob/fc67f12b400e344dcc70a03f77f906199557d0e4/.vimrc
" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>
" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeQuitOnOpen=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2
nnoremap j gj
nnoremap k gk

nnoremap <leader>w <C-w>v<C-w>l

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

" YankRing stuff
let g:yankring_history_dir = '$HOME/.vim/.tmp'

nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
"
"from : "https://github.com/cmdel/config-rc-files/blob/fc67f12b400e344dcc70a03f77f906199557d0e4/.vimrc
" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ,> :s/^/> /<CR>
map ," :s/^/\"/<CR>
map ,% :s/^/%/<CR>
map ,! :s/^/!/<CR>
map ,; :s/^/;/<CR>"{
map ,- :s/^/--/<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>"}

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>

nnoremap <space><down> :normal Go<CR>


        "" SnipMate {
    "" Setting the author var
    "" If forking, please overwrite in your .vimrc.local file
        let g:snips_author = 'Ahmed Alghamd aalghamd@nova.edu>'
    "" }


cabbrev WWw wincmd v

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif




