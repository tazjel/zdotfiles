autocmd bufenter *.tex map <F1> :!latex %<CR>
autocmd bufenter *.tex map <F2> :!xdvi -hush %<.dvi&<CR>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <Esc><C-b> <S-Left>
cnoremap <Esc><C-f> <S-Right>
imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>ka
imap <C-s> <C-o>:w<CR>
imap <F1> <Esc><F1>
imap <F7> <C-X><C-l>
imap <c-z> <c-o>u
imap <expr><TAB> pumvisible() ? "\<C-n>" :
imap <expr><space> !pumvisible() ? "\<space>" :
imap <silent> <F10> <Esc>:call InsertCmd( 'grep -RI "w"' )<CR><Insert>
imap <silent> <F10> <Esc>:call InsertCmd( zwz )<CR><Insert>
inoremap ,d :call Spell_next_word()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
map ,, :call SaveLine()
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,h :sp <C-R>=expand("%:p:h") . "/" <CR>
map ,l :call LoadTemplate()
map ,l :call SaveLine()
map ,v :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <C-s> :w<CR>
map <F11> :w! >> ~/Dropbox/INTRODUCTION/terms.txt<CR>
map <F11> y:vsplit ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_w.snip<CR>
map <F11> y<C-W>n<C-W>Lp:w ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_ak.snip
map <F1> :nohlsearch<CR>\|:.s/^/"/<CR>\|:nohlsearch<CR>
map <F1> <plug>NERDCommenterToggle
map <F3> :ls<CR>:sb
map <F3> :ls<CR>:sball
map <F7> :%s///gc<Left><Left><Left><Left>
map <F7> :let @a=''\|g/ /y A \|:let @*=@a <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
map <F8> :TagbarToggle<CR>
map <M-Down> <C-W>k<C-W>_
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>
map <M-Up> <C-W>j<C-W>_
map <S-F11> y:vsplit ~/Dropbox/INTRODUCTION/terms.txt<CR>
map <S-F1> :.s/^\(^.*\)"//<CR>\|:nohlsearch<CR>
map <S-F7> :%s/<C-r><C-w>//gc<Left><Left><Left>
map <S-F8> :diffthis<cr><esc><c-w><c-w>:diffthis<cr>
map <S-Up> <C-W>_
map <Tab> >>
map <c-a> ggVG
map <f8><f8> :diffoff<cr>
map <s-tab> <<
map <silent> 2 :diffget 2<CR>:diffupdate<CR>
map <silent> 3 :diffget 3<CR>:diffupdate<CR>
map <silent> 4 :diffget 4<CR>:diffupdate<CR>
map <silent> <F10>  :call InsertCmd( 'hostname' )<CR>
map <silent> <F10> [c
map <silent> <F11> ]c
map <silent> <F12> :w<CR>:diffupdate<CR>
map W :NeoSnippetEdit -vertical<CR>
map wh :!rm ~/tst/vhtml<CR>:r!unhtml % > ~/tst/vhtml<CR><Esc>:vsplit ~/tst/vhtml<CR>
map wh :!rm ~/tst/vhtml<cr>:r!unhtml % > ~/tst/vhtml<cr><esc>:vsplit ~/tst/vhtml<cr>
map ws :!rm ~/.vimswap/*<cr>
map س  V:w!   >> ~/Dropbox/CAR_system<CR>
map ن n
maped to the [1-10]
nmap ,, :e.<CR>
nmap <S-Tab>  W_
nmap <S-Tab> :tabprevious<CR>
nmap <Space><Left> %
nmap <Space><Right> *
nmap <Tab> _
nmap <f8> :diffthis<cr><esc><c-w><c-w>:diffthis<cr
nmap <silent>  wn :call ToggleSyntax()<CR>
nmap sc 0i# <ESC>
nmap su :s/^# //<CR>
nnoremap ,d :call Spell_new_word()
nnoremap ,w  ddGop
nnoremap 0 zR
nnoremap 8 zMzvzz
nnoremap 9 zM
nnoremap ; :q!<CR>
nnoremap <C-Down> <C-R>
nnoremap <C-Down> m`O<Esc>``
nnoremap <C-F10> call setqflist([]) | :bufdo grepadd! w %
nnoremap <C-F5> :vsplit ~/zdotfiles/1/.zsh/al.zsh<CR>
nnoremap <C-F6> :vsplit ~/zdotfiles/6/
nnoremap <C-F9> :SessionSaveAs
nnoremap <C-Left> :call RangerChooser()<CR>
nnoremap <C-Up> <Esc>u
nnoremap <C-Up> m`o<Esc>``
nnoremap <CR> :
nnoremap <F2> :let @*=expand("%:p")<cr> :unix
nnoremap <F2> :reg<CR>
nnoremap <F4> :verbos map<Space>
nnoremap <M-F9> :sessionopen
nnoremap <S-F2> :marks <CR>
nnoremap <S-F4>  :let @a=""\|:let @a=colors_name\|:let @"=@a<CR>\|:echo @"<CR>
nnoremap <S-F6> :vsp ~/zdotfiles/6/
nnoremap <Space><CR> :nohlsearch<CR><CR>
nnoremap <Space>w :let @B="" \|let @B=\<C-R>=expand("<cword>")
nnoremap <Space>w :let @B="" \|let @B=\<C-R>=expand("<cword>")<CR>
nnoremap <silent>  <Space><Space> :nohlsearch<Bar>:echo<CR>
nnoremap <silent> ; :q!<CR>
nnoremap <silent> <C-S-F5> :vsplit ~/zdotfiles/2/vimrc.txt<CR>
nnoremap <silent> <F5> :source ~/zdotfiles/2/.vimrc.local<CR>\|:echo colors_name<CR>
nnoremap <silent> <F9> :SessionList<CR>
nnoremap <silent> <S-F5> :vsplit ~/zdotfiles/2/.vimrc.local<CR>
nnoremap <silent> <S-F9> :SessionSave<CR>
nnoremap <silent> w1 :vsplit ~/zdotfiles/1/.zsh/al.zsh<cr>
nnoremap <silent> w2 :vsplit ~/zdotfiles/2/.vimrc.localw<cr>
nnoremap <silent> wF :%s/\(.*\)\(conflict\)\(.*\)/\1\2\31/gc
nnoremap <space> za
nnoremap K i<cr><esc><right>
nnoremap W :echo colors_name<CR>
nnoremap WW <ESC><F5>:echo colors_name<CR>
nnoremap wl :call Zget_line()<CR>
nnoremap ww <F5>
nnoremap ww Y
nnoremap xw :%s/<[^>]*>//gi<cr><CR>
noremap <CR> :
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
vmap <silent> sc :s/^/# /<CR>:silent noh<CR>
vmap <silent> su :s/^# //<CR>:silent noh<CR>
vnoremap <F6> :w! >> ~/zdotfiles/6/
vnoremap <f7> :s/xxx/\$\{1\:#\}/g
vnoremap <space> zf
vnoremap ` :normal @q<CR>
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>
