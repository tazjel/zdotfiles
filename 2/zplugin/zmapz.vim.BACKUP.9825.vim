<<<<<<< HEAD
""""""
nnoremap <C-Up> m`o<Esc>``
""""""""""""""""""""""""""

cabbrev w|source %

=======


"
"nnoremap <Space>w :let @B="" \|let @B=\<C-R>=expand("<cword>")<CR>
>>>>>>> xubuntu2013
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <Esc><C-b> <S-Left>
imap <C-s> <C-o>:w<CR>
imap <F1> <Esc><F1>
imap <silent> <F10> <Esc>:call InsertCmd( zwz )<CR><Insert>
map <F11> y:vsplit ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_w.snip<CR>
map <F11> y<C-W>n<C-W>Lp:w ~/.vim/bundle/neosnippet/autoload/neosnippet/snippets/_ak.snip
map <F1> <plug>NERDCommenterToggle
map <F3> :ls<CR>:sb
map <F3> :ls<CR>:sball
map <M-Left> :bprevious<CR>
map <M-Up> <C-W>j<C-W>_
map <S-F7> :%s/<C-r><C-w>//gc<Left><Left><Left>
map <c-a> ggVG
map <silent> <F10>  :call InsertCmd( 'hostname' )<CR>
<<<<<<< HEAD:2/zplugin/zmapz.vim
nmap ,, :e.<CR>
nmap <Space><Right> *
=======
>>>>>>> 5672702670de75bfdb940e430b813f3b5b680e70:2/zplugin/zmapz.vim
nmap <f8> :diffthis<cr><esc><c-w><c-w>:diffthis<cr
nmap <silent>  wn :call ToggleSyntax()<CR>
nnoremap 8 zMzvzz
nnoremap 9 zM
nnoremap ; :q!<CR>
nnoremap <C-Down> <C-R>
nnoremap <C-F5> :vsplit ~/zdotfiles/1/.zsh/al.zsh<CR>
nnoremap <C-F6> :vsplit ~/zdotfiles/6/
nnoremap <C-F9> :SessionSaveAs
nnoremap <C-Up> <Esc>u
nnoremap <C-Up> m`o<Esc>``
nnoremap <CR> :
nnoremap <F2> :reg<CR>
nnoremap <F4> :verbos map<Space>
nnoremap <M-F9> :sessionopen
nnoremap <S-F2> :marks <CR>
nnoremap <S-F4>  :let @a=""\|:let @a=colors_name\|:let @"=@a<CR>\|:echo @"<CR>
nnoremap <silent> <C-S-F5> :vsplit ~/zdotfiles/2/vimrc.txt<CR>
nnoremap <silent> <F5> :source ~/zdotfiles/2/.vimrc.local<CR>\|:echo colors_name<CR>
nnoremap <silent> <F9> :SessionList<CR>
nnoremap <silent> <S-F5> :vsplit ~/zdotfiles/2/.vimrc.local<CR>
nnoremap <silent> <S-F9> :SessionSave<CR>
nnoremap <silent> <S-F9> :SessionSave<CR>
t ~/zdotfiles/2/.vimrc.local<CR>
