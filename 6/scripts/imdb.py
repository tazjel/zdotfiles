#! /usr/bin/python

import os, sys, re

browser = "chromium-browser"

def nameSplit(name):
	(dirName, fileName) = os.path.split(name)
	(fileBaseName, fileExtension)=os.path.splitext(fileName)
	return dirName, fileName, fileBaseName, fileExtension


if len(sys.argv) > 1:
        
                file = nameSplit(sys.argv[1])
                name = file[2]
                
                name = re.split('\d\d\d\d',name)[0].replace('cd1','').replace('cd2','')
                name = name.replace('.', ' ').replace('_',' ')
                if name[-1] == '(' or name[-1] == '[':
                        name = name[:-1]
                name = name.strip()
                os.system(browser+''' "google.com/search?btnI=1&q='''+ name + ''' imdb"''')

else:
        print 'filename required as argument'