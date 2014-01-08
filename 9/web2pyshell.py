#!/usr/bin/env python
#
# -*- coding: utf-8 -*-



import os, sys, re

from shell import *

app=raw_input('app to load environment for:')

for k,v in env(app).items():
    locals()[k]=v
