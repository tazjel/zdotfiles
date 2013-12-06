map <F3> :ls<CR>:sb
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
map <F3> :ls<CR>:sball
map <M-Left> :bprevious<CR>
map <M-Up> <C-W>j<C-W>_
    map <S-F11> y:vsplit ~/Dropbox/INTRODUCTION/terms.txt<CR>
map <S-F7> :%s/<C-r><C-w>//gc<Left><Left><Left>
map <S-Up> <C-W>_
    map <Tab> >>
map <Tab> <<
map <c-a> ggVG
map <silent> <F10>  :call InsertCmd( 'hostname' )<CR>
cabbrev w|source %
map س  V:w!   >> ~/Dropbox/CAR_system<CR>
nmap ,, :e.<CR>
nmap <Space><Right> *
nmap <f8> :diffthis<cr><esc><c-w><c-w>:diffthis<cr
nnoremap 8 zMzvzz
nnoremap 9 zM
nnoremap ; :q!<CR>
nnoremap <C-F5> :vsplit ~/zdotfiles/1/.zsh/al.zsh<CR>
nnoremap <C-F6> :vsplit ~/zdotfiles/6/
nnoremap <C-F9> :SessionSaveAs
"nnoremap <C-Up> m`o<Esc>``

nnoremap <C-Up> <Esc>u
nnoremap <C-Down> <C-R>
nmap <silent>  wn :call ToggleSyntax()<CR>
nnoremap <CR> :
nnoremap <F2> :reg<CR>
nnoremap <F4> :verbos map<Space>
nnoremap <M-F9> :sessionopen
nnoremap <S-F2> :marks <CR>
nnoremap <S-F4>  :let @a=""\|:let @a=colors_name\|:let @"=@a<CR>\|:echo @"<CR>
nnoremap <silent> <C-S-F5> :vsplit ~/zdotfiles/2/vimrc.txt<CR>
nnoremap <silent> <C-S-F5> :vsplit ~/zdotfiles/2/vimrc.txt<CR>
nnoremap <silent> <F5> :source ~/zdotfiles/2/.vimrc.local<CR>\|:echo colors_name<CR>
nnoremap <silent> <F5> :source ~/zdotfiles/2/.vimrc.local<CR>\|:echo colors_name<CR>
nnoremap <silent> <F5> :source ~/zdotfiles/2/.vimrc.local<CR>\|:echo colors_name<CR>
nnoremap <silent> <F9> :SessionList<CR>
nnoremap <silent> <S-F5> :vsplit ~/zdotfiles/2/.vimrc.local<CR>
nnoremap <silent> <S-F5> :vsplit ~/zdotfiles/2/.vimrc.local<CR>
nnoremap <silent> <S-F9> :SessionSave<CR>
nnoremap <silent> w1 :vsplit ~/zdotfiles/1/.zsh/al.zsh<cr>
nnoremap <space> za
"
"nnoremap xw :%s/<[^>]*>//gi<cr><CR>

vmap ,w  ddGop
"
"vnoremap <f7> :s/xxx/\$\{1\:#\}/g
