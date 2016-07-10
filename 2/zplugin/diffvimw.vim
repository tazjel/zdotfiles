
WWshell find . -type f -iname "*vim" -exec egrep "" {} \;
execute "norm \<C-w>c"_
call Zwindows()
execute "normal! [c"
diffu
execute "normal! ]c"
Shell find ~ /.vim -type f -iname "*\vim" -exec grep -HnEi "wincmd" {} \;  
W find ~ /.vim -type f -iname "*\vim" -exec grep -HnEi "wincmd" {} \;  
set filetype=sh | syntax on | wincmd o
let @a=''|g/diff /y A |:let @*=@a 
wincmd o
wincmd w
let @f=''|g/fun /y F |:let @*=@f 
vsplit ~/.vim/skel/tmpl.%:e 
vsplit Dropbox/
vsplit capture.vim
vsp /home/bani/zdotfiles/2/zplugin/        "# ww templates.vim 
v/^[<|=>]{7}( .*|$)//g
set filetype=bash
set filetype=py
set encoding=utf8
set cursorline
set cursorcolumn
