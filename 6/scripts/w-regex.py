#!/usr/bin/env python


import re

def grep(pattern, file_obj, include_line_nums=False):
    grepper = re.compile(pattern)
    for line_num, line in enumerate(file_obj):
        if grepper.search(line):
            if include_line_nums:
                yield (line_num, line)
            else:
                yield line

if __name__ == '__main__':
    import sys
    for elem in grep('re', file(sys.argv[0])):
        print repr(elem)
    print '%' * 30
    #for elem in grep('re', file(sys.argv[0]), True):
        #print repr(elem)
