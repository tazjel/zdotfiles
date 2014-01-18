#!/usr/bin/env python
#
# -*- coding: utf-8 -*-

import sys, os

from os import listdir
from os.path import islink, join, expanduser

home = expanduser("~/")
directory = expanduser("~/zdotfiles/link")

excludes = ["pure", "README.md", ".gitmodules", ".git", "bin"]
linux_only_excludes = ["Xresources", "xinitrc", "xmobarrc", "xmonad.hs",
"zprofile"]

try:
    if sys.argv[1] == "linux":
        pass
except IndexError:
    excludes = excludes + linux_only_excludes


files = [ f for f in listdir(directory) if f not in excludes]

zdirectory = expanduser("~/zdotfiles/link/.easystroke/")


for f in files:
    src = join(directory, f)
    dest = join(home, "%s" % f)

    if not islink(dest):
        print "Symlinking %s to %s" % (src, dest)
        os.symlink(src, dest)
    else:
        print "Unlinking %s to %s" % (src, dest)
        os.unlink(dest)
        print "Symlinking %s to %s" % (src, dest)
        os.symlink(src, dest)

# link easystroke

zhome = expanduser("~/.easystroke/")


wdirectory = expanduser("~/zdotfiles/link/.easystroke/")
whome = expanduser("~/.easystroke/")

wfiles = [ f for f in listdir(zdirectory)]

for x in wfiles :
    wsrc = join(wdirectory, "%s" % x)
    wdest = join(whome, "%s" % x)

    if not islink(wdest):
        print "easystroke Symlinking %s to %s" % (wsrc, wdest)
        os.symlink(wsrc, wdest)
    else:
        print "easystroke Unlinking %s to %s" % (wsrc, wdest)
        os.unlinkk(wdest)
        print "easystroke Symlinking %s to %s" % (wsrc, wdest)
        os.symlink(wsrc, wdest)
