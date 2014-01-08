" Vim Autoload Plugin: StringComplete.vim
" Author: Peter Hodge <toomuchphp-vim@yahoo.com>
" URL: http://www.vim.org/scripts/script.php?script_id=2238
" Version: 1.0
" Last Update: May 13, 2008
" Requires: Vim 7 or later
"
" Instructions:
" Put this file into ~/.vim/autoload/ or c:\Program Files\vim\vimfiles\autoload\
" To map CTRL-J to string completion in insert mode, add the following command to your
" .vimrc:
"
" 	inoremap <C-J> <C-O>:set completefunc=StringComplete#GetList<CR><C-X><C-U>
"
" After pressing CTRL-J in insert mode, the first matching string will be
" selected. Then, use CTRL-N and CTRL-P to move through the completion list as
" normal.
"
"
"
" TODO LIST:
" - allow providing a 'dictionary' file of common strings
" - if there are two identical matches, use the one with the same quotes first
" - allow configuration in terms of mixing of quote types (currently single
"   and double quotes are mixed in together)
" - allow searching for backticks
" - allow configuration on a per-buffer basis.

" - I am not actively developing this plugin (most of the work was done in
"   2007). If you would like to see any of these undeveloped features come to
"   life, send me a patch! (Even if your patch is only 80% there, it might
"   inspire me to finish the feature for you).

let s:patternSQ = "^'\\%(\\\\.\\|[^']\\)\\{-}'"
let s:patternDQ = '^"\%(\\.\|[^"]\)\{-}"'

function! StringComplete#GetList(findstart, base) " {{{
  if a:findstart == 1 " {{{
    " are we over a quote character
    let l:col = col('.')
    let l:line = strpart(getline('.'), 0, l:col)

    " are we sitting inside an empty string?
    if strpart(l:line, l:col - 2) =~ "['\"]\\{2}"
      " delete the quote ahead of the cursor before continuing
      normal! x
      return l:col - 2
    endif

    " are we sitting over the leading quote then?
    if strpart(l:line, l:col - 2, 1) =~ "['\"]"
      " only if the syntax item before us is NOT a string (because if it IS a
      " string syntax, then we are actually inside the string)
      if synIDattr(synID(line('.'), l:col, 0), 'name') !~? 'string'
        return l:col - 2
      endif
    endif

    " if the character under the cursor is a quote, then we need to delete it
    if strpart(l:line, l:col - 1, 1) =~ "['\"]"
      normal! x
    endif

    " we need to search back for the previous quote character
    let l:sqPos = strridx(l:line, "'", l:col - 2)
    let l:dqPos = strridx(l:line, '"', l:col - 2)

    " if use the greater of these positions (unless they are both not found)
    let l:return = max([ l:sqPos, l:dqPos])
    return (l:return >= 0) ? l:return : l:col
  endif " }}}

  " use the first part of the string to find matches
  let l:lead = strpart(a:base, 1)
  let l:leadLen = strlen(l:lead)

  unlet! g:foo
  let g:foo = [ l:lead, l:leadLen ]

  " NOTE: if the string is empty, we don't look for the quote, unless they
  " REALLY want to
  if ! l:leadLen
    if 1 != confirm("Are you sure you want to search for all quoted strings?", "Yes\nNo")
      return []
    endif
  endif

  let l:return = []
  call <SID>FindStrings(l:return, l:lead, 1)

  " search other windows' buffers?
  call <SID>SearchOtherWindows(l:return, l:lead)

  " NOTE: selecting the original, or the empty string seemed rather useless ...
  return l:return

  " allow choosing the string already provided
  let l:baseQuote = strpart(a:base, 0, 1)
  if l:leadLen
    call add(l:return, { 'word': l:baseQuote . l:lead . l:baseQuote, 'menu': '(current)' })
  else
    " otherwise, allow choosing the empty string
    call add(l:return, l:baseQuote . l:baseQuote)
  endif

  return l:return
endfunction " }}}

function! <SID>SearchOtherWindows(return, lead) " {{{
  " not unless 'completeopt' says so
  if stridx(&l:completeopt, 'w') == -1
    return
  endif

  let l:done = [ bufnr('') ]
  let l:oldWin = winnr()

  for l:winNr in range(1, winnr('$'))
    " jump to that window number
    execute l:winNr 'wincmd w'

    " if the buffer is NOT yet scanned
    if ! count(l:done, bufnr(''))
      call add(l:done, bufnr(''))
      call <SID>FindStrings(a:return, a:lead, 0)
    endif
  endfor

  " return to the old window
  execute l:oldWin 'wincmd w'

endfunction " }}}

function! <SID>FindStrings(return, lead, current) " {{{
  let l:leadLen = strlen(a:lead)

  " now we need to search the buffer for strings!!!
  for l:lineNr in range(line('.'), line('$')) + range(1, line('.') - 1) " {{{
    let l:lineData = getline(l:lineNr)
    let l:lineLen = strlen(l:lineData)

    let l:start = 0

    while l:start < l:lineLen " {{{
      " find the first quote in the string
      let l:qPos = match(l:lineData, "['\"]", l:start)

      " if nothing was found, nothing to do
      if l:qPos == -1
        break
      endif

      let l:pattern = (strpart(l:lineData, l:qPos, 1) == '"') ? s:patternDQ : s:patternSQ
      let l:str = matchstr(l:lineData, l:pattern, l:qPos)

      " if there was no string match (the string wasn't complete), then we
      " can't do anything more with this line
      if l:str == ''
        break
      endif

      " look for the next string further on
      let l:start = l:qPos + strlen(l:str)

      " if we have a leadstring, then we need to make sure the lead matches too
      if l:leadLen && (strpart(l:str, 1, l:leadLen) != a:lead)
        " if the string doesn't begin with 'lead' already in place, then it
        " can't be used
        continue
      endif

      " Don't allow strings of less than 1 contained character
      if strlen(l:str) > 3
        if ! count(a:return, l:str)
          let l:add = { 'word': l:str, 'icase': 0 }

          if a:current
            let l:add['menu'] = 'line ' . l:lineNr
          endif

          call add(a:return, l:add)
          unlet l:add
        endif
      endif
    endwhile " }}}
  endfor " }}}
endfunction " }}}

" vim: sts=2 ts=2 sw=2 et
