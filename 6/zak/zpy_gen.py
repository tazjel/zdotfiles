def step(ext, dirname, names):
    ext = ext.lower()

    for name in names:
        if name.lower().endswith(ext):
            print os.path.join(dirname, name)

# We only need to import this module
import os.path

# The top argument for walk. The
# Python27/Lib/site-packages folder in my case

topdir = '.'
# The arg argument for walk, and subsequently ext for step

exten = '.txt'

def step(ext, dirname, names):
    ext = ext.lower()

    for name in names:
        if name.lower().endswith(ext):
            print(os.path.join(dirname, name))

# Start the walk
os.path.walk(topdir, step, exten)

import os

# The top argument for walk
topdir = '.'

# The extension to search for
exten = '.txt'

for dirpath, dirnames, files in os.walk(topdir):
    for name in files:
        if name.lower().endswith(exten):
            print(os.path.join(dirpath, name))
2

with open(logpath, 'a') as logfile:
    logfile.write('%s\n' % os.path.join(dirname, name))

# We only need to import this module
import os.path

# The top argument for walk. The
# Python27/Lib/site-packages folder in my case.
topdir = '.'

# The arg argument for walk, and subsequently ext for step
exten = '.txt'

logname = 'findfiletype.log'

def step((ext, logpath), dirname, names):
    ext = ext.lower()

    for name in names:
        if name.lower().endswith(ext):
            # Instead of printing, open up the log file for appending
            with open(logpath, 'a') as logfile:
                logfile.write('%s\n' % os.path.join(dirname, name))

# Change the arg to a tuple containing the file
# extension and the log file name. Start the walk.
os.path.walk(topdir, step, (exten, logname))

#The modified version Python 3.x script is much less awkward:

import os

# The top argument for walk
topdir = '.'
# The extension to search for
exten = '.txt'
logname = 'findfiletype.log'
# What will be logged
results = str()

for dirpath, dirnames, files in os.walk(topdir):
    for name in files:
        if name.lower().endswith(exten):
            # Save to results string instead of printing
            results += '%s\n' % os.path.join(dirpath, name)

# Write results to logfile
with open(logname, 'w') as logfile:
    logfile.write(results)
