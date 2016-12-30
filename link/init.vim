" vimrc.before "{{{
" ---------------------------------------------------------------------
"
"
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/tazjel/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim'))
" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
call dein#add('Shougo/deoplete.nvim')

let g:deoplete#enable_at_startup = 1
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically

" vimrc.before

  if filereadable('vimrc.before')
    source vimrc.before
  endif

" }}}
"
" General "{{{
" ---------------------------------------------------------------------
" General settings
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

  if (v:version < 704)
    echoerr "nvim requires vim >= 7.4. INSTALL IT! You'll thank me later!"
    finish
  endif

  let g:nvim_settings = {}
  let g:nvim_settings.version = 1

  " plugin groups
  let g:nvim_settings.plugin_groups = []
  call add(g:nvim_settings.plugin_groups, 'core')
  call add(g:nvim_settings.plugin_groups, 'language')
  call add(g:nvim_settings.plugin_groups, 'c')
  call add(g:nvim_settings.plugin_groups, 'python')
  call add(g:nvim_settings.plugin_groups, 'go')
  call add(g:nvim_settings.plugin_groups, 'scm')
  call add(g:nvim_settings.plugin_groups, 'editing')
  call add(g:nvim_settings.plugin_groups, 'indents')
  call add(g:nvim_settings.plugin_groups, 'navigation')
  call add(g:nvim_settings.plugin_groups, 'unite')
  call add(g:nvim_settings.plugin_groups, 'autocomplete')
  call add(g:nvim_settings.plugin_groups, 'misc')

  " core
  let g:nvim_settings.encoding = 'utf-8'
  "let g:nvim_settings.encoding = 'gbk'
  "let g:nvim_settings.encoding = 'latin1'
  let g:nvim_settings.use_local_bin = 0
  let g:nvim_settings.cscopeprg = 'gtags-cscope'
  "let g:nvim_settings.cscopeprg = 'cscope'

  " plugins
  let g:nvim_settings.autocomplete = 1
  let g:nvim_settings.explorer_plugin = 'nerdtree'
  "let g:nvim_settings.explorer_plugin = 'vimfiler'
  let g:nvim_settings.statusline_plugin = 'airline'
  "let g:nvim_settings.statusline_plugin = 'lightline'

  " user interface
  "let g:nvim_settings.colorscheme = 'molokai'
  let g:nvim_settings.colorscheme = 'solarized'
  let g:nvim_settings.force256 = 0
  let g:nvim_settings.termtrans = 0
  let g:nvim_settings.powerline_fonts = 0
  let g:nvim_settings.nerd_fonts = 0

  source ~/.config/nvim/vimrc

  if g:nvim_settings.encoding ==# 'utf-8'
    source ~/.config/nvim/encoding/utf-8.vim
  elseif g:nvim_settings.encoding ==# 'gbk'
    source ~/.config/nvim/encoding/gbk.vim
  else
    source ~/.config/nvim/encoding/latin1.vim
  endif

  " bin
  if g:nvim_settings.use_local_bin != 0
    let g:tagbar_ctags_bin = '~/local/bin/ctags'
    "let g:ConqueGdb_GdbExe = '~/local/bin/gdb'
  endif

" }}}

" User interface "{{{
" ---------------------------------------------------------------------
" User interface settings

  set wildmode=full

  " color
  set t_Co=256
  try
    " run `:syntax` to view highlight
    if g:nvim_settings.colorscheme ==# 'molokai'
      let g:molokai_original = 1
      colorscheme molokai
      set background=dark
      highlight NonText ctermfg=235 guifg=#262626
      highlight SpecialKey ctermfg=235 guifg=#262626
      "highlight PmenuSel ctermfg=231 guifg=#FFFFFF
      highlight CTagsClass ctermfg=81 guifg=#66D9EF
    elseif g:nvim_settings.colorscheme ==# 'solarized'
      " 16 color palette is recommended
      " <https://github.com/altercation/vim-colors-solarized>
      if g:nvim_settings.force256 == 1
        let g:solarized_termcolors = 256
      else
        let g:solarized_termcolors = 16
      endif
      let g:solarized_termtrans = g:nvim_settings.termtrans
      let g:solarized_degrade = 0
      set background=dark
      " <https://github.com/seanbell/term-tools/issues/2>
      " run `:help signify` to view signify highlight
      " run `:help highlight-groups` to view vim highlight
      colorscheme solarized
      if g:nvim_settings.force256 == 1
        highlight NonText ctermfg=236 ctermbg=none
        highlight SpecialKey ctermfg=236 ctermbg=none
        highlight LineNr ctermfg=240 ctermbg=0
        highlight CursorLine ctermbg=0
        "highlight CursorLineNr
        highlight CTagsClass ctermfg=125
      else
        exe "highlight! CTagsClass" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_magenta'] . g:solarized_vars['bg_none']

        " highlight lines in signify and vimdiff etc.
        "exe "highlight! DiffAdd" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_green'] . g:solarized_vars['bg_base02']
        "exe "highlight! DiffDelete" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_red']  . g:solarized_vars['bg_base02']
        "exe "highlight! DiffChange" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_yellow'] . g:solarized_vars['bg_base02']

        " highlight signs in signify
        "exe "highlight! SignifySignAdd" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_green'] . g:solarized_vars['bg_base02']
        "exe "highlight! SignifySignDelete" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_red'] . g:solarized_vars['bg_base02']
        "exe "highlight! SignifySignChange" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_yellow'] . g:solarized_vars['bg_base02']

        " indent guides
        let g:indent_guides_auto_colors = 0
        " bg_cyan
        exe "autocmd VimEnter,Colorscheme * :highlight! IndentGuidesOdd" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_base03'] . g:solarized_vars['bg_base02']
        exe "autocmd VimEnter,Colorscheme * :highlight! IndentGuidesEven" . g:solarized_vars['fmt_none'] . g:solarized_vars['fg_base03'] . g:solarized_vars['bg_base02']
      endif
    endif
  catch
    set background=dark
    colorscheme default
  endtry

  " minimum number of lines to scroll
  set scrolljump=1
  " minimum number of lines above and below cursor
  set scrolloff=10
  " minimum number of columns to left and right of cursor
  set sidescrolloff=5

  " mouse
  "set mouse&
  set mouse=a
  if !has('nvim')
    set ttymouse=xterm2
  endif

  " don't use spaces instead of tabs
  set expandtab
  " number of spaces per tab for display
  set tabstop=2
  " number of spaces per tab in insert mode
  set softtabstop=2
  " number of spaces when indenting
  set shiftwidth=2

"}}}

" Program "{{{
" ---------------------------------------------------------------------
" Program settings

  " cscopeprg
  if g:nvim_settings.use_local_bin != 0
    if g:nvim_settings.cscopeprg ==# 'gtags-cscope'
      set cscopeprg=~/local/bin/gtags-cscope
    elseif g:nvim_settings.cscopeprg ==# 'cscope'
      set cscopeprg=~/local/bin/cscope
    endif
  else
    if g:nvim_settings.cscopeprg ==# 'gtags-cscope'
      set cscopeprg=gtags-cscope
    elseif g:nvim_settings.cscopeprg ==# 'cscope'
      set cscopeprg=cscope
    endif
  endif

  " cscope
  if has("cscope")
    nmap ; [cscope]
    nnoremap [cscope] <nop>
    if g:nvim_settings.cscopeprg ==# 'gtags-cscope'
      " global
      " go to definition or reference
      nnoremap [cscope]g :GtagsCursor
      " go to definition
      nnoremap [cscope]d :Gtags -d <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>d <Esc>:execute 'Gtags ' . GetVisualSelection()
      " find reference
      nnoremap [cscope]r :Gtags -r <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>r <Esc>:execute 'Gtags -r ' . GetVisualSelection()
      " locate symbols which are not defined in `GTAGS`
      nnoremap [cscope]s :Gtags -s <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>s <Esc>:execute 'Gtags -s ' . GetVisualSelection()
      " locate strings
      nnoremap [cscope]e :Gtags -g <C-r>=expand("<cword>")<CR>
      "nnoremap [cscope]e :execute 'Gtags -g ' . expand('<cword>')
      "vnoremap <C-\>e <Esc>:execute 'Gtags -g ' . GetVisualSelection()
      " get a list of tags in specified files
      nnoremap [cscope]f :Gtags -f %
      "vnoremap <C-\>f <Esc>:execute 'Gtags -f ' . GetVisualSelection()
    elseif g:nvim_settings.cscopeprg ==# 'cscope'
      " cscope
      " 's' symbol: find all references to the token under cursor
      nnoremap [cscope]s :cscope find s <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>s <Esc>:execute 'cscope find s ' . GetVisualSelection()
      " 'g' global: find global definition(s) of the token under cursor
      nnoremap [cscope]g :cscope find g <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>g <Esc>:execute 'cscope find g ' . GetVisualSelection()
      " 'c' calls: find all calls to the function name under cursor
      nnoremap [cscope]c :cscope find c <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>c <Esc>:execute 'cscope find c ' . GetVisualSelection()
      " 't' text: find all instances of the text under cursor
      nnoremap [cscope]t :cscope find t <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>t <Esc>:execute 'cscope find t ' . GetVisualSelection()
      " 'e' egrep:  egrep search for the word under cursor
      nnoremap [cscope]e :cscope find e <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>e <Esc>:execute 'cscope find e ' . GetVisualSelection()
      " 'f' file: open the filename under cursor
      nnoremap [cscope]f :cscope find f <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>f <Esc>:execute 'cscope find f ' . GetVisualSelection()
      " 'd' called: find functions that function under cursor calls
      nnoremap [cscope]d :cscope find d <C-r>=expand("<cword>")<CR>
      "vnoremap <C-\>d <Esc>:execute 'cscope find d ' . GetVisualSelection()
      " 'i' includes: find files that include the filename under cursor
      nnoremap [cscope]i :cscope find i <C-r>=expand("<cfile>")<CR>
      "vnoremap <C-\>i <Esc>:execute 'cscope find i ' . GetVisualSelection()
      "nnoremap [cscope]i :execute 'cscope find i ' . expand('<cword>')
      "nnoremap [cscope]i :cscope find i ^<C-r>=expand("<cfile>")<CR>$
      "nnoremap [cscope]i :tab split<CR>:execute "cscope find i " . expand("<cword>")
      "nnoremap [cscope]i :tab split<CR>:execute "cscope find i ^" . expand("<cword>") . "$"
    endif
  endif

"}}}

" Grep, quickfix list and location list "{{{
" ---------------------------------------------------------------------
" Grep, quickfix list and location list settings

  " wildignore
  :set wildignore+=.git/**,.svn/**,core.*,cscope.*,*.tags,tags

  " vimgrep the selected text in current directory
  vnoremap <silent> fd :call VisualSelection('d')<CR>

  " vimgrep current word in current directory and put the cursor in the right position
  nnoremap <Leader>fd :vimgrep /\<<C-r>=expand("<cword>")<CR>\>/j **/*<Left><Left><Left><Left><Left><Left><Left><Left><Left>

  " vimgrep current word in current file
  nnoremap <Leader>ff :vimgrep /\<<C-r>=expand("<cword>")<CR>\>/j <C-R>%

  " search and replace the selected text
  vnoremap <Leader>fr :call VisualSelection('r')<CR>

  " search and replace current word
  nnoremap <Leader>fr :%s/\<<C-r>=expand("<cword>")<CR>\>/<C-r>=expand("<cword>")<CR>

  " toggle list
  nnoremap <silent> <Leader>q :call ListToggle("Quickfix List", 'c')<CR>
  nnoremap <silent> <Leader>l :call ListToggle("Location List", 'l')<CR>

" }}}

" Misc "{{{
" ---------------------------------------------------------------------
" Misc settings

  " maximize or restore current window in split structure
  noremap <C-w>O :call MaximizeToggle()<CR>
  noremap <C-w>o :call MaximizeToggle()<CR>
  noremap <C-w><C-o> :call MaximizeToggle()<CR>

  " increase the window size by a factor
  nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
  " decrease the window size by a factor
  nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 3/4)<CR>

  " toggle just text
  "echo exists(":SignifyToggle")
  "echo !empty(glob("vim-signify"))
  "echo exists("*sy#toggle")
  " <http://superuser.com/questions/552323/how-can-i-test-for-plugins-and-only-include-them-if-they-exist-in-vimrc>
  nnoremap <silent> <Leader>j :call JustTextToggle()<CR>:silent! SignifyToggle<CR>

  " repeatable copy and paste. fake the behavior in windows
  nnoremap <Leader>y "zyiw
  nnoremap <Leader>p viw"zp
  vnoremap <Leader>y "zy
  vnoremap <Leader>p "zp

  " remove the windows ^M when the encodings gets messed up
  noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" }}}

" Helper functions "{{{
" ---------------------------------------------------------------------
" Helper functions settings

  " maximize or restore current window in split structure
  " <http://vim.wikia.com/wiki/Maximize_window_and_return_to_previous_split_structure>
  function! MaximizeToggle()
    if exists("s:maximize_session")
      exec "source " . s:maximize_session
      call delete(s:maximize_session)
      unlet s:maximize_session
      let &hidden = s:maximize_hidden_save
      unlet s:maximize_hidden_save
    else
      let s:maximize_hidden_save = &hidden
      let s:maximize_session = tempname()
      set hidden
      exec "mksession! " . s:maximize_session
      only
    endif
  endfunction

  " toggle just text
  function! JustTextToggle()
    if !exists('b:just_text')
      let b:just_text = 0
    endif
    if b:just_text == 0
      setlocal paste
      setlocal nolist
      setlocal nonumber
      let b:just_text = 1
      echo 'Just text: on'
      sign unplace *
      return 0
    else
      setlocal nopaste
      setlocal list
      setlocal number
      let b:just_text = 0
      echo 'Just text: off'
      return 1
    endif
  endfunction

  " highlight all instances of word under cursor, when idle.
  " useful when studying strange source code.
  if has("autocmd")
    function! AutoHighlightToggle()
      let @/ = ''
      if exists('#auto_highlight')
        autocmd! auto_highlight
        augroup! auto_highlight
        setlocal updatetime=4000
        "echo 'Highlight current word: off'
        return 0
      else
        augroup auto_highlight
          autocmd!
          " 3match conflicts with airline
          autocmd CursorHold * silent! execute printf('2match WarningMsg /\<%s\>/', expand('<cword>'))
        augroup end
        setlocal updatetime=20
        "echo 'Highlight current word: on'
        return 1
      endif
    endfunction
  endif

  " auto highlight
  if has("autocmd")
    "nnoremap <Leader>h :if AutoHighlightToggle()<Bar>set hlsearch<Bar>endif<CR>
    nnoremap <Leader>h :call AutoHighlightToggle()<CR>
    call AutoHighlightToggle()
  endif

  function! CmdLine(str)
    execute "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
  endfunction

  function! GetVisualSelection()
    let [s:lnum1, s:col1] = getpos("'<")[1:2]
    let [s:lnum2, s:col2] = getpos("'>")[1:2]
    let s:lines = getline(s:lnum1, s:lnum2)
    let s:lines[-1] = s:lines[-1][: s:col2 - (&selection == 'inclusive' ? 1 : 2)]
    let s:lines[0] = s:lines[0][s:col1 - 1:]
    return join(s:lines, ' ')
  endfunction

  function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction ==# 'b'
      execute "normal ?" . l:pattern . "^M"
    elseif a:direction ==# 'f'
      execute "normal /" . l:pattern . "^M"
    elseif a:direction ==# 'd'
      call CmdLine("vimgrep " . '/' . l:pattern . '/j' . ' **/*.')
    elseif a:direction ==# 'r'
      call CmdLine("%s" . '/' . l:pattern . '/' . l:pattern)
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
  endfunction

  " toggle quickfix list and location list
  function! GetBufferList()
    redir =>buflist
    silent! ls
    redir END
    return buflist
  endfunction

  function! ListToggle(bufname, pfx)
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "' . a:bufname . '"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
      if bufwinnr(bufnum) != -1
        execute a:pfx . 'close'
        return
      endif
    endfor
    if a:pfx ==# 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
    endif
    let winnr = winnr()
    execute a:pfx . 'window'
    if winnr() != winnr
      wincmd p
    endif
  endfunction

  function! s:BufInfo()
    echo "\n----- buffer info -----"
    echo "bufnr('%')=" . bufnr('%') . " // current buffer number"
    echo "bufnr('$')=" . bufnr('$') . " // tail buffer number"
    echo "bufnr('#')=" . bufnr('#') . " // previous buffer number"
    for i in range(1, bufnr('$'))
      echo "bufexists(" . i . ")=" . bufexists(i)
      echon " buflisted(" . i . ")=" . buflisted(i)
      echon " bufloaded(" . i . ")=" . bufloaded(i)
      echon " bufname(" . i . ")=" . bufname(i)
    endfor
    echo "// bufexists(n)= buffer n exists"
    echo "// buflisted(n)= buffer n listed"
    echo "// bufloaded(n)= buffer n loaded"
    echo "// bufname(n)= buffer name"

    echo "\n----- window info -----"
    echo "winnr()="    . winnr()    . " // current window number"
    echo "winnr('$')=" . winnr('$') . " // tail window number"
    echo "winnr('#')=" . winnr('#') . " // previous window number"
    for i in range(1, winnr('$'))
      echo "winbufnr(" . i . ")=" . winbufnr(i) . " // window " . i . "'s buffer number"
    endfor

    echo "\n----- tab info -----"
    echo "tabpagenr()="    . tabpagenr()    . ' // current tab number'
    echo "tabpagenr('$')=" . tabpagenr('$') . ' // tail tab number'
    for i in range(1, tabpagenr('$'))
      echo 'tabpagebuflist(' . i . ')='
      echon tabpagebuflist(i)
      echon " // tab " . i . "'s buffer list"
    endfor
    for i in range(1, tabpagenr('$'))
      echo "tabpagewinnr(" . i . ")=" . tabpagewinnr(i)
      echon " tabpagewinnr(" . i . ", '$')=" . tabpagewinnr(i, '$')
      echon " tabpagewinnr(" . i . ", '#')=" . tabpagewinnr(i, '#')
    endfor
    echo "// tabpagewinnr(n)     = tab n's current window number"
    echo "// tabpagewinnr(n, '$')= tab n's tail window number"
    echo "// tabpagewinnr(n, '#')= tab n's previous window number"

  endfunction
  command! -nargs=0 BufInfo call s:BufInfo()

  function! s:Indent4Space()
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
  endfunction

  function! s:Indent2Space()
    set expandtab
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
  endfunction

  function! s:Indent4Tab()
    set noexpandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
  endfunction

  function! s:Indent2Tab()
    set noexpandtab
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
  endfunction

  command! -nargs=0 Indent4Space call s:Indent4Space()
  command! -nargs=0 Indent2Space call s:Indent2Space()
  command! -nargs=0 Indent4Tab call s:Indent4Tab()
  command! -nargs=0 Indent2Tab call s:Indent2Tab()

" }}}

" vimrc.after "{{{
" ---------------------------------------------------------------------
" vimrc.after

  if filereadable('vimrc.after')
    source vimrc.after
  endif

" }}}


" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

