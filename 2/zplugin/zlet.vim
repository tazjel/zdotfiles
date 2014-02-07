
           :let l = [1, 2, 3]
       :let lnum = lnum + 1
       unlet item  " E706 without this
    :let &path = &path . ',/usr/local/include'
    :let @/ = ""
    :let [a, b; rest] = ["aval", "bval", 3, 4]
    :let [i, x[i]] = [1, 2]
    :let [s, item] = GetItem(s)
    :let cl = l
    :let cl[1] = 99		" won't work!
    :let i = 0
    :let l = [0, 1, 2, 3]
    :let lnum = 1
    :let v = 'asdf'		" fails!
    :let var = var[0:2] . 'X' . var[4:]
    :let x = [0, 1]
    :unlet dict.two
    :unlet dict['two']
    :unlet list[3:]   " remove fourth item to last
    :unlet list[3]	  " remove fourth item
    :unlet v
    \let &ve = save_ve<CR>
:  let c = nr2char(getchar())
:  let g:Foo = input("enter search pattern: ")
:imap <F2> <C-O>:let save_ve = &ve<CR>
:let &path = substitute(&path, ",\\=[^,]*$", "", "")
:let &tags = expand("%:p:h") . "/tags"
:let &tags = substitute(tagfiles, "\n", ",", "g")
:let @/ = histget("search", -1)
:let @= = var_expr
:let [lnum,col] = searchpairpos('{', '', '}', 'n')
:let alist = [0, ['a', 'b'], 2, 3]
:let alist = add([1, 2, 3], item)
:let bits = invert(bits)
:let bits = or(bits, 0x80)
:let bits = xor(bits, 0x80)
:let bufmodified = getbufvar(1, "&mod")
:let cliptext = getreg('*')
:let cmd = winrestcmd()
:let colon1 = stridx(line, ":")
:let colon2 = stridx(line, ":", colon1 + 1)
:let color = input("Color? ", "white")
:let comma2 = strridx(line, ",", lastcomma - 1)
:let date=input("Enter date: ")
:let doesntwork = expand("%:h.bak")
:let doeswork = expand("%:h") . ".bak"
:let end = search("^$") - 1
:let failed = append(0, ["Chapter 1", "the beginning"])
:let failed = append(line('$'), "# THE END")
:let fl = readfile("foo", "b")
:let flag = and(bits, 0x80)
:let fname = '+some str%nge|name'
:let idx = index(words, "the")
:let idx = match(haystack, '\cneedle')
:let inp_index = histnr("expr")
:let items = split(line, ':', 1)
:let l = filter(copy(mylist), 'v:val =~ "KEEP"')
:let lastcomma = strridx(line, ",")
:let len = strlen(substitute(str, ".", "x", "g"))
:let lines = getbufline(bufnr("myfile"), 1, "$")
:let lines = getline(start, end)
:let list_is_on = gettabwinvar(1, 2, '&list')
:let list_is_on = getwinvar(2, '&list')
:let longlist = repeat(['a', 'b'], 3)
:let m = getmatches()
:let m = matchadd("MyGroup", "TODO")
:let mylist = insert([2, 3, 5], 1)
:let newlist = [1, 2, 3] + [4, 5]
:let repl = ""
:let revlist = reverse(copy(mylist))
:let separator = repeat('-', 80)
:let sepidx = match(line, '[.,;: \t]')
:let sortedlist = sort(copy(mylist))
:let span = matchend(line, '[^a-zA-Z]')
:let span = matchend(line, '[a-zA-Z]')
:let start = line('.')
:let tagfiles = glob("`find . -name tags -print`")
:let tlist = map(copy(mylist), ' v:val . "\t"')
:let tmpfile = tempname()
:let var_a = getreg('a', 1)
:let var_amode = getregtype('a')
:let words = split(getline('.'), '\W\+')
:unlet m
changing.  Unlet the variable at the end of the loop
let buflist = []
let c = getchar()
let color = inputlist(['Select color:', '1. red',
let end = search('END', '', line("w$"))
let f = str2float(substitute(text, ',', '', 'g'))
let fname = input("File: ", "", "file")
let ind = indent(prevnonblank(v:lnum - 1))
let lines = join(mylist, "\n") . "\n"
let match = search('(', 'b', line("w0"))
let s = strpart(str, byteidx(str, 3))
let save_cursor = getpos(".")
let sortedlist = sort(mylist, "MyCompare")
let start = reltime()
let window_count = winnr('$')
:	 let flags = "W"
:	let my_changedtick = b:changedtick
:  let flags = "w"
:  let n = n + 1
:let files = system("ls " .  shellescape(expand('%:h')))
:let n = 1
if (foo == 0) | let foo = foo + 1 | endif ~
:  let &sw = n
:let n = inputdialog("value for shiftwidth", shiftwidth())
:execute 'while i < 5 | echo i | let i = i + 1 | endwhile'
let s:counter = s:counter + 1
let s:counter = s:counter - 1
try | unlet novar # | catch | echo v:exception | endtry
let s:counter = 1
let s:counter = s:counter + 1
:      let first = 0
:    let file = dir . "/" . file
:    unlet novar
:    unlet s:[k]
:   let index = index + 1
:   let item = mylist[index]
:   let self.val = 0
:  autocmd BufWriteCmd *   let cnt = cnt + 1
:  let &ts = s:saved_ts
:  let c = a:a + a:b
:  let cnt = 0
:  let command = input("Type a command: ")
:  let dir = substitute(v:exception, '.*(\(.\+\),\s*.\+).*', '\1', "")
:  let f = escape(fnameescape(argv(i)), '.')
:  let file = substitute(v:exception, '.*(.\+,\s*\(.\+\)).*', '\1', "")
:  let function = substitute(v:exception, '.*(\(\a\+\)).*', '\1', "")
:  let i = i + 1
:  let s:saved_ts = &ts
:  unlet s:saved_ts
:au BufWritePre * unlet novar
:autocmd BufWritePost *   let x = "after fail"
:exe 'let sum = ' . join(nrlist, '+')
:let Fn = function("MyFunc")
:let [lnum, col, submatch] = searchpos('\(\l\)\|\(\u\)', 'np')
:let [lnum, col] = searchpos('mypattern', 'n')
:let [var1, var2; rest] = mylist
:let [var1, var2] = mylist
:let a = "aaaa\nxxxx"
:let a = 5
:let aa = [1, 2, 3]
:let aa = [[1, 'a'], 2, 3]
:let aa[0][1] = 'aaa'
:let adict = onedict
:let adict['a'] = 11
:let alist = [1, 2, 3]
:let b = "5"
:let bb = aa
:let bb = copy(aa)
:let big = max(dict)		" maximum value in dict
:let big = max(list)		" maximum value in list
:let blist = [1, 2, 3]
:let c = getline(".")[col(".") - 1]
:let c = name[-1:]		" last byte of a string
:let c = name[-2:-2]		" last but one byte of a string
:let dict = {"one": 1, 2: "two"}
:let dict['one'] = item
:let dict[4] = "four"
:let e  = 2.71828182846
:let emptydict = {}
:let emptylist = []
:let endlist = mylist[2:]	" from item 2 to the end: [3, "four"]
:let first = 1
:let foo#bar#toggle = 1
:let foo='a + b'
:let func = string(Fn)
:let func_end='whizz'
:let i = 0
:let i = index(list, 'x')	" index of first 'x' in list
:let i = remove(dict, 'aaa')
:let i = remove(list, 3)	" remove item 3
:let index = 0
:let item = mylist[-1]		" get last item
:let item = mylist[0]		" get the first item: 1
:let item = mylist[2]		" get the third item: 3
:let item = nestlist[0][1]	" get the first list, second item: 12
:let l = "string"
:let l = "string"	" error!
:let l = 4.4		" changes type from Number to Float
:let l = 44		" changes type from String to Number
:let l = [1, 2, 3]	" error!  l is still a Number
:let l = foo#bar#lvar
:let l = len(dict)		" number of items in dict
:let l = len(list)		" number of items in list
:let l = mylist[4:4]		" List with one item
:let l = mylist[:3]		" first four items
:let l = mylist[:]		" shallow copy of a List
:let l = remove(list, 3, -1)	" remove items 3 to last item
:let last = mylist[-1]		" get the last item: "four"
:let last_buffer = bufnr("$")
:let lines = getline(1, 10)	" get ten text lines from buffer
:let list = split("a b c")	" create list from items in a string
:let list[3:5] = [3, 4, 5]
:let list[4] = "four"
:let listlist[0][3] = item
:let longlist = mylist + [5, 6]
:let mydict = {'data': [0, 1, 2, 3], 'len': function("Mylen")}
:let mydict = {'data': [0, 1, 2, 3]}
:let mydict = {1: 'one', 2: 'two', 3: 'three'}
:let mydict.four = 4
:let mydict["four"] = 4
:let mylist += [7, 8]
:let mylist = [0, 1, 2, 3]
:let mylist = [1, two, 3, "four"]
:let nestdict = {1: {11: 'a', 12: 'b'}, 2: {21: 'c'}}
:let nestlist = [[11, 12], [21, 22], [31, 32]]
:let onedict = {'a': 1, 'b': 2}
:let otherlist = mylist[:]	" make a copy of the List
:let pi = 3.14159265359
:let r = call(Fn, mylist)
:let r = call(funcname, list)	" call a function with an argument list
:let rest = mylist[2:]
:let s = line(".")[4:]		" from the fifth byte to the end
:let s = s[:-3]			" remove last two bytes
:let s = string(dict)		" String representation of dict
:let s = string(list)		" String representation of list
:let shortlist = mylist[2:-1]	" get List [3, "four"]
:let shortlist = mylist[2:2]	" List with one item: [3]
:let small = min(dict)		" minimum value in dict
:let small = min(list)		" minimum value in list
:let string = join(list, ', ')	" create string from list items
:let v:errmsg = ""
:let val = mydict.one
:let val = mydict["one"]
:let var1 = mylist[0]
:let var2 = mylist[1]
:let x = "ok"
:let x = novar
:let xs = count(dict, 'x')	" count nr of times 'x' appears in dict
:let xs = count(list, 'x')	" count nr of times 'x' appears in list
:unlet dict.aaa
:unlet dict['aaa']
:unlet list[3 : ]		" idem
:unlet list[3]			" idem
:unlet novar
command Tick let s:counter = s:counter + 1 | echo s:counter
let a = 1
let name = substitute(line, '.\+:\s*', '', '')
let nr = matchstr(line, '\d\+')
let s:counter = 0
let scripts[nr] = name
unlet novar #
let scriptnames_output = ''
let scripts = {}
unlet scriptnames_output
:choice = confirm("What do you want?", "&Apples\n&Oranges\n&Bananas", 2)
:let col = substitute(l, mx, '\3', '')
:let file = substitute(l, mx, '\1', '')
:let l = matchstr(line, mx)
:let lnum = substitute(l, mx, '\2', '')
:let mx='\(\f\+\),\s*\(\d\+\),\s*\(\d\+\)'
:    let n = n / 2
:    let out = out . '-' . Nr2Bin(char2nr(a:str[ix]))
:    let r = '01'[n % 2] . r
:  let lines = getline(1, '$')
:  let n = a:nr
:  let out = ''
:  let r = ""
:let @{i} = ''  " error
:let [success, div] = Compute(102, 6)
:let i = 3
:let ${env-name} .= {expr1}
:let ${env-name} = {expr1}			*:let-environment* *:let-$*
:let &g:{option-name} += {expr1}
:let &g:{option-name} -= {expr1}
:let &g:{option-name} .= {expr1}
:let &g:{option-name} = {expr1}
:let &l:{option-name} += {expr1}
:let &l:{option-name} -= {expr1}
:let &l:{option-name} .= {expr1}
:let &l:{option-name} = {expr1}
:let &{option-name} += {expr1}
:let &{option-name} -= {expr1}
:let &{option-name} .= {expr1}
:let &{option-name} = {expr1}			*:let-option* *:let-&*
:let @{reg-name} .= {expr1}
:let @{reg-name} = {expr1}			*:let-register* *:let-@*
:let [{name1}, {name2}, ...] += {expr1}
:let [{name1}, {name2}, ...] -= {expr1}
:let [{name1}, {name2}, ...] .= {expr1}
:let [{name1}, {name2}, ...] = {expr1}		*:let-unpack* *E687* *E688*
:let [{name}, ..., ; {lastname}] += {expr1}
:let [{name}, ..., ; {lastname}] -= {expr1}
:let [{name}, ..., ; {lastname}] .= {expr1}
:let [{name}, ..., ; {lastname}] = {expr1}
:let {var-name}	..	List the value of variable {var-name}.	Multiple
:let {var-name} = {expr1}				*:let* *E18*
:let {var-name}[{idx1}:{idx2}] = {expr1}		*E708* *E709* *E710*
:let {var-name}[{idx}] = {expr1}			*E689*
:let {var} += {expr1}	Like ":let {var} = {var} + {expr1}".
:let {var} -= {expr1}	Like ":let {var} = {var} - {expr1}".
:let {var} .= {expr1}	Like ":let {var} = {var} . {expr1}".
inputlist( {textlist})		Number	let the user pick from a choice list
