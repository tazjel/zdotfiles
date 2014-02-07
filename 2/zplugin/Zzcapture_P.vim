
fun!Zvim_capture()
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
