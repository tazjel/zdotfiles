#!/usr/bin/env python
#
# -*- coding: utf-8 -*-

import os, sys
from os import listdir
from os.path import islink, join, expanduser

home = expanduser("~/")
directory = expanduser("~/zdotfiles/link")

excludes = ["pure",]
linux_only_excludes = ["Xresources", "xinitrc", "xmobarrc", "xmonad.hs", "zprofile"]

try:
    if sys.argv[1] == "linux":
        pass
except IndexError:
    excludes = excludes + linux_only_excludes


#files = [ f for f in listdir(directory) ]


#for f in files:
    #src = join(directory, f)
    #dest = join(home, f)

    #if not islink(dest):
        #print "Symlinking %s to %s" % (src, dest)
        #os.symlink(src, dest)
    #else:
        #print "Unlinking %s to %s" % (src, dest)
        #os.unlink(dest)
        #print "Symlinking %s to %s" % (src, dest)
        #os.symlink(src, dest)


def z_link(directory):
    files = [ f for f in listdir(directory) ]
    for X in files:
        src = join(directory, X)
        dest = join(home, X)
        if not islink(dest):
            print("linking %s to %s") % (src, dest)
            try:
                os.symlink(src, dest)
            except OSError:
                pass


        else:
            print("Unlinking %s to %s") % (str(src), str(dest))
            os.unlink(dest)
            print("Symlinking %s to %s") % (src, dest)
            try:
                os.symlink(src, dest)
            except OSError:
                pass

z_link(directory)
