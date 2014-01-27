#!/usr/bin/env python
#
# -*- coding: utf-8 -*-

import sys, os

from os import listdir
from os.path import islink, join, expanduser

home = expanduser("~/")
directory = expanduser("~/zdotfiles/link")

#excludes = ["pure", "README.md", ".gitmodules", ".git", "bin"]
#linux_only_excludes = ["Xresources", "xinitrc", "xmobarrc", "xmonad.hs", "zprofile"]

#try:
    #if sys.argv[1] == "linux":
        #pass
#except IndexError:
    #excludes = excludes + linux_only_excludes


files = [ f for f in listdir(directory) ]


for f in files:
    src = join(directory, f)
    dest = join(home, f)

    if not islink(dest):
        print "Symlinking %s to %s" % (src, dest)
        os.symlink(src, dest)
    else:
        print "Unlinking %s to %s" % (src, dest)
        os.unlink(dest)
        print "Symlinking %s to %s" % (src, dest)
        os.symlink(src, dest)
