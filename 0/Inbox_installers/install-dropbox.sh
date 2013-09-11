#!/bin/sh
# Date: 02/09/2013 
# Author: Ahmed 

# 32-bit:
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

#64-bit:
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - 

# Next, run the Dropbox daemon from the newly created .dropbox-dist folder.

