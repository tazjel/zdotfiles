#!/usr/bin/env python

# testing os.walk

import os
import re

regex = re.compile('^[^\.]\w+\.py$')
file_list = []

for root, dirs, files in os.walk('..'):
    print 'root =', root
    print 'files =', files
    print '-------'
    for name in files:
        if regex.search(name):
            file_list.append(os.path.join(root,name))
    if 'CVS' in dirs:
        dirs.remove('CVS') # don't visit CVS directories

print file_list
