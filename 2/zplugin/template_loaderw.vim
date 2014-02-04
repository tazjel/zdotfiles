if has("autocmd")

"if !exists('*LoadTemplate')
"function LoadTemplate(file)
"" Add skeleton fillings for Python (normal and unittest) files
"if a:file =~ 'test_.*\.py$'
"execute "0r ~/.vim/skeleton/test_template.py"
"elseif a:file =~ '.*\.py$'
"execute "0r ~/.vim/skeleton/template.py"
"endif
"endfunction
"endif

"autocmd BufNewFile * call LoadTemplate(@%)

endif " has("autocmd")

if has("gui_running")
"set guifont=saxMono:h14 linespace=3
"set guifont=Anonymous\ for\ Powerline:h12 linespace=2
"set guifont=Mensch\ for\ Powerline:h14 linespace=0
"set guifont=Droid\ Sans\ Mono:h14 linespace=0
"set guifont=Ubuntu\ Mono:h18 linespace=3
    set guifont=Source\ Code\ Pro\ Light:h14 linespace=0

"colorscheme molokai
"colorscheme railscat
"colorscheme kellys
"colorscheme wombat256
"colorscheme mustang
"colorscheme mustang_silent
    colorscheme badwolf

" Remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
else
    set bg=dark

"colorscheme mustang_silent
"colorscheme molokai
"colorscheme railscat
"colorscheme kellys
"colorscheme molokai_deep
"colorscheme wombat256
"colorscheme mustang
"colorscheme mustang_silent
    colorscheme badwolf
endif
