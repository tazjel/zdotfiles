"=============================================================================
" Vim global plugin for load template files
" File:			template_loader.vim
" Maintainer:	Jestery Liu <jestery@gmail.com>
" Last Change:	2007/02/02
" Version:		0.1
" Description: 
"	Load template file for editing new files
" Options:
"	(int) g:template_load
"		Set to 0 to disable template auto-loading, 1 for enable.
"
"	(int) g:template_confirm
"		If set to 1, everytime you edit a new file you will be asked for
"		whether load template or not.
"
"	(string) g:template_path
"		If set, script will look for template files in this path, if not set,
"		the script will locate template files in each path in &runtimepath.
"
"	(string) g:template_dir_name
"		By default, if g:template_path is not set, script will locate template
"		files in &runtimepath.'/templates/', '~/.vim/templates/' for example,
"		you can custom your own directory name by set this value. If
"		g:template_path is set, this value never be used.
"
"	(string) g:template_prefix
"		The default template file name is 'tpl.extension', for example, if you
"		create a 'foo.c', '~/.vim/templates/tpl.c' will be loaded. You can set
"		this value to 'skel' to load 'skel.c'
"
"	(int) g:template_tags_replacing
"		If set to 1, some pre-defined tags will be replaced by the
"		following variables:
"			(string) g:T_AUTHOR
"			(string) g:T_AUTHOR_EMAIL
"			(string) g:T_AUTHOR_WEBSITE
"			(string) g:T_LICENSE
"			(string) g:T_DATE_FORMAT (Same as strftime)
"			(int)   g:T_FILENAME_USE_FULL_PATH
"					(If 1, /foo/bar.c will be used, otherwise, bar.c)
"		Pre-defined tags:
"			<T_AUTHOR>, <T_AUTHOR_EMAIL>, <T_AUTHOR_WEBSITE>
"			<T_LICENSE>, <T_FILENAME>, <T_CREATE_DATE>
"			<T_CURSOR>
"			If found <T_CURSOR>, the cursor will be placed here and <T_CURSOR>
"			will be deleted.
"
"	(int) g:template_replace_start_line
"		Start tag replacing from here. Default is 1
"
"	(int) g:template_replace_end_line
"		End tag replacing to here. Default is the last line ("$")

if exists("g:template_load") && (g:template_load==1)
	augroup Template_Loader
		autocmd!
		au BufNewFile * call LoadTemplate()
	augroup END
else
	finish
endif

function! LoadTemplate()
	let s:template_file = ""
	let g:template_prefix = exists("g:template_prefix") ? g:template_prefix : 'tpl'
	let s:ext = expand('%:e')
	if s:ext == ""
		let s:ext = expand('%:t')
	endif
	let s:template_file_name = g:template_prefix . '.' . s:ext
	if exists("g:template_path")
		let s:template_file = g:template_path.'/'.s:template_file_name
	else
		let s:template_dir_name = exists("g:template_dir_name") ? g:template_dir_name : 'templates'
		let s:rtp = &runtimepath
		let s:dirs = split(s:rtp, ',')
		if empty(s:dirs)
			return
		endif
		for dir in s:dirs
			let s:template_file = dir.'/'.s:template_dir_name.'/'.s:template_file_name
			if filereadable(s:template_file)
				break
			endif
		endfor
		"unlet s:rtp, s:dirs, s:template_dir_name
	endif
	if s:template_file=="" || !filereadable(s:template_file)
		echo "Missing template file. (".s:template_file.")"
		return
	endif
	call LoadTemplateFile(s:template_file)
endfunction

function! LoadTemplateFile(filename)
	let choice = 1
	if exists("g:template_confirm") && g:template_confirm==1
		let choice = confirm("Do you want to load template for this new file?", "&Yes\n&No")
	endif
	if choice==0
		return
	endif
	sil! execute "0r " . a:filename
	call TemplateReplTags()
endfunction

function! TemplateReplTags()
	if g:template_tags_replacing != 1
		return
	endif
	let sl = exists("g:template_replace_start_line") ? g:template_replace_start_line : 1
	let el = exists("g:template_replace_end_line") ? g:template_replace_end_line : "$"
	if exists("g:T_AUTHOR")
		sil! execute sl.','.el."s/<T_AUTHOR>/".g:T_AUTHOR."/g"
	endif
	if exists("g:T_AUTHOR_EMAIL")
		sil! execute sl.','.el."s/<T_AUTHOR_EMAIL>/".g:T_AUTHOR_EMAIL."/g"
	endif
	if exists("g:T_AUTHOR_WEBSITE")
		sil! execute sl.','.el."s=<T_AUTHOR_WEBSITE>=".g:T_AUTHOR_WEBSITE."=g"
	endif
	if exists("g:T_LICENSE")
		sil! execute sl.','.el."s/<T_LICENSE>/".g:T_LICENSE."/g"
	endif
	if exists("g:T_DATE_FORMAT") 
		sil! execute sl.','.el."s/<T_CREATE_DATE>/".strftime(g:T_DATE_FORMAT)."/g"
	endif
	if exists("g:T_FILENAME_USE_FULL_PATH") && g:T_FILENAME_USE_FULL_PATH==1
		let s:fn = expand("%:p")
	else
		let s:fn = expand("%:t")
	endif
	sil! execute sl.','.el."s/<T_FILENAME>/".s:fn."/g"
	unlet s:fn
	let s:curpos = search("<T_CURSOR>", 'W')
	if !empty(s:curpos)
		call cursor(s:curpos)
		sil! execute "normal df>"
		sil! execute "startinsert"
	endif
endfunction

" vim: set ts=4 sw=4 tw=78:
