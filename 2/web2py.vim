" A web2py plugin to switch between views and controllers and see a project
" Language:    Python
" Maintainer:  Hector Davensburg <hector.davensburg@gmail.com>
" Created:     2013 Jun 23
"
" :SWITCH   : switch between a view and a controller
" :PROJECT  : show a project description on the left of the screen
"              When you have a cursor on a file or a method name
"               'c': open the controller
"               'o': open the model
"               'v': open the view
"               'u': update the project window

if v:version < 700
    echoerr "web2py: this plugin requires vim >= 7."
    finish
endif

if exists("b:did_web2py_project")
   "finish
endif
let b:did_web2py_project = 1

if !exists("g:viewExtensions")
  let g:viewExtensions = ["html", "htm", "json"]
endif

if !exists("g:lineLength")
  let g:lineLength = 20
endif

if !exists("g:showCapabilities")
  let g:showCapabilities = 1
endif

let s:folderStop = ['views', 'controllers', 'models']
let s:windowName = '__web2py_project__'

let g:views = 0
let g:controllers = 1
let g:models = 2
let g:all = 3

"{{{Utils

function s:throw(string) abort
  let v:errmsg = 'web2py: '.a:string
  throw v:errmsg
endfunction

" Split the filename and the directories in path
"  Return: [path to the directory, filename]
function s:splitLastFile(path)
  let pos = strridx(a:path, '/')
  if pos == -1
    return ['', a:path]
  else
    return [strpart(a:path, 0, pos), a:path[pos+1:]]
  endif
endfunction

function s:addMethod(object, methods)
  for method in a:methods
    let s:{a:object}_prototype[method] = function('s:'.a:object.'_'.method)
  endfor
endfunction

" Return: all the files in dir not filtred by "filter"
function s:filesIn(dir, filter)
  let files = split(globpath(a:dir, '*'), '\n')
  let files = filter(files, a:filter)

  let ret = []
  for path in files
    let name = path[len(a:dir)+1:]

    if name[-3:] ==? ".py"
      let name = name[:-4]
    endif

    call add(ret, name)
  endfor

  return sort(ret)
endfunction

function s:merge(list1, list2)
  let ret = []

  while !empty(a:list1) || !empty(a:list2)
    if !empty(a:list1) && (empty(a:list2) || a:list1[0] < a:list2[0])
      call add(ret, a:list1[0])
      unlet a:list1[0]
    else
      call add(ret, a:list2[0])
      if !empty(a:list1) && a:list1[0] == a:list2[0]
        unlet a:list1[0]
      endif
      unlet a:list2[0]
    endif
  endwhile

  return ret
endfunction

function s:prompt(message)
  echohl ErrorMsg
  echo a:message
  echohl None
endfunction

" Returns: the filename pointed by path
"  If this file is not flushed, a copy of the file is saved in a
"  temporary directory.
function s:getFileName(path)
  if bufloaded(a:path)
    let bufnr = bufnr(a:path)
    if getbufvar(bufnr, '&modified')
      let lines = getbufline(bufnr, 0, '$')
      let tmpPath = tempname()
      " We use the original file (on the disk) if we
      "  are not able to copy the buffer to a temporary
      "  file.
      if writefile(lines, tmpPath) == 0
        return tmpPath
      endif
    endif
  endif
  return a:path
endfunction
"}}}

" Project management"{{{

" > Path analysis {{{

" Return: the path where is located web2py.
"  We assume that this folder is the only one containing
"   a file named "web2py.py" (...)
function s:web2pyBasePath(basepath)
  let path = a:basepath
  if empty(path)
    let path = getcwd()
  endif

  let [path, _] = s:splitLastFile(path)
  while 1
    let web2pyPath = path.'/web2py.py'

    if filereadable(web2pyPath)
      return path
    endif

    if empty(path)
      break
    endif

    let [path, _] = s:splitLastFile(path)
  endwhile

  call s:throw('Project not found')
endfunction

" Return: the next folder in path leading to path.
"  => s:nextFolder("/var/tmp/3.txt", "/var") == "/var/tmp"
function s:nextFolder(path, basePath)
  " Are we in the good directory?
  if !empty(a:basePath) && a:path[:len(a:basePath)-1] !=# a:basePath
    call s:throw("No path found")
  endif

  let offsetDir = len(a:basePath)
  let endDir = stridx(a:path, '/', offsetDir)
  " is it a file or a directory with an empty name ""?
  if endDir == -1 || endDir == offsetDir
    call s:throw('No directory found')
  endif

  return a:path[:endDir]
endfunction

"}}}

"{{{ > Project
let s:project_prototype = {}

function s:sortByLine(i1, i2)
  return a:i1[0] - a:i2[0]
endfunction

" Return: a dict with the "controllerName" and the current "fonc"
"  in which the user is currently (method name).
"  {} if an error ocurre.
function s:analyzeCurrentController()
  let controllerPath = expand('%:p')
  if controllerPath[-3:] ==? ".py"
    let ret = {}

    "FIXME: We must reject the subdirectories in the controller
    " directory.
    let [_, filename] = s:splitLastFile(controllerPath)
    let ret.controllerName = filename[:-4]

    let foncs = s:controller__controller_foncs(filename)
    let foncsLst = items(foncs)
    let line = line('.')

    let foncsLst = map(foncsLst, '[str2nr(v:val[1].line), v:val[0]]')
    let foncsLst = sort(foncsLst, 's:sortByLine')
    let foncsLst = filter(foncsLst, 'v:val[0] <= '.line)
    if !empty(foncsLst)
      let foncName = foncsLst[-1][1]
      if !foncs[foncName]._hasArgs
        let ret.fonc = foncName
      endif
    endif
    return ret
  else
    return {}
  endif
endfunction

" a:dir : the relative path in the view directory.
" Return: a dict with the controllerName and the current fonc
"  in which the user is (method name). {} if an error ocurre.
function s:analyzeViewPath(dir)
  try
    let viewDir = s:nextFolder(a:dir, "")
    let filename = a:dir[len(viewDir):]
    " We don't accept subdirectories in the view
    "  directories
    if stridx(filename, '/') != -1
      return {}
    endif
    let posDot = strridx(filename, '.')
    if posDot <= 0
      return {}
    endif
    let extension = tolower(filename[posDot+1:])
    if index(g:viewExtensions, filename[posDot+1:]) == -1
      return {}
    endif
    return {'controllerName': viewDir[:-2], 'fonc': filename[:posDot-1]}
  catch /^web2py:.*/
    return {}
  endtry
endfunction

" Return: a new object representing the project pointed by a:path
"  a:path can be any file/directory in the project.
function s:project(path)
  let baseWeb2PyDirPath = s:web2pyBasePath(a:path)
  let project = {'fullPath': a:path}

  try
    let appsDir = baseWeb2PyDirPath.'/applications/'
    let project.appDir = s:nextFolder(a:path, appsDir)
  catch /^web2py:.*/
    call s:throw("No application directory found in path")
  endtry

  try
    let fileTypeDir = s:nextFolder(a:path, project.appDir)
    let fileType = s:splitLastFile(fileTypeDir[:-2])[1]
    " check the current directory, necessary?
    let typeStop = index(s:folderStop, fileType)
    if typeStop != -1
      let project.currentType = typeStop
      let afterPath = a:path[len(fileTypeDir):]
      if typeStop == g:views
        call extend(project, s:analyzeViewPath(afterPath))
      elseif typeStop == g:controllers
        call extend(project, s:analyzeCurrentController())
      endif
    endif

  catch /^web2py:.*/
  endtry

  return extend(project, s:project_prototype)
endfunction

function s:sortByName(i1, i2)
  if a:i1.name > a:i2.name
    return 1
  elseif a:i1.name < a:i2.name
    return -1
  else
    return 0
  endif
endfunc

" Return: all the models in the controller path (also in the subdirs)
function s:project_models() dict
  if has_key(self, '_models')
    return self._models
  endif

  let modelsDir = self.appDir.s:folderStop[(g:models)]
  let fullPathes = sort(split(globpath(modelsDir, '**'), '\n'))
  let ret = []

  for fullPath in fullPathes
    if filereadable(fullPath) && fullPath[-3:] ==? ".py"
      let name = fullPath[len(modelsDir)+1:-4]
      let name = substitute(name, "/", ".", "g")

      let modelFile = {'name': name, '_path': fullPath}
      call add(ret, extend(modelFile, s:model_prototype))
    endif
  endfor

  let self._models = sort(ret, 's:sortByName')
  return self._models
endfunction

" Update the current files displayed (delete the removed one and
"  add the new one)
function s:project_update() dict
  if has_key(self, '_controllers')
    for controller in self._controllers
      call controller.update()
    endfor
  endif
  if has_key(self, '_models')
    unlet self._models
  endif
endfunction

function s:project_controller(controllerName) dict
  let newProject = {'_open': 0}
  let newProject.name = a:controllerName
  let newProject.appDir = self.appDir
  return extend(newProject, s:controller_prototype)
endfunction

" Return: a list of controllers found in the project (both in the
"  view and controller directory)
function s:project_controllers(...) dict
  if has_key(self, '_controllers')
    return self._controllers
  endif

  let viewsDir = self.appDir.s:folderStop[(g:views)]
  let views = s:filesIn(viewsDir, 'isdirectory(v:val)')

  let controllersDir = self.appDir.s:folderStop[(g:controllers)]
  let filterControllers = 'filereadable(v:val) && v:val[-3:] ==? ".py"'
  let controllers = s:filesIn(controllersDir, filterControllers)

  let ret = []
  for controllerName in s:merge(views, controllers)
    let file = self.controller(controllerName)
    call add(ret, file)
  endfor

  let self._controllers = sort(ret, 's:sortByName')
  return self._controllers
endfunction

call s:addMethod('project', ['models', 'controllers'])
call s:addMethod('project', ['controller', 'update'])

"}}}

"{{{ > Model
let s:model_prototype = {}

" Return: the model path if it's the path for
"  the model
function s:model_path(type) dict
  if a:type == g:models
    return {'path': self._path}
  else
    call s:throw('No controller/view for a model')
  endif
endfunction

function s:model_foncs()
  return []
endfunction

function s:model_types()
  return [g:models]
endfunction

call s:addMethod('model', ['path', 'foncs', 'types'])
"}}}

"{{{ > Controller
let s:controller_prototype = {}

function s:controller_unchecked_path(type) dict
  let typeName = s:folderStop[(a:type)]
  let dirPath = self.appDir.typeName
  let dirPath .= '/'.self.name
  if a:type == g:controllers
    let dirPath .= '.py'
  endif
  return dirPath
endfunction

function s:controller_path(type) dict
  if a:type == g:models
    call s:throw('No model exist for a controller')
  else
    let typeName = s:folderStop[(a:type)]
    let dirPath = self.appDir.typeName
    if !isdirectory(dirPath)
      call s:throw('No '.typeName.' directory found in the application')
    endif

    let dirPath .= '/'.self.name
    if a:type == g:controllers
      let dirPath .= '.py'
      if !filereadable(dirPath)
        call s:throw('No controller found for "'.self.name.'"')
      endif
    elseif !isdirectory(dirPath) " g:views
      call s:throw('No view found for controller "'.self.name.'"')
    endif
    return {'path': dirPath}
  endif
endfunction

function s:controller_isOpen() dict
  return self._open
endfunction

function s:controller_toggle() dict
  let self._open = !self._open
endfunction

function s:controller_update() dict
  if has_key(self, '_foncs') && self.isOpen()
    " Do we really need to update the previous functions found?
    try
      let path = self.unchecked_path(g:controllers)

      if !filereadable(path) || bufloaded(path) || self._lastModif != getftime(path)
        unlet self._foncs
      endif
    catch /^web2py:.*/
      unlet self._foncs
    endtry
  endif
endfunction

function s:controller_fonc(name) dict
  for [name, fonc] in self.foncs()
    if name == a:name
      return fonc
    endif
  endfor

  call s:throw('No action '.name.' detected')
endfunction

function s:controller_foncs() dict
  if has_key(self, '_foncs')
    return self._foncs
  endif

  let controllerPath = self.unchecked_path(g:controllers)
  let controllers = self._controller_foncs(controllerPath)
  let controllers = filter(controllers, '!v:val._hasArgs')

  let viewPath = self.unchecked_path(g:views)
  let views = self._view_foncs(viewPath)

  let foncs = {}
  for foncName in s:merge(views, keys(controllers))
      let newFonc = {'appDir': self.appDir}
      let newFonc.controller = self.name
      let newFonc.name = foncName
      if has_key(controllers, foncName)
        let newFonc._controller_line = controllers[foncName].line
      endif
      let foncs[foncName] = extend(newFonc, s:fonc_prototype)
  endfor

  let self._foncs = sort(items(foncs))
  let self._lastModif = getftime(controllerPath)
  return self._foncs
endfunction

function s:controller_types() dict
  let controllerPath = self.unchecked_path(g:controllers)
  let viewPath = self.unchecked_path(g:views)
  let ret = []

  if filereadable(controllerPath)
    call add(ret, g:controllers)
  endif
  if isdirectory(viewPath)
    call add(ret, g:views)
  endif

  return ret
endfunction

function s:controller__controller_foncs(path)

  if !executable('ctags')
    call s:throw('No ctags executable to find the controller actions')
  endif

  let filePath =  s:getFileName(a:path)

  let outputFilename = tempname()
  call system('ctags --language-force=python -x '.filePath.' > '.outputFilename)
  let ret = {}

  for line in readfile(outputFilename)
    "FIXME: Accept methods on several lines (def fonc(\\n): ...)
    let regex = '^\(\w\+\)\s\+\w\+\s\+\(\d\+\).\+ def \w\+(\s*\(.\{-}\)\s*):'
    let match = matchlist(line, regex)

    if !empty(match)
      let name = match[1]
      let line = match[2]
      let hasArguments = !empty(match[3])

      let ret[name] = {"line": line, "_hasArgs": hasArguments}
    endif
  endfor

  if filePath != a:path
    call delete(filePath)
  endif
  return ret
endfunction

function s:controller__view_foncs(path)
  let views = []

  for viewName in s:filesIn(a:path, 'filereadable(v:val)')
    let path = a:path.'/'.viewName
    let posExt = strridx(viewName, '.')

    if posExt > 0
      let foncName = viewName[:max([0, posExt-1])]
      let extension = tolower(viewName[posExt+1:])
      if index(g:viewExtensions, extension) != -1
        call add(views, foncName)
      endif
    endif
  endfor

  return views
endfunction

call s:addMethod('controller', ['path', 'foncs', 'fonc', 'types'])
call s:addMethod('controller', ['_controller_foncs', '_view_foncs', 'isOpen'])
call s:addMethod('controller', ['unchecked_path', 'toggle', 'update'])

"{{{ > Fonc
let s:fonc_prototype = {}

function s:fonc_path(type) dict
  if a:type == g:views
    let path = self.appDir.s:folderStop[(g:views)].'/'.self.controller
    let chosenPath = self._chooseview(path, self.name)
    return empty(chosenPath) ? {} : {'path': chosenPath}
  else
    "FIXME: Accept upper-case letter for the extensions
    let path = self.appDir.s:folderStop[(g:controllers)].'/'.self.controller.'.py'

    if filereadable(path)
      let ret = {'path': path}
      if has_key(self, '_controller_line')
        let ret._controller_line = self._controller_line
      endif
      return ret
    else
      call s:throw('No controller found')
    endif
  endif
endfunction

function s:fonc_types() dict

  let ret = []
  if has_key(self, '_controller_line')
    call add(ret, g:controllers)
  endif

  let path = self.appDir.s:folderStop[(g:views)].'/'.self.controller
  let findResult = glob(path.'/'.self.name.'.{'.join(g:viewExtensions, ',').'}')
  if !empty(findResult)
    call add(ret, g:views)
  endif

  return ret
endfunction

" Let the user choose if there are many possible views
"  in directory a:path for a:viewName and returns
"  the choosen filename (fullpath).
function s:fonc__chooseview(path, viewName) dict
  "FIXME: Accept upper case filenames (hTml?)
  let findResult = glob(a:path.'/'.a:viewName.'.{'.join(g:viewExtensions, ',').'}')
  let viewFullpath = split(findResult, '\n')

  if len(viewFullpath) == 1
    return viewFullpath[0]
  elseif len(viewFullpath) > 1
    let choices = ['Several views exist:']

    for fullpath in viewFullpath
      let filename = fullpath
      " We want to show only the filename, not its full path
      let offsetPath = strridx(fullpath, '/')
      if offsetPath != -1
        let filename = filename[offsetPath+1:]
      endif

      call add(choices, ' '.len(choices).'. '.filename)
    endfor

    let id = inputlist(choices)
    if id == 0 || id > len(choices)
      return ""
    else
      return viewFullpath[id-1]
    endif
  endif

  call s:throw('No view found for "'.a:viewName.'"')
endfunction

call s:addMethod('fonc', ['path', 'types', '_chooseview'])
"}}}
"}}}
"}}}

" Switch controler <-> views"{{{

" Go to the view based on the path description (see return variable
"  of s:Web2pyProjectPath())
function SwitchViewController(bang)

  let fullPath = resolve(expand('%:p'))
  try
    let project = s:project(fullPath)
  catch /^web2py:.*/
    call s:prompt(v:exception)
  endtry

  if !has_key(project, 'currentType') || project.currentType == g:models
    call s:prompt("You're not currently in a controller/view")
  else
    if !has_key(project, 'controllerName') || !has_key(project, 'fonc')
      call s:prompt('No action detected')
    else
      try
        let controller = project.controller(project.controllerName)
        let fonc = controller.fonc(project.fonc)

        let gotoType = project.currentType == g:controllers ? g:views : g:controllers
        let goto = fonc.path(gotoType)

        if !empty(goto)
          execute "edit".(empty(a:bang) ? '' : '!')." ".escape(goto.path, ' ')

          if has_key(goto, '_controller_line')
            execute goto._controller_line
            execute "normal zt"
          elseif gotoType == g:controllers
            call s:prompt("No method found")
          endif
        endif
      catch /^web2py:.*/
        call s:prompt(v:exception)
      endtry
    endif
  endif

endfunction
"}}}

" Project tab {{{

" Open in a window the file pointed by a:path
function s:openWindow(path)

  wincmd p
  if &buftype != ''
    wincmd p
    vert botright vnew
  endif

  execute "confirm edit ".escape(a:path, ' ')
endfunction

" Refresh the current window with the project saved in
"  the buffer variable b:project
function s:refresh()
  set modifiable

  for i in range(1, line('$'))
    call setline(i, '')
  endfor

  call setline(1, 'Models')
  let config = {'noline': 2, 'files': {}}

  let config = s:printFiles(config, b:project.models())

  call setline(config.noline, '')
  call setline(config.noline+1, 'Controllers')
  let config.noline += 2

  let config = s:printFiles(config, b:project.controllers())

  let b:filePerLine = config.files

  set nomodified
  set nomodifiable

endfunction

" Open a fold (if it's a controller), open the file otherwise
function OpenFold()
  let l = line('.')
  if has_key(b:filePerLine, l)
    let file = b:filePerLine[l]
    if has_key(file, 'toggle')
      call file.toggle()
    else
      call Open(g:all)
      return
    endif
  endif
  call s:refresh()
endfunction

" Open a file of type "type" on the current line (the filename
"  is found in b:filePerLine)
function Open(type)
  let types = a:type == g:all ? [g:views, g:controllers, g:models] : [a:type]
  let exceptions = []
  let l = line('.')

  for type in types
    if has_key(b:filePerLine, l)
      let file = b:filePerLine[l]

      let goto = {}
      try
        let goto = file.path(type)
      catch /^web2py:.*/
        if a:type != g:all
            call s:prompt(v:exception)
        endif
      endtry

      if !empty(goto)
        call s:openWindow(escape(goto.path, ' '))

        if has_key(goto, '_controller_line')
          execute goto._controller_line
          execute 'normal zt'
        endif
        set modifiable
        return
      endif
    endif
  endfor

  if a:type == g:all
    call s:prompt('No file found')
  endif

endfunction

" Return: a string describing the type of file
function s:typesName(caps)
  let ret = '['
  let ret .= index(a:caps, g:views) >= 0 ? 'V' : ''
  let ret .= index(a:caps, g:controllers) >= 0 ? 'C' : ''
  let ret .= index(a:caps, g:models) >= 0 ? 'M' : ''

  if ret == '['
    let ret = ''
  else
    let ret .= ']'
  endif

  return ret
endfunction

function s:printFoncs(config, foncs)
  let config = a:config
  for [foncname, file] in a:foncs
    let description = s:typesName(file.types())
    let line = '  > '.foncname.' '
    let line = line[:(g:lineLength)]

    if g:showCapabilities
      let line .= description
    endif

    call setline(config.noline, line)
    let config.files[config.noline] = file
    let config.noline += 1
  endfor
  return config
endfunction

function s:printFiles(config, files)
  let config = a:config

  for file in a:files
    let open = has_key(file, 'isOpen') && file.isOpen()
    let line = open ? '+' : '-'
    let description = s:typesName(file.types())
    let line .= ' '.file.name.' '
    let line = line[:(g:lineLength)]

    if g:showCapabilities
      let line .= description
    endif

    call setline(config.noline, line)

    let config.files[config.noline] = file
    let config.noline += 1

    if open
      let config = s:printFoncs(config, file.foncs())
    endif

  endfor
  return config
endfunction

function RefreshBuffer()
  call b:project.update()
  call s:refresh()
endfunction

function s:setupColors()

  syntax match TagHeader '^Models'
  syntax match TagHeader '^Controllers'
  highlight link TagHeader Title

  syntax match TagListComment '^+ .\+'
  highlight link Delimiter Include

endfunction

" set the key maps
function s:addKeyMaps()

  exec "nnoremap <silent> <buffer> v :call Open(g:views)<cr>"
  exec "nnoremap <silent> <buffer> c :call Open(g:controllers)<cr>"
  exec "nnoremap <silent> <buffer> o :call Open(g:models)<cr>"
  exec "nnoremap <silent> <buffer> u :call RefreshBuffer()<cr>"

  exec "nnoremap <enter> :call OpenFold()<cr>"

endfunction

" update the current buffer (used by a command)
function s:installBuffer(fullPath)

  try
    let b:project = s:project(a:fullPath)

    call s:refresh()
  catch /^web2py:.*/
    call s:prompt(v:exception)
  endtry

endfunction

" returns the web2py project window number, -1
"   if it doesn't exist
function s:web2pyProjectWindow()
  let nowindow = 1
  let bufnr = 0

  while bufnr != -1
    let bufnr = winbufnr(nowindow)
    " required by autochdir
    let [_, filename] = s:splitLastFile(bufname(bufnr))
    if filename == s:windowName
      return nowindow
    endif
    let nowindow += 1
  endwhile
  return -1
endfunction

" show the project description (create a new window if necessary)
function ShowProject()
  let web2pyWindow =  s:web2pyProjectWindow()

  if web2pyWindow != -1
    :execute web2pyWindow."wincmd w"

    call RefreshBuffer()
  else
    let fullPath = resolve(expand('%:p'))

    vertical topleft 25vnew
    execute "edit ".s:windowName
    set winfixwidth
    set winfixheight

    call s:installBuffer(fullPath)

    call s:addKeyMaps()
    call s:setupColors()
    set nonumber
  endif

endfunction

"}}}

:com! -nargs=0 PROJECT call ShowProject()
:com! -nargs=0 -bang SW call SwitchViewController('<bang>')

