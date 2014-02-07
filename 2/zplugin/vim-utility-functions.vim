func!ZPL(str) " Print string into the current buffer
  exe "normal o" . a:str
endf

func!ZNL()
    exe "normal o"
endf

func!ZPrint(str) " Print string into the current buffer
    exe "normal i" . a:str
endf

func!ZP(str) " Print string into the current buffer
    call Print(a:str)
endf

func!ZSelectAll() " Select all of current buffer
    exe "normal ggVG"
endf

func!ZSA() " Select all of current buffer
    call SelectAll()
endf

func!ZSelectLine() " Select current line
    exe "normal V"
endf

func!ZSL() " Select current line
    call SelectLine()
endf

func!ZCopy() " Copy current selection to clipboard
    exe 'normal "+y'
endf

func!ZCP() " Copy current selection to clipboard
    call Copy()
endf

func!ZCopyAll() " Copy current buffer contents to clipboard
    call SelectAll()
    call Copy()
endf

func!ZCPA() " Copy current buffer contents to clipboard
    call CopyAll()
endf

func!ZCopyLine() " Copy a single line
    call SelectLine()
    call Copy()
endf

func!ZCPL() " Copy a single line
    call CopyLine()
endf

func!ZCut() " Cut current buffer contents to clipboard
    call CopyAll()
    %d
endf

func!ZS2C(str) " Put string on clipboard
    %d
    call P(a:str)
    call Cut()
endf

func!Zdisplay()
    let Z_a=@a
    let Z_A="Reg a ="
    let Z_x=@x
    let Z_X="Reg x =" .Z_x
    exe 'normal o' .Z_X
    syntax on
    set filetype=vim
    set syntax=vim
endf

