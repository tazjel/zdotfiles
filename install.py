#!/usr/bin/env python
#
# -*- coding: utf-8 -*-

import os, sys
import shutil
from os import listdir
from os.path import islink, join, expanduser

home = expanduser("~/")
directory = expanduser("~/zdotfiles/link")
easystroke_directory = expanduser("~/zdotfiles/link/.easystroke")
easystroke_home = expanduser("~/.easystroke")
excludes = ["pure",]
linux_only_excludes = ["Xresources", "xinitrc", "xmobarrc", "xmonad.hs", "zprofile"]
#os.mkdir
#shutil.move(src, dst)

shutil.abspath('.')

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

z_link(directory, home)
z_link(easystroke_directory, easystroke_home)
