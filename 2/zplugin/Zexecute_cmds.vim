function Zsplit(a:zfile)
    sb a:zfile | wincmd L
endfunction


"w
"
function!Wadd()
    exe 'normal "+y'
    let a:zstr .= @"
endfunction

function!Wviw()
    wincmd n | wincmd L
    execute 'normal! o' "#_____________#"
    execute 'normal! o' "reg = "
    execute '0r ~/word.txt'
    execute 'normal! i' .a:zstr
    wincmd w
    redraw!
endfunction

    "vsplit %.wreg
"windows
nmap <space><Down> :exec "normal Go"<CR>
nmap <space><space> `
function! Zwin()
    wincmd n | wincmd L
    wincmd w
    syntax on
    set cursorcolumn
endfunction


function! Zcopy()
    let xx = @+
    exe ':!echo ' . xx ' >> ~/word.txt'
    exe ':!cat ' . xx ' >> ~/word.txt'
endf



function! Zpy()
python3 << EOF
import sys
import string
import vim
print("Y")
EOF
endfunction

function! Zif_has_py()
    if has('python')
      echo 'there is Python 2.x'
    elseif has('python3')
      echo 'there is Python 3.x'
    endif
endfunction



"w"

map ,l :call LoadTemplate()

function! Zcapture(zstr)
    vertical topleft 25vnew
    let output = system('find ~ -type f -iname \"*\vim\" -exec grep -Ei' \"". zstr . \"' . ' {} \; ')
    set filetype=vim | syntax on | set syntax=vim | wincmd o
    "%y new '<,'>sort u '<,'>left set winfixwidth
endfunction

        fun!Zfind_vim()
        botright new
        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=vim
        setlocal syntax=vim
            "let cmdline = ""
            let filename = input("Enter file name to find: ")
            let keyword = input("Enter keyword to find: ")
            let cmdline = 'find ~ -type f'
            let cmdline .= ' -iname '
            let cmdline .= '"'
            let cmdline .= '*'
            let cmdline .= filename
            let cmdline .= '"'
            let cmdline .= ' -exec egrep -o '
            let cmdline .= '"'
            let cmdline .= keyword
            let cmdline .= '"'
            let cmdline .= ' {} \;'
            let ztop = 'egrep -o'
            let ztop .= '"'
            let ztop .= keyword
            let ztop .= '"'
            execute 'silent $read !' . cmdline

            set filetype=vim
            set syntax on
            set syntax=vim
            wincmd o
            call setline(1, cmdline)
            call setline(2, substitute(cmdline, '.', '=', 'g'))
            "let $error_file = $HOME ."/.findfile.output"
            "wincmd n | wincmd L
            redraw!
            let @a=''
            g/. keyword . /y A
            let @+=@a
            vertical topleft 25vnew
            call setline(1, ztop)
            call setline(2, substitute(ztop, '.', '=', 'g'))
            redraw!
            set syntax on
            set syntax=vim
            wincmd w
            0
        endfun

            "let zoutput = system('find ~ -type f -iname "*\.vim" .' -exec egerp \"" .keyword \" ' "{} \;" )
 ". ' -exec egerp ' . \"". $keyword . \" . ' {} \; '
    "vert botright vnew
    "

"vertical topleft 25vnew
"execute 'let i= 0 | while i < 5 | let @+=i | put | let i = i + 1 | endwhile'
"
            "execute 'silent $read !' . cmdline
            "
            "
            "
"let results = 'find ~ -type f -iname "*\.vim" | -exec egerp ' " . keyword . \" ' "{} \;" )
"let'find ~ -type f -iname "*\.vim" | -exec egerp ' " . keyword . \" ' "{} \;" )
"let zoutput = system('find ~ -type f -iname "*\.vim" | -exec egerp ' " . keyword . \" ' "{} \;" )
 ". ' -exec egerp ' . \"". $keyword . \" . ' {} \; '
"vert botright vnew "vertical topleft 25vnew
"execute 'let i= 0 | while i < 5 | let @+=i | put | let i = i + 1 | endwhile'
"/home/bani/zdotfiles/2/zplugin/Zzcapture_P.vim
"set ft=vim | syntax on | wincmd o
"call Zsplit("~/.vimrc.local")
