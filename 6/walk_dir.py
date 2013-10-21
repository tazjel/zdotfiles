
import os,sys

class DirWalker(object):

    def walk(self,dir,meth):
        """ walks a directory, and executes a callback on each file """
        dir = os.path.abspath(dir)
        for file in [file for file in os.listdir(dir) if not file in [".",".."]]:
            nfile = os.path.join(dir,file)
            meth(nfile)
            if os.path.isdir(nfile):
                self.walk(nfile,meth)


#A super nice way to do! I used it to look for specific file type. Here is the one I modified.
#Enjoy!

import os,sys

class DirWalkr(object):
    def walk(self,dir,meth, fileType=”.xml”):
        “”" walks a directory, and executes a callback on each file “”"
        dir = os.path.abspath(dir)
        for file in [file for file in os.listdir(dir) if not file in [".",".."]]:
            nfile = os.path.join(dir,file)
            if(os.path.isfile(nfile)):
                basename, extention = os.path.splitext(nfile)
            if(extention == fileType):
                meth(nfile)
            if os.path.isdir(nfile):
                self.walk(nfile,meth)
            elif(os.path.isdir(nfile)):
                self.walk(nfile,meth)
