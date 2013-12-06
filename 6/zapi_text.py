"""
File: zapi_text.py
Author: Steve Francia <steve.francia@gmail.com>
Email: 0
Github: 0
Description:
"""

__author__ = "Ryan Kulla (rkulla AT gmail DOT com)"
__version__ = "1.2.1"
__copyright__ = "Copyright (c) 2003-2013 Ryan Kulla"


import os
import sys
import types
import shutil

def zseqz(zsq,zseen):
    """docstring for zseqz"""
    zsq = []
    zseen = set()
    for i in zsq:
        if i in (z_safe):
            zsq.append(i)
            continue
        elif i not in zseen:
           zsq.append(i)
        zseen.add(i)
    return zsq


def get_yesno(msg="[Y/n]?"):
    """

    Returns True if user inputs 'n', 'Y', "yes", "Yes"...
    Returns False if user inputs 'n', 'N', "no", "No"...
    If they enter an invalid option it tells them so and asks again.
    Hitting Enter is equivalent to answering Yes.
    Takes an optional message to display, defaults to "[Y/n]?".

    """
    while True:
        answer = raw_input(msg)
        if answer == '':
            return True
        elif len(answer):
            answer = answer.lower()[0]
            if answer == 'y':
                return True
                break
            elif answer == 'n':
                return False
                break
            else:
                print "Invalid option. Please try again."
                continue
