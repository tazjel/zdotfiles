#!/usr/bin/env python
#
# -*- coding: utf-8 -*-
"""
File: Conflict Analysis & Resolution
Author: Ahmed
Email: 0
Github: 0
Description: APA citation
"""
import os, sys, re
import datetime
import time

currentmonth = datetime.datetime.now().month
monthdict={1:'january', 2:'february', 3:'march', 4:'april', 5:'may', 6:'june', 7:'july', 8:'august', 9:'september', 10:'october', 11:'november', 12:'december'}

currentmonth = monthdict[currentmonth]
mdy = "12/2/2013"
chosen_date = mdy
chosen_date = chosen_date.split('/')

month = chosen_date[0]
day = chosen_date[1]
year = chosen_date[2]

#xp = " ".join()
 #"%s"
#W
print(month)
print(currentmonth)

#(                # begin capture
  #[A-Z]            # one uppercase letter  \ First Word
  #[a-z]+           # 1+ lowercase letters  /
  #(?=\s[A-Z])      # must have a space and uppercase letter following it
  #(?:                # non-capturing group
    #\s               # space
    #[A-Z]            # uppercase letter   \ Additional Word(s)
    #[a-z]+           # lowercase letter   /
  #)+              # group can be repeated (more words)
#)
