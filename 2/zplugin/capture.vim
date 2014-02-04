
ext = expand('%:t')
let wext = expand('%:e')
exelet path = expand('%:p:h')c "norm ciw" . cur_word . ""
let ext = '.'.expand('%:e')

let cur_word = expand("<cword>")
let i = 1
let i = i + 1
" save and quit
map ,z ZZ
" yank from current line to the EOF
map ,yy "+yG
" paste from clipboard
map ,p "+p
" do substitution globally
map ,s :%s/
" do substitution in current line
map zs :s/
map <C-H> <C-w>h
map <C-L> <C-w>l
" tabs operations
map tn :tabNext<CR>
map tp :tabprevious<CR>
map tc :tabclose<CR>
map tm :tabmove<CR>
map tf :tabfirst<CR>
map tl :tablast<CR>
"map gf :tabnew <cfile><cr>
