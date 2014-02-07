function! Zget_line()
    let i = input("Hit Enter to continue")
    let pos = [line('.'), col('.')]
    let zsaved_register = @@
    let a:zline = getline('.')
    exe "normal o" . a:zline
endfunction
nnoremap wl :call Zget_line()<R>

cabbrev W # | so %
