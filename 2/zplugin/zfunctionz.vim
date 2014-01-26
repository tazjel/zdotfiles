
                        colorscheme random

                "" Mappings
                    " Tabs and indents.
"                        set autoindent smartindent                      " auto indent
"                        set expandtab smarttab                          " tab
"                        set tabstop=4 shiftwidth=4

                        set noswapfile nobackup nowritebackup

"                        set showmatch matchtime=3 matchpairs+=<:>       " parenthesis matching
                        set timeout timeoutlen=5000 ttimeoutlen=100
                        set history=10000
                        set shortmess=aTI                               " no greeting message

                        set splitbelow splitright                       " splitting direction
                        "
                            " Use clipboard register
                                if has('unnamedplus')
                                  set clipboard& clipboard+=unnamedplus
                                else
                                  set clipboard& clipboard+=unnamed
                                endif



                        " set folding
                            setlocal foldmethod=expr
                            setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))

                            set foldtext=getline(v:foldstart)
                            set fillchars=fold:\ "(there's a space after that \)
                            "highlight Folded ctermfg=DarkGreen ctermbg=Black


                            "Fold System
                                    nnoremap 8 zMzvzz
                                    nnoremap 9 zM
                                    nnoremap 0 zR


                                "<space><space>
                                    nnoremap <space> za
                                    vnoremap <space> zf

                    nnoremap <Space><CR> :nohlsearch<CR><CR>

      "<F[1-12]>
                    imap <F1> <Esc><F1>
                    map <F1> :nohlsearch<CR>\|:.s/^/"/<CR>\|:nohlsearch<CR>
                    map <S-F1> :.s/^\(^.*\)"//<CR>\|:nohlsearch<CR>

"               "nnoremap <F2> :let @*=expand("%:p")<cr> :unix

                nnoremap <F2> :reg<CR>
                nnoremap <S-F2> :marks <CR>
            " <F3>
                " Fold
                map <F3> :ls<CR>:sb
            " <F4>
                "UndotreeToggle<F2> :reg<CR>
                nnoremap <S-F2> :marks <CR>
            " <F3>
                " Fold
                map <F3> :ls<CR>:sball
            " <F4>

                    nnoremap <F4> :verbos map<Space>
                    nnoremap <S-F4>  :let @a=""\|:let @a=colors_name\|:let @"=@a<CR>\|:echo @"<CR>
            " <F5>
                    nnoremap <silent> <F5> :source ~/zdotfiles/2/.vimrc.local<CR>\|:echo colors_name<CR>
                    "nnoremap <silent> <S-F5> :vsplit ~/zdotfiles/2/.vimrc.local<CR>
"                Tips
                    nnoremap <silent> <C-S-F5> :vsplit ~/zdotfiles/2/vimrc.txt<CR>
                    nnoremap <C-F5> :vsplit ~/zdotfiles/1/.zsh/al.zsh<CR>
            " <F6>
                vnoremap <F6> :w! >> ~/zdotfiles/6/
                nnoremap <C-F6> :vsplit ~/zdotfiles/6/
"                nnoremap <S-F6> :vsp ~/zdotfiles/6/


            " <F7>

    "                nnoremap <Space>w :let @B="" \|let @B=\<C-R>=expand("<cword>")

                    imap <F7> <C-X><C-l>

    ""                vnoremap <f7> :s/xxx/\$\{1\:#\}/g
    "                map <F7> :%s///gc<Left><Left><Left><Left>

                    map <F7> :let @a=''\|g/ /y A \|:let @*=@a <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

                map <S-F7> :%s/<C-r><C-w>//gc<Left><Left><Left>
            " <F8>

                    cabbrev wf !firefox %
                    map <F8> :TagbarToggle<CR>

                    map <S-F8> :diffthis<cr><esc><c-w><c-w>:diffthis<cr>

"                    map <f8><f8> :diffoff<cr>

        set diffopt=filler,context:4,iwhite
            " <F9>
                nnoremap <silent> <F9> :SessionList<CR>
                nnoremap <silent> <S-F9> :SessionSave<CR>
                nnoremap <M-F9> :sessionopen
                nnoremap <C-F9> :SessionSaveAs
            " <F10>




            cabbrev t5 vsplit ~/.spf13-vim-3/.vim/bundle/neosnippet/autoload/neosnippet/snippets/text.snip
            cabbrev s1 vsplit ~/.spf13-vim-3/.vim/bundle/neosnippet/autoload/neosnippet/snippets/sh.snip
            cabbrev pw vsplit ~/.config/ipython/profile_default/startup/w.ipy
            cabbrev wp vsplit ~/.config/ipython/profile_default/startup/ww.py


                "abbreviate
                    abbreviate CAR Conflict Analysis & Resolution

    "                iabbr ws when where who what why



                abbreviate w# """"""""""""""""""""""""<CR>
                            \"<CR>
                            \"""""""""""""""""""""""""<up>




                    fun! RangerChooser()
                        exec "silent !python ~/zdotfiles/5/ranger-1.6.1/ranger.py --choosefile=/tmp/chosenfile " . expand("%:p:h")
                        if filereadable('/tmp/chosenfile')
                            exec 'edit ' . system('cat /tmp/chosenfile')
                            call system('rpythonm /tmp/chosenfile')
                        endif
                        redraw!
                    endfun


                        nnoremap <C-Left> :call RangerChooser()<CR>


                    "nnoremap <silent> wF :%s/\(.*\)\(conflict\)\(.*\)/\1\2\31/gc
        " <F11>
        " <F12>
            cabbrev ws %s/\s\+$//gc
            cabbrev ws_ s/\s/_/gc

            nnoremap <silent> w1 :vsplit ~/zdotfiles/1/.zsh/al.zsh<cr>
            nnoremap <silent> w2 :vsplit ~/zdotfiles/2/.vimrc.localw<cr>

        "imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>ka

        cab w!! w !sudo tee "%"

"        map ws :!rm ~/.vimswap/*<cr>
        "install unhtml
        "map wh :!rm ~/tst/vhtml<cr>:r!unhtml % > ~/tst/vhtml<cr><esc>:vsplit ~/tst/vhtml<cr>




    " The W culture "

                    cabbrev w111 vsp ~/zdotfiles/1.sh




                nnoremap <silent> ; :q!<CR>



                "cabbrev ws %s:^:snippet$\{0\:#\}:gc
                "cabbrev ws %s:^\(.*\):snippet\t\1\/\n\t\1:gc
                "%s:^\(.*\)\.\(.*\):snippet   \1\2\r   \0:g

        cabbrev wsh !bash %


        cabbrev w99 w! ~/zdotfiles/9/web2py/applications/qastack/

        cab zz e ~/zdotfiles/1/.zsh
        cab vv w! ~/zdotfiles/2/
        cab wx !chmod u+x %


        iabbrev ## #####################################################<CR>
                    \#<CR>
                    \#<CR>
                    \####################################################<CR>



        " [QA-Stack]
            cab qmd vsplit ~/zdotfiles/9/web2py/applications/qastack/models/db.py
            cab qcd vsplit ~/zdotfiles/9/web2py/applications/qastack/controllers/default.py<CR>
            cab qvd vsplit ~/zdotfiles/9/web2py/applications/qastack/views/default/index.html<CR>

                cab 6w vsplit ~/zdotfiles/6/zapi_python.py

        "maped to the [1-10]
                cab w88 w! ~/zdotfiles/8/
                cab w77 w! ~/zdotfiles/7/
                cab w66 w! ~/zdotfiles/6/
                cab w55 w! ~/zdotfiles/5/
                cab w44 w! ~/zdotfiles/4/
                cab w33 w! ~/zdotfiles/3/
                cab w22 w! ~/zdotfiles/2/
                cab w11 w! ~/zdotfiles/1/
                cab w00 w! ~/zdotfiles/0/


                    "Install unhtml
                        "map wh :!rm ~/tst/vhtml<CR>:r!unhtml % > ~/tst/vhtml<CR><Esc>:vsplit ~/tst/vhtml<CR>

                        "html substitute
                        "
                           " chain an external command
                           ":.g/^/ exe ".!sed 's/N/X/'" | s/I/Q/    [N]
                            "!sed 's/<[^>]*>//g' %

                                            " Split the Line at Cursor
                                                nnoremap K i<cr><esc><right>


                                                        "Enter
                                                                nnoremap <C-Up> m`o<Esc>``
                                                                nnoremap <C-Down> m`O<Esc>``

                                                        nnoremap xw :%s/<[^>]*>//gi<cr><CR>
                                                        "!sed 's/<[^>]*>//g' %






                                        iabbrev $$ ${0: }<left><left>

                                abbr #b #!/bin/bash
                                abbr #p #!/usr/bin/env python<CR>
                                            \#<CR>
                                            \# -*- coding: utf-8 -*-<CR>
                                            \<CR>
                                            \<CR>
                                            \<CR>
                                            \import os, sys, re


                                        " Select all.
                                            map <c-a> ggVG
                                        " Undo in insert mode.
                                            imap <c-z> <c-o>u



            "map <F11> y<C-W>n<C-W>Lp:w ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_ak.snip
            "map <F11> y:vsplit ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_w.snip<CR>
            "map <F11> :w! >> ~/Dropbox/INTRODUCTION/terms.txt<CR>
            "map <S-F11> y:vsplit ~/Dropbox/INTRODUCTION/terms.txt<CR>
" " Download the thesaurus " unzip " Add this to vimrc
    " wget www.gutenberg.org/dirs/etext02/mthes10.zip


"    set thesaurus+=/home/ahmed/mthesaur.txtSylubus.txt
     set thesaurus+=/home/ahmed/Dropbox/DCAR/_phrase.snip
    " set dictionary+=/home/ahmed/Dropbox/Sylubus.txt
     set dictionary+=/home/ahmed/Dropbox/System.txt

function! SilentFileGrep( leader, file )
    try
        exe 'vimgrep /^s*' . a:leader . '.*/j ' . a:file
    catch /.*/
        echo "no matches"
    endtry
endfunction




                                "function! LineCompleteFromFile(findstart,base)
                                "    if a:findstart
                                "        " column to begin searching from (first non-whitespace column):
                                "        return match(getline("."),'S')
                                "    else
                                "        " grep the file and build list of results:
                                "        let path+= /home/ahmed/Dropbox/Causes.txt
                                "        call SilentFileGrep( a:base, path )
                                "        let matches = []
                                "        for thismatch in getqflist()
                                "            " trim leading whitespace
                                "            call add(matches, matchstr(thismatch.text,'S.*'))
                                "        endfor
                                "        call setqflist([])
                                "        return matches
                                "    endif
                                "endfunction

                                "set completefunc=LineCompleteFromFile



            " reading Ms-Word documents, requires antiword (not docx)
"                autocmd FileType *.txt exec('set syntax= text')
                    "autocmd BufReadPre *.doc set ro
                    "autocmd BufReadPre *.doc set hlsearch!

"                    autocmd FileType *.txt exec('set fileformats=unix')


            " abbreviation to manually enter a timestamp. Just type YTS in insert mode
                    iab YTS <C-R>=TimeStamp()<CR>

                            " Date/Time stamps
                            " %a - Day of the week
                            " %b - Month

                            " %d - Day of the month
                            " %Y - Year
                            " %H - Hour
                            " %M - Minute
                            " %S - Seconds
                            " %Z - Time Zone

            iab YDATETIME <c-r>=strftime(": %B %d, %Y")<cr>
                " first add a function that returns a time stamp in the desired format
                if !exists("*TimeStamp")
                    fun TimeStamp()

                        return "Last-modified: " . strftime("%d %b %Y %X")
                    endfun
                endif
""""""

                            "window
                                "Open file same dir--------------------------------------------
                                    "On the current window
                                    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
                                    "On a new vertical window
                                    map ,v :vsp <C-R>=expand("%:p:h") . "/" <CR>
                                    "On a new horizontal window
                                    map ,h :sp <C-R>=expand("%:p:h") . "/" <CR>
                                    "
                                "Tab takes you to the next window:
                                    "nmap <Tab> _
                                    "nmap <S-Tab>  W_
                                    "nmap <S-Tab> :tabprevious<CR>

"                        map <Leader>w <c-w>v<c-w>l
"                        map <Leader>sh <c-w>s<c-w>j
            "File
                "nmap ,, :e.<CR>
                imap <C-s> <C-o>:w<CR>
                map <C-s> :w<CR>

                func! PL(str) " Print string into the current buffer
                  exe "normal o" . a:str
                endf

                func! NL()
                    exe "normal o"
                endf

                    " Print string into the current buffer
                func! Print(str)
                    exe "normal i" . a:str
                endf

                func! P(str) " Print string into the current buffer
                    call Print(a:str)
                endf

                func! SelectAll() " Select all of current buffer
                    exe "normal ggVG"
                endf

                func! SA() " Select all of current buffer
                    call SelectAll()
                endf

                func! SelectLine() " Select current line
                    exe "normal V"
                endf

                func! SL() " Select current line
                    call SelectLine()
                endf

                func! Copy() " Copy current selection to clipboard
                    exe 'normal "+y'
                endf

                func! CP() " Copy current selection to clipboard
                    call Copy()
                endf
                func! CopyAll() " Copy current buffer contents to clipboard
                    call SelectAll()
                    call Copy()
                endf

                func! CPA() " Copy current buffer contents to clipboard
                    call CopyAll()
                endf

                func! CopyLine() " Copy a single line
                    call SelectLine()
                    call Copy()
                endf

                func! CPL() " Copy a single line
                    call CopyLine()
                endf

                func! Cut() " Cut current buffer contents to clipboard
                    call CopyAll()
                    %d
                endf

                func! S2C(str) " Put string on clipboard
                    %d
                    call P(a:str)
                    call Cut()
                endf



                function! SaveLine()
                   call CPL()
                   exe ':!echo '.@0.' >> ~/word.txt'
                endfunction

                "map ,l :call SaveLine()
                """"""
                function! SaveWord()
                   call CopyLine()
                   exe ':!echo '.@0.' >> ~/word.txt'
                endfunction
                map ,, :call SaveLine()

                " function to delete duplicate lines
                function! Del_dupl()
                 if getline(".") == getline(line(".") - 1)
                   norm dd
                 endif
                endfunction

                ":g/^/ call Del()

                """"""""""


            "Syntax
                "au Syntax txt  runtime! syntax/txt.vim

            "Conflict Analysis & Resolution
                    function! AA()
                        :g/\(Miall\|Cheldelin\|Cloke\|Ramsbotham\|McDonald\|Tidwell\|Pruitt\|Miall\|Hugh\|Oliver\|Ramsbotham\|and\|Tom\|Woodhouse\|Lederach\|John\|Paul\|Cheldelin\|Druckman\|and\|Fast\|eds\|Pruitt\|Dean\|and\|Kim\|Sung\|Hee\|Cloke\|Kenneth\|McDonald\|John\|and\|Louise\|Diamond\|Tidwell\|Alan\|C.\|Burton\|John\|Cheryl\|Duckworth\|Ph.D.Cheldelin\)/
                    endfunction
                    "
                        "%s/\(Miall\|Cheldelin\|Cloke\|Ramsbotham\|McDonald\|Tidwell\|Pruitt\|Miall\|Hugh\|Oliver\|Ramsbotham\|and\|Tom\|Woodhouse\|Lederach\|John\|Paul\|Cheldelin\|Druckman\|and\|Fast\|eds\|Pruitt\|Dean\|and\|Kim\|Sung\|Hee\|Cloke\|Kenneth\|McDonald\|John\|and\|Louise\|Diamond\|Tidwell\|Alan\|C.\|Burton\|John\|Cheryl\|Duckworth\|Ph.D.Cheldelin\)/\r__AA\1/g
                        "%s/\(Miall\|Cheldelin\|Cloke\|Ramsbotham\|McDonald\|Tidwell\|Pruitt\|Miall\|Hugh\|Oliver\|Ramsbotham\|and\|Tom\|Woodhouse\|Lederach\|John\|Paul\|Cheldelin\|Druckman\|and\|Fast\|eds\|Pruitt\|Dean\|and\|Kim\|Sung\|Hee\|Cloke\|Kenneth\|McDonald\|John\|and\|Louise\|Diamond\|Tidwell\|Alan\|C.\|Burton\|John\|Cheryl\|Duckworth\|Ph.D.Cheldelin\)/\r\r\1\r/g


"nnoremap <C-F10> call setqflist([]) | :bufdo grepadd! w %
    "map <S-Up> <C-W>_
           map <M-Up> <C-W>j<C-W>_
           map <M-Down> <C-W>k<C-W>_




            "CMD
                noremap <CR> :







            "auto-complete
                " nice bash-like filename auto-complete
                set list
                set wildmode=longest,list,full
                set wildmode=full:list
                set wildmenu

"                                                    let pos = [line('.'), col('.')]
"                                                    let saved_register = @@


    "autocmd
           ":autocmd bufenter *.tex map <F1> :!latex %<CR>
           ":autocmd bufenter *.tex map <F2> :!xdvi -hush %<.dvi&<CR>
"                autocmd! BufNewFile *py call LoadTemplate()
                "                autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif
                "                autocmd BufEnter * if &filetype == "txt" | setlocal ft=txt | endif



" TEMPLATES
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

"Move
                                    nnoremap ,w  ddGop
                                    map ن n

                                    map س  V:w!   >> ~/Dropbox/CAR_system<CR>
                    "
                    "Clean
                        "\%[]	A sequence of optionally matched atoms.  This always matches.
                          ":%s/,/^V^M/g
                          "globally replace commas with newlines (yes, I know this
                            "looks like it would insert DOS carriage returns, but it only inserts the
                            "newlines on Unix)
                          ":%s/\s*$//
                          "strip blanks from end of lines
                          ":%s/^.\{30}//
                          "remove the first 30 characters from each line
                          ":%s/[ ^I]*$/!d
                          "remove trailing whitespace (where ^I
                            "is produced by pressing the tab key)
                          ":%s/.*/\L&/
                          "convert the entire file to lowercase.
                          ":s/.*/\u&/
                          "convert the first character of line to uppercase.
                          ":%s/\&lt;./\u&amp;/g
                            "convert the first character of each word to uppercase
                              "\&lt; matches the start of a word;
                                ". therefore matches the first character of a word;
                                "\u tells Vi(m) to uppercase the next character in the substitution
                                "string;
                                "&amp; means substitute whatever was matched on the lhs;
                        "%s/\(^.*install\) \(.*$\)/\2/g

                        " source: http://vim.wikia.com/wiki/VimTip102
                        " Let <Tab> do all the autocompletion

function! Smart_TabComplete()
    let line = getline('.') 					" curline
    let substr = strpart(line, -1, col('.'))	" from start to cursor
    let substr = matchstr(substr, "[^ \t]*$")	" word till cursor
    if (strlen(substr)==0)						" nothing to match on empty string
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1	" position of period, if any
    let has_slash = match(substr, '\/') != -1	" position of slash, if any
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"					" existing text matching
    elseif ( has_slash )
        return "\<C-X>\<C-F>"					" file matching
    else
        return "\<C-X>\<C-l>"					" plugin matching
    endif
endfunction

"inoremap <tab> <c-r>=Smart_TabComplete()<CR>
    set cpt=.,k,w,b,t,i

    "Register
        " Make p in Visual mode replace the selected text with the "" register.
        vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

    "Marks
        "' jumps to the precise location of a marks (`)
        "Apply the commands recorded in q on the vilual selection
        vnoremap ` :normal @q<CR>


""""""""""""""""""""""""
" python
"""""""""""""""""""""""""

function! P_Filetype()
python << EOF
import vim
ft = vim.eval("&filetype")
if ft == "python" or ft == "vim":
   import re
   data = '''
           Conflict Analysis & Resolution
           Conflict Analysis & Resolution
           Conflict Analysis & Resolution
           Conflict Analysis & Resolution
   '''
   match = re.search("(\w+)", data).group(1)
   vim.command("r!cat <<< "+match)
elif ft == "sh" or ft == 'python':
   vim.command("echo"+vim.current.buffer.name)
EOF
endfun



function! Ctaz()
python << EOF
import vim, re
curfile = vim.current.buffer.name
if curfile:
    print "w :%s" % curfile

print "Done"

EOF
endfunction


                                " comment (#)
                                        nmap sc 0i# <ESC>
                                        vmap <silent> sc :s/^/# /<CR>:silent noh<CR>
                                        " uncomment (#)
                                        nmap su :s/^# //<CR>
                                        vmap <silent> su :s/^# //<CR>:silent noh<CR>


"ipython"

"API
    "path
            cabbrev wpy vsplit ~/.config/ipython/profile_default/startup/w.ipy
            cabbrev wwpy vsplit ~/.config/ipython/profile_default/startup/ww.ipy
            cabbrev wpy !python %
            cabbrev wak vsplit ~/zdotfiles/6/autokey/data/API/AK/ak_vim.txt

"
"
"
"spelllang
function! Spell_new_word()
    "set spell!
    normal ]s
    normal 1z=
endfunction

nnoremap ,d :call Spell_new_word()
inoremap ,d :call Spell_next_word()
" Search


    function! InsertCmd( cmd )
           exe ':silent !'.a:cmd.' > /tmp/vim.insert.xxx 2>/dev/null'
           let l = readfile( '/tmp/vim.insert.xxx', '', 1 )
           exe "normal a".l[0]
           redraw!
    endfunction

imap <silent> <F10> <Esc>:call InsertCmd( 'grep -RI "w"' )<CR><Insert>

                let zwz = 'grep %'
                "imap <silent> <F10> <Esc>:call InsertCmd( zwz )<CR><Insert>
                "map <silent> <F10>  :call InsertCmd( 'hostname' )<CR>
    "
                let zwz = 'grep %'
                imap <silent> <F10> <Esc>:call InsertCmd( zwz )<CR><Insert>
                map <silent> <F10>  :call InsertCmd( 'hostname' )<CR>


"
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
"au FileType py set autoindent
"au FileType py set smartindent
"au FileType py set textwidth=79 " PEP-8 Friendly

"set winwidth=79 " This makes RVM work inside Vim. I have no idea why.
set shell=bash
"set t_ti= t_te=
"set scrolloff=3
"
                                "" Fix slow O inserts
                                set timeout timeoutlen=1000 ttimeoutlen=100
                                "
                                let g:sh_noisk=1
                                "
"                                set modeline
"                                set modelines=3
"
"augroup vimrcEx
  " Clear all autocmds in the group
"  autocmd!
"  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
        map <Tab> >>
        map <s-tab> <<


        " Buffer navigation
                        map <M-Left> :bprevious<CR>
                        map <M-Right> :bnext<CR>


"
                          "- Linux: >
                                    "let g:gist_clip_command = 'xclip -selection clipboard'
                                    "let g:gist_get_multiplefile = 1
                                    "let g:gist_post_private = 1


                                        " Search
                                                nnoremap <silent>  <Space><Space> :nohlsearch<Bar>:echo<CR>

                iabbrev WWW () {<CR>
                            \#<CR>
                            \<up><right>

    map W :NeoSnippetEdit -vertical<CR>


" Syntastic settings

"let g:syntastic_enable_signs=1          " Use :sign interace to mark syntax errors
"let g:syntastic_check_on_open=1         " Check for errors on buffer load
"let g:syntastic_auto_loc_list=1         " Open Error window automatically
"let g:syntastic_auto_jump=1             " Automatically jump to first detected error
"let g:syntastic_loc_list_height=3
"let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

" Gist settings
    let g:gist_open_browser_after_post=1
    let g:gist_detect_filetype=1
    let g:gist_browser_command = 'w3m %URL%'
    let g:gist_clip_command = 'xclip -selection clipboard'


"let g:neosnippet#enable_snipmate_compatibility = 1

"let g:pydiction_location = '/home/ahmed/zdotfiles/2/py_dict'

"let g:neosnippet#enable_preview = 1
"let i_<Plug>(neosnippet_start_unite_snippet)
"let g:unite_force_overwrite_statusline = 1


autocmd BufReadPost * if &readonly | setlocal nomodifiable | else | setlocal modifiable | endif


function! AccentDemo()
  let keys = ['a','b','c','d','e','f','g','h']
  for k in keys
    call airline#parts#define_text(k, k)
  endfor
  call airline#parts#define_accent('a', 'red')
  call airline#parts#define_accent('b', 'green')
  call airline#parts#define_accent('c', 'blue')
  call airline#parts#define_accent('d', 'yellow')
  call airline#parts#define_accent('e', 'orange')
  call airline#parts#define_accent('f', 'purple')
  call airline#parts#define_accent('g', 'bold')
  call airline#parts#define_accent('h', 'italic')
  let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()


function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

nmap <silent>  wn :call ToggleSyntax()<CR>


" ------------------
" Python
" ------------------
"let python_highlight_all = 1
"hi pythonBuiltin        ctermfg=blue    cterm=NONE
"hi pythonSync           ctermfg=red
"autocmd FileType python setl autoindent
"autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"autocmd FileType python setl omnifunc=pythoncomplete#Complete


nmap <Space><Right> *
nmap <Space><Left> %



" Markdown
" ------------------
au BufRead,BufNewFile *.md,*.mkdn,*.markdown :set filetype=markdown
au FileType markdown :set wrap



            cnoremap <C-b> <Left>
            cnoremap <C-d> <Del>
            cnoremap <C-e> <End>
            cnoremap <C-f> <Right>
            cnoremap <C-n> <Down>
            cnoremap <C-p> <Up>
            cnoremap <Esc><C-b> <S-Left>
            cnoremap <Esc><C-f> <S-Right>






"#####################################################
"#
"####################################################
""let g:neocomplete#enable_at_startup                 = 1
""let g:neocomplete#sources#syntax#min_keyword_length = 3
""let g:neocomplete#min_keyword_length                = 0
""let g:neocomplete#enable_auto_delimiter             = 1
""let g:neosnippet#enable_snipmate_compatibility      = 1
""let g:neocomplete#enable_insert_char_pre            = 1
""let g:neocomplete#enable_smart_case                 = 1
""let g:neocomplete#enable_fuzzy_completion           = 1
""let g:neocomplete#enable_auto_select                = 0
""let g:neocomplete#enable_refresh_always             = 0

"imap <expr><space> !pumvisible() ? "\<space>" :
"            \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
"            \ getline('.')[getpos('.')[2]-2] =~ '[\.\#\(]' ? '' : ' '
"imap <expr><TAB> pumvisible() ? "\<C-n>" :
"            \ neosnippet#expandable_or_jumpable() ?
"            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


"           cabbrev h tab h



"autocmd FileType python setl omnifunc=pythoncomplete#Complete

"cabbrev ww <C-r>"<BS>
"nnoremap ww Y
"nnoremap ww <F5>
nnoremap W :echo colors_name<CR>

"nnoremap WW <ESC><F5>:echo colors_name<CR>
":let &path = &path . ',/usr/local/include'


map <F1> <plug>NERDCommenterToggle

