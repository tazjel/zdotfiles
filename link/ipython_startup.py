#!/usr/bin/env python
#
# -*- coding: utf-8 -*-

import os, sys
import shutil
from os import listdir
from os.path import islink, join, expanduser
shutil.abspath('.')
cwd = os.getcwd()
home = expanduser("~/")
directory = expanduser("~/zdotfiles/link")
easystroke_directory = expanduser("~/zdotfiles/link/.easystroke")
easystroke_home = expanduser("~/.easystroke")
excludes = ["pure",]
linux_only_excludes = ["Xresources", "xinitrc", "xmobarrc", "xmonad.hs", "zprofile"]

def ww():
    for root, dirs, files in os.walk('.'):
        print("{0} has {1} files".format(root, len(files)))


try:
    if sys.argv[1] == "linux":
        pass
except IndexError:
    excludes = excludes + linux_only_excludes

def z_link(directory, home):
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


