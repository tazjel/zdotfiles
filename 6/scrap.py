#!/usr/bin/env python
# -*- coding: utf-8 -*-

import lxml.html
from lxml.html import parse
from urllib2 import urlopen
page = urlopen('http://www.google.com')
p = parse(page)
p.getroot()
page = urlopen('https://ar.wikisource.org/wiki/%D9%84%D8%B3%D8%A7%D9%86_%D8%A7%D9%84%D8%B9%D8%B1%D8%A8_:_%D8%A3%D8%A8%D8%A7-%D8%A3%D8%B5%D8%B1')
p = parse(page)
p.getroot()
xp = p.xpath('//span/text()')
for xx in xp:
    print xx
