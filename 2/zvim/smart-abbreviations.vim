" Function to ask for abbreviate something
function! s:AbbrAsk(abbr, expansion)
  let answer = confirm("Use the abbreviation '" . a:abbr . "'?", "&Yes\n&No", 1)
  return answer == 1 ? a:expansion : a:abbr
endfunction

iabbr <expr> david <SID>AbbrAsk('David Morcillo Muñoz', 'David Morcillo Muñoz')
cabbr csd colorscheme desert

" Using placeholders
iabbr for( for(!cursor!;<+++>;<+++>){<cr><+++><cr>}<Esc>:call search('!cursor!','b')<cr>cf!
