" Vim syntax file
" Language:	ELinks configuration file (elinks.conf)
" Maintainer:	Jonas Fonseca <fonseca@diku.dk>
" Last Change:	Dec 12th 2002
" Description:	This file covers elinks version 0.4pre15

" $Id: elinks.vim,v 1.5 2003/01/18 23:36:33 jonas Exp $

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Add keyword characters needed by elinksAction's.
if version < 600
  set iskeyword+=-
else
  setlocal iskeyword+=-
endif

" Comment stuff
syn match	elinksComment	/\s*#.*$/ contains=elinksTodo,elinksSyntax
syn keyword	elinksTodo	contained TODO NOTE NOT FIXME XXX
syn match	elinksSyntax	contained /[a-zA-Z-0-9\._-]\+\s\(<.*>\|\[.*|.*\]\)/

" Set statements
syn match	elinksSet	/^\s*set\s/ skipwhite nextgroup=elinksTreeOpt

" The '=' included in elinksTreeOpt controls highlighting of the tree options
syn match	elinksTreeOpt	/[a-zA-Z-0-9\*\._-]\+\s*=/ skipwhite contains=elinksAssign nextgroup=elinksNumber,elinksValue
syn match	elinksAssign	contained /=/

syn match	elinksNumber	/-\?\d\+[Mk]\?/ contains=elinksSize
syn match	elinksSize	contained /[Mk]/

syn region	elinksValue	start=+"+ms=e end=+"+ contains=elinksEmail,elinksURL,elinksColor,elinksEscape,elinksComArgs
syn match	elinksEscape	contained /\\"/
syn match	elinksComArgs	contained /%[hpstuv]/
syn match	elinksColor	contained /#\x\{6\}/
syn match	elinksEmail	contained "[a-zA-Z0-9.-]\+@[a-zA-Z0-9.-]\+"
syn match	elinksURL	contained "\(https\?\|ftp\)://\w\+[a-zA-Z0-9.-]*\(:[1-9]\d\{0,4\}\)\?"

" Bind statements
syn match	elinksBind	/^\s*bind\s/ skipwhite nextgroup=elinksKeymap
syn match	elinksKeymap	/"\(main\|edit\|menu\)"/ skipwhite nextgroup=elinksKey
syn match	elinksKey	/"[^"]\+"/ skipwhite nextgroup=elinksActStr

syn match	elinksActStr	/=\s*"[^"]*"/ contains=elinksAssign,elinksAction
syn keyword	elinksAction	contained add-bookmark auto-complete auto-complete-unambiguous back backspace
syn keyword	elinksAction	contained bookmark-manager cookies-load copy-clipboard cut-clipboard delete
syn keyword	elinksAction	contained document-info down download download-image edit end enter enter-reload
syn keyword	elinksAction	contained file-menu find-next find-next-back follow-link forget-credentials
syn keyword	elinksAction	contained goto-url goto-url-current goto-url-current-link goto-url-home
syn keyword	elinksAction	contained header-info history-manager home jump-to-link keybinding-manager kill-to-bol kill-to-eol
syn keyword	elinksAction	contained left link-menu lua-console menu next-frame none open-link-in-new-window
syn keyword	elinksAction	contained open-new-window page-down page-up paste-clipboard previous-frame quit
syn keyword	elinksAction	contained really-quit reload right save-formatted scroll-down scroll-left
syn keyword	elinksAction	contained scroll-right scroll-up search search-back toggle-display-images toggle-numbered-links
syn keyword	elinksAction	contained toggle-display-tables toggle-html-plain unback up view-image zoom-frame
syn keyword	elinksAction	contained options-manager abort-connection resume-download add-bookmark-link

" Include statements
syn match	elinksInclude	/^\s*include\s/ skipwhite nextgroup=elinksValue

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_elinks_syntax_inits")
  if version < 508
    let did_elinks_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink elinksComment	Comment
  HiLink elinksTodo	Todo
  HiLink elinksSyntax	SpecialComment

  HiLink elinksSet	Keyword
  HiLink elinksTreeOpt	Identifier
  HiLink elinksAssign	Operator
  HiLink elinksValue	String
  HiLink elinksEscape	SpecialChar
  HiLink elinksComArgs	SpecialChar
  HiLink elinksColor	Type
  HiLink elinksEmail	Type
  HiLink elinksURL	Type
  HiLink elinksNumber	Number
  HiLink elinksSize	Type

  HiLink elinksBind	Keyword
  HiLink elinksKeymap	Type
  HiLink elinksKey	Macro
  HiLink elinksActStr	String
  HiLink elinksAction	Identifier

  HiLink elinksInclude	Keyword

  delcommand HiLink
endif

let b:current_syntax = "elinks"
