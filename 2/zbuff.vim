
  let g:bufferline_echo = 1
  let g:bufferline_active_buffer_left = '['
  let g:bufferline_active_buffer_right = ']'
  let g:bufferline_modified = '+'
  let g:bufferline_show_bufnr = 1
  let g:bufferline_rotate = 0
  let g:bufferline_rotate = 1
  let g:bufferline_rotate = 2
  let g:bufferline_fixed_index =  0 "always first
  let g:bufferline_fixed_index =  1 "always second (default)
  let g:bufferline_fixed_index = -1 "always last
  let g:bufferline_fname_mod = ':t'
  let g:bufferline_inactive_highlight = 'StatusLineNC'
  let g:bufferline_active_highlight = 'StatusLine'
  let g:bufferline_solo_highlight = 0
  let g:bufferline_excludes = [] "see source for defaults
  let g:bufferline_echo = 0

  let g:bufferline_echo = 0
      autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()



