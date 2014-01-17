func! PL(str) " Print string into the current buffer
  exe "normal o" . a:str
endf

func! NL()
	exe "normal o"
endf

func! Print(str) " Print string into the current buffer
	exe "normal i" . a:str
endf

func! P(str) " Print string into the current buffer
	call Print(a:str)
endf

func! SelectAll() " Select all of current buffer
	exe "normal ggVG"
endf

func! SA() " Select all of current buffer
	call SelectAll()
endf

func! SelectLine() " Select current line
	exe "normal V"
endf

func! SL() " Select current line
	call SelectLine()
endf

func! Copy() " Copy current selection to clipboard
	exe 'normal "+y'
endf

func! CP() " Copy current selection to clipboard
	call Copy()
endf

func! CopyAll() " Copy current buffer contents to clipboard
	call SelectAll()
	call Copy()
endf

func! CPA() " Copy current buffer contents to clipboard
	call CopyAll()
endf

func! CopyLine() " Copy a single line
	call SelectLine()
	call Copy()
endf

func! CPL() " Copy a single line
	call CopyLine()
endf

func! Cut() " Cut current buffer contents to clipboard
	call CopyAll()
	%d
endf

func! S2C(str) " Put string on clipboard
	%d
	call P(a:str)
	call Cut()
endf
