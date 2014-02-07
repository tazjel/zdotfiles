function! Z_usage()
    put =''
    put ='\" d                        - delete session'
    put ='\" e                        - edit session'
    put ='\" o, <CR>, <2-LeftMouse>   - open session'
    put ='\" q                        - close session list'
    put ='\" x                        - edit extra session script'
    put ='\"-----------------------------------------------------'
endfunction
        silent  put ='\" --------- General ---------'
        silent  put ='\" --------- General ---------'
        silent  put ='\" --------- General ---------'
        put =['# coding: utf-8', 'call_unknown_function()']
--
        let @h=@h."\" Bookmark commands~\n"
        let @h=@h."\" :Bookmark <name>\n"
        let @h=@h."\" :BookmarkToRoot <name>\n"
        let @h=@h."\" :RevealBookmark <name>\n"
        let @h=@h."\" :OpenBookmark <name>\n"
        let @h=@h."\" :ClearBookmarks [<names>]\n"
        let @h=@h."\" :ClearAllBookmarks\n"
