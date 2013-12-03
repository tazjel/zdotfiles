"""
	CompleteWord  1.0
	(C) Copyright 1998 by Kevin P Dahlhausen kdahlhaus@yahoo.com
					

	Completes word under the cursor by scanning the current 
	file and any imported modules that have Python source 
	available.

	Usage: 
		1.  Change the key mapping at the bottom of this file as desired.
		2.  Source this file from the compiled-in python interpreter.

	
	BUGS:
			- Errors if no word under the cursor - should just
			  silently return
			- If word under the cursor consists of just one letter,
			  the insertion will take place at the previous word.  This
			  is due to VIm's 'b' command.  Should code a replacement.
			- Add code to check for dialog compiled in and use simple
			  stdout for menu if not
			
		 	
	
"""
import vim
import string
import re
import sys

def getWordUnderCursor():
	""" Returns word under the current buffer's cursor.  Need to add
		check for case when there is no word.
	"""
	return vim.eval('expand("<cword>")') 

def findInPath(fileName):
	""" Searches the current directory and then the system path
		for the specified file.  Returns the full path or None.
	"""
	import posixpath
	for pathdir in (["."]+sys.path):
		if posixpath.isfile(pathdir+"/"+fileName):
			return pathdir+"/"+fileName

def getImportList():
	""" Returns list of imported modules from the current buffer.
		Does not allow duplicates.
	"""
	imports = []
	for line in vim.current.buffer:
		words = string.split(line)
		if (len(words)>0 and (words[0]=='import' or words[0]=='from')):
			if words[1] not in imports:
				imports.append(words[1])
	return imports


def pickAnEntryWithCancel(wordList):
	""" Presents a menu and returns the number of the selected item,
		or None if user enters <RET> or <ESC>

		wordList - list of menu items
	"""
	print "ret: Cancel"
	index = 0
	for word in wordList:
		print "%3d: %s"%(index, word)
		index = index + 1
	#input a number
	#looping until ESC/RET or a number 0-(len wordlist -1) is reached
	while 1:
		resp = vim.eval('input("")')
		if resp=="":
			return None
		try:
			index = string.atoi(resp)
			if index<len(wordList):
				print
				return index
		except ValueError:
			pass


def pickAnEntryWithCancel2(wordList):
	choices = "Cancel"
	for word in wordList:
		choices = choices + "\n" + word
	expString = 'confirm(\"Select word:\", \"%s\", 1)'	% choices
	resp = int(vim.eval(expString))
	if (resp == 1):
		return None
	else:
		return int(resp)-2

			

def changeWordUnderCursor(newWord):
	""" changes the current word under the cursor """
	cwuc = getWordUnderCursor()
	vim.command("normal b")
	(row, col) = vim.current.window.cursor
	vim.current.line = vim.current.line[0:col] \
	+ newWord \
	+ vim.current.line[col+len(cwuc)+1:]
	vim.command("normal e")
		



def buildMatchingWordList(searchWord, fileList, addCurrentBuffer=0):
	""" Returns a list of words matching word from a list of files

		* searchWord - word to match -matches all words that start with this one
		* fileList - list of files to check
	"""
	# build list of words that match from all imports that have .py source
	# speed this up by using a map?
	wordList = []
	regex = re.compile("(\W|\A)"+searchWord)
	regexWord = re.compile("\A"+searchWord+"[a-zA-Z0-9_]+")
	_addMatchingWords( vim.current.buffer, regex, regexWord, wordList)
	for f in fileList:
		lines = open(f).readlines()
		_addMatchingWords( lines, regex, regexWord, wordList)
	return wordList

def _addMatchingWords( lines, regex, regexWord, wordList):
		for line in lines:
			if (regex.search(line) != None):
				for word in string.split(line):
					regexWordMatch = regexWord.search(word)
					if regexWordMatch != None:
						alphaPartOfWord = word[0:regexWordMatch.span()[1]]
						if alphaPartOfWord not in wordList:
							wordList.append(alphaPartOfWord)




def completeWord():
	# get list of imported modules (does not recurse)
	importedModules = getImportList()

	# build list of imported modules that have .py source
	importedFiles = []
	for i in importedModules:
		p = findInPath(i+'.py')
		if (p != None):
			importedFiles.append(p)		

	# build list of matching words
	wordList = buildMatchingWordList(getWordUnderCursor(), importedFiles)
	
	# do ui and possible replacement	
	if len(wordList)==0:
		print "No matching words."
	else:
		resp =  pickAnEntryWithCancel2(wordList)
		if (resp != None):
			# replace current word under curser with word from list
			changeWordUnderCursor(wordList[resp])
	
	



vim.command("imap <DEL> <ESC>:python completeWord()<CR>")
