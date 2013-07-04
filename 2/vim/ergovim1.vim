" === ErgoVim key mappings ===

" Version 1.
"
" http://www.hxa.name/articles/content/ergovim-key-mappings_hxa7241_2010.html


" --- normal mode ---

" leave unchanged: ! and !!

" --- tab and pane ---
noremap @ :tabe<CR>
noremap # <C-w>gf
noremap £ <C-w>gf
noremap $ <C-w>n
noremap % <C-w>f
noremap ^ <C-w>o
noremap & <C-w><S-w>
noremap * <C-w><C-w>

" leave unchanged: (
" leave unchanged: )
noremap 0 <Nop>
noremap - <C-o>
noremap _ <C-i>
" leave unchanged: =
noremap + <Nop>

" --- edit ---
noremap q .
noremap <S-q> @:
noremap <C-q> <Nop>
noremap w ~
noremap <S-w> g~
" leave unchanged: <C-w>
noremap e >>
noremap <S-e> <<
noremap <C-e> <Nop>
noremap r daw
noremap <S-r> ciw
noremap <C-r> "_daw
noremap t x
noremap <S-t> r
noremap <C-t> <Nop>

noremap a v
noremap <S-a> <S-v>
noremap <C-a> <C-v>
noremap s g^i
noremap <S-s> <S-o>
noremap <C-s> <S-o><Esc>
noremap d g$a
noremap <S-d> o
noremap <C-d> o<Esc>
noremap f i
noremap <S-f> a
noremap <C-f> <S-r>
" leave unchanged: g
noremap <S-g> <Nop>
noremap <C-g> <Nop>

noremap z u
noremap <S-z> <C-r>
noremap <C-z> <Nop>
noremap x d
noremap <S-x> c
noremap <C-x> "_d
noremap c y
noremap <S-c> <Nop>
" leave unchanged: <C-c>
noremap v <S-p>
noremap <S-v> p
noremap <C-v> <Nop>

noremap xx dd
noremap <S-x><S-x> cc
noremap <C-x><C-x> "_dd
noremap cc yy

onoremap d i
onoremap f a

" --- move ---
noremap y %
noremap <S-y> `.
noremap <C-y> <Bar>
noremap u <S-b>
noremap <S-u> b
noremap <C-u> gE
noremap i gk
noremap <S-i> <C-b>
noremap <C-i> <C-y>
noremap o <S-w>
noremap <S-o> w
noremap <C-o> <S-e>
noremap p g$
noremap <S-p> g$
noremap <C-p> $
" leave unchanged: [
" leave unchanged: {
" leave unchanged: ]
" leave unchanged: }

noremap h g^
noremap <S-h> g0
noremap <C-h> ^
noremap j h
noremap <S-j> <S-h>
noremap <C-j> gg
noremap k gj
noremap <S-k> <C-f>
noremap <C-k> <C-e>
" leave unchanged: l
" leave unchanged: <S-l>
noremap <C-l> <S-g>

" leave unchanged: :
noremap ; :
noremap ' "
" leave unchanged: "
" leave unchanged: \
noremap <Bar> <Nop>

" --- search ---
" leave unchanged: n
" leave unchanged: <S-n>
noremap <C-n> :nohlsearch<CR>
noremap m f
noremap <S-m> <S-f>
noremap <C-m> ;

noremap , g*
noremap < g#
noremap << <Nop>
noremap . *
noremap > #
noremap >> <Nop>
" leave unchanged: /
" leave unchanged: ?

" --- record ---
noremap ~ q
noremap ` @
noremap `` @@

" --- mark ---
noremap <S-Space> m
noremap <C-Space> m`
noremap <Space> `
noremap <Space><Space> ``

" --- special keys ---
noremap <BS> "_<S-x>
noremap <S-BS> "_db
noremap <Del> "_x
noremap <S-Del> "_de

noremap <Home> g0
noremap <S-Home> <Home>
" leave unchanged: <C-Home>
noremap <End> g$
noremap <S-End> <End>
" leave unchanged: <C-End>

" leave unchanged: <PageUp>
noremap <S-PageUp> <S-h>
" leave unchanged: <C-PageUp>
" leave unchanged: <PageDown>
noremap <S-PageDown> <S-l>
" leave unchanged: <C-PageDown>

noremap <Up> gk
noremap <S-Up> <Up>
noremap <C-Up> <C-y>
noremap <Down> gj
noremap <S-Down> <Down>
noremap <C-Down> <C-e>
" leave unchanged: <Left>
" leave unchanged: <S-Left>
noremap <C-Left> <S-b>
" leave unchanged: <Right>
" leave unchanged: <S-Right>
noremap <C-Right> <S-w>

" --- g prefixeds ---
noremap gm gd
noremap g<S-m> gD
noremap gj <S-j>
" leave unchanged: g<S-j>
noremap g: q:
noremap g/ q/

" --- other ---
noremap b z
noremap <S-b> <Nop>
noremap <C-b> <Nop>
noremap <D-P> <Nop>
noremap <F2> :set ro! <Bar> :setl noma!<CR>
noremap <F3> :set list!<CR>
noremap <F4> :set ff=unix<CR>
noremap <F5> :set ff=dos<CR>


" --- visual mode ---

" leave unchanged: !
" leave unchanged: =

vnoremap q <Nop>
vnoremap <S-q> <Nop>
vnoremap <C-q> <Nop>
" inherit: w
vnoremap <S-w> <Nop>
" inherit: <C-w>
vnoremap e >
vnoremap <S-e> <
vnoremap <C-e> <Nop>
vnoremap r <Nop>
vnoremap <S-r> <Nop>
vnoremap <C-r> <Nop>
vnoremap t <Nop>
vnoremap <S-t> <Nop>
" inherit: <C-t>

" leave unchanged: a
" leave unchanged: <S-a>
" leave unchanged: <C-a>
vnoremap s <Nop>
vnoremap <S-s> I
vnoremap <C-s> A
vnoremap d i
vnoremap <S-d> <Nop>
vnoremap <C-d> <Nop>
vnoremap f a
vnoremap <S-f> <Nop>
vnoremap <C-f> <Nop>
" inherit: g
vnoremap <S-g> <Nop>
vnoremap <C-g> <Nop>

vnoremap z <Nop>
vnoremap <S-z> <Nop>
vnoremap <C-z> <Nop>
" inherit: x
" inherit: <S-x>
" inherit: <C-x>
" inherit: c
vnoremap <S-c> <Nop>
" inherit: <C-c>
vnoremap v <Esc>pgv"_d
vnoremap <S-v> <S-p>
vnoremap <C-v> <Nop>

vunmap xx
vunmap <S-x><S-x>
vunmap <C-x><C-x>
vunmap cc

" leave unchanged: :
vnoremap ; v_:

vnoremap / y/<C-R>"<CR>
vnoremap ? y?<C-R>"<CR>

vnoremap " o
vnoremap <Bar> <S-o>

vnoremap ~ <Nop>
vnoremap ` <Nop>
vunmap ``

vnoremap <S-Del> v_<Del>

" leave unchanged: gq
" leave unchanged: gv
" inherit: gj
" inherit: g shft-j


" --- insert mode ---

" --- edit
" leave unchanged: <C-@>
inoremap <C-q> <C-a>
inoremap <C-w> <Esc>~a
" leave unchanged: <C-e>
inoremap <C-r> <C-y>
inoremap <C-t> <Nop>
inoremap <C-a> <C-]>
" leave unchanged: <C-s>
inoremap <C-d> <C-n>
inoremap <C-f> <C-o>
" leave unchanged: <C-g>
inoremap <C-z> <C-u>
inoremap <C-x> <Nop>
inoremap <C-c> <Nop>
inoremap <C-v> <C-r>
" leave unchanged: <C-[>
inoremap <C-]> <C-c>

" --- move, etc.
inoremap <C-_> <Esc><C-o>a
inoremap <C-y> <Esc>`.a
inoremap <C-b> <C-g>u
inoremap <C-CR> <C-x>

" --- other
inoremap <C-u> <Nop>
" leave unchanged: <C-i> -- fixed to <Tab>
inoremap <C-o> <Nop>
inoremap <C-p> <Nop>
inoremap <C-h> <Nop>
inoremap <C-n> <Nop>
" leave unchanged: <C-m> -- fixed to <CR>
" leave unchanged: <C-\>
" leave unchanged: <C-^>

" --- special keys
" leave unchanged <BS>
inoremap <S-BS> <C-w>
" leave unchanged <Del>
inoremap <S-Del> <Esc>l"_dei

inoremap <Home> <Esc>g^a
inoremap <S-Home> <Home>
" leave unchanged <C-Home>
inoremap <End> <Esc>g$i
inoremap <S-End> <End>
" leave unchanged <C-End>

" leave unchanged <PageUp>
inoremap <S-PageUp> <Esc><S-h>a
" leave unchanged <C-PageUp>
" leave unchanged <PageDown>
inoremap <S-PageDown> <Esc><S-l>a
" leave unchanged <C-PageDown>

inoremap <Up> <Esc>gka
inoremap <S-Up> <Up>
inoremap <C-Up> <Esc><C-y>a
inoremap <Down> <Esc>gja
inoremap <S-Down> <Down>
inoremap <C-Down> <Esc><C-e>a
" leave unchanged <Left>
" leave unchanged <S-Left>
inoremap <C-Left> <Esc><S-b>i
" leave unchanged <Right>
" leave unchanged <S-Right>
inoremap <C-Right> <Esc><S-w>a

" --- make UK keyboard more USA
inoremap £ #
inoremap § `
inoremap ± ~


" --- command-line mode ---

" --- pattern complete
cnoremap <C-q> <C-l>
cnoremap <C-w> <C-a>
cnoremap <C-e> <C-n>
cnoremap <C-r> <C-p>
"cunmap <C-r><C-r>
cnoremap <C-t> <C-d>

" --- other
cnoremap <C-o> <C-v>

cnoremap <C-a> <C-]>

cnoremap <C-v> <C-r>
cnoremap <C-v><C-v> <C-r><C-r>

cnoremap <C-h> <C-f>

cnoremap <S-BS> <C-w>

cnoremap £ #

command -nargs=+ -bang -bar -complete=file Tabview tabe | view <args> | setl noma
