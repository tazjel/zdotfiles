#!/usr/bin/env python


import codecs
import os
import re
import shutil
import string
import tempfile
from os.path import join, isdir, realpath, exists
from os import link, symlink, getcwd, listdir, stat
from inspect import cleandoc
from stat import S_IEXEC

#import ranger
#from ranger.ext.direction import Direction
#from ranger.ext.relative_symlink import relative_symlink
#from ranger.ext.keybinding_parser import key_to_string, construct_keybinding
#from ranger.ext.shell_escape import shell_quote
#from ranger.ext.next_available_filename import next_available_filename
#from ranger.ext.rifle import squash_flags, ASK_COMMAND
#from ranger.core.shared import FileManagerAware, EnvironmentAware, \
#        SettingsAware
#from ranger.core.tab import Tab
#from ranger.container.file import File
#from ranger.core.loader import CommandLoader, CopyLoader
#from ranger.container.settings import ALLOWED_SETTINGS
