
# -*- coding: utf-8 -*-
'''This file is adapted from the pattern library.

URL: http://www.clips.ua.ac.be/pages/pattern-web
Licence: BSD
'''
from __future__ import unicode_literals
import string
import codecs
from itertools import chain
import types
import os
import re
from xml.etree import cElementTree

#from .compat import text_type, basestring, imap, unicode, binary_type, PY2

try:
    MODULE = os.path.dirname(os.path.abspath(__file__))
except:
    MODULE = ""

SLASH, WORD, POS, CHUNK, PNP, REL, ANCHOR, LEMMA = \
    "&slash;", "word", "part-of-speech", "chunk", "preposition", "relation", "anchor", "lemma"


# String functions
def decode_string(v, encoding="utf-8"):
    """ Returns the given value as a Unicode string (if possible).
    """
    if isinstance(encoding, basestring):
        encoding = ((encoding,),) + (("windows-1252",), ("utf-8", "ignore"))
    if isinstance(v, binary_type):
        for e in encoding:
            try:
                return v.decode(*e)
            except:
                pass
        return v
    return unicode(v)


def encode_string(v, encoding="utf-8"):
    """ Returns the given value as a Python byte string (if possible).
    """
    if isinstance(encoding, basestring):
        encoding = ((encoding,),) + (("windows-1252",), ("utf-8", "ignore"))
    if isinstance(v, unicode):
        for e in encoding:
            try:
                return v.encode(*e)
            except:
                pass
        return v
    return str(v)

decode_utf8 = decode_string
encode_utf8 = encode_string
