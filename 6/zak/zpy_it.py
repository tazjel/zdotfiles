#!/bin/python

import os
import fnmatch

def gen_find(filepat,top):
    for path, dirlist, filelist in os.walk(top):
        for name in fnmatch.filter(filelist,filepat):
            yield os.path.join(path,name)

# Example use

if __name__ == '__main__':
    lognames = gen_find("w","www")
    for name in lognames:
        print name

import re
pat = re.compile(r"(\S+)|(<[^>]*>)")

def scanner(text):
	for m in pat.finditer(text):
		token = m.group(0)
		print("Feeding:", repr(token))
		yield token
	yield None

text = "<foo> This is a <b> foo file </b> you know. </foo>"
token_stream = scanner(text)

def parse_elem(opening_tag):
	name = opening_tag[1:-1]
	closing_tag = "</%s>" % name
	items = parse_items(closing_tag)
	return (name, items)

def parse_items(closing_tag = None):
	elems = []
	while 1:
		token = next(token_stream)
		if not token:
			break # EOF
		if is_opening_tag(token):
			elems.append(parse_elem(token))
		elif token == closing_tag:
			break
		else:
			elems.append(token)
	return elems

def is_opening_tag(token):
	return token.startswith("<") and not token.startswith("</")

tree = parse_items()
print(tree)
