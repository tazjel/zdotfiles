#!/usr/bin/python
 
import sys
import re
 
def ParseLog(filename, search_string):
  try:
    f = open(filename, 'rU')
  except IOError:
    print '\n*** I/O Error: Can\'t read file', filename, '***\n'
    return
 
  lines = f.readlines()
  for line in lines:
    result = re.search(search_string, line)
    if result:
      print line,
 
  f.close()
 
  return
 
def main():
  if len(sys.argv) < 2:
    print 'usage: ./checklog filename1 filename2 filename3 ...'
    sys.exit(0)
 
  args = sys.argv
  args.remove(sys.argv[0])
 
  search_string = raw_input('\nPlease enter RegEx search string: ')
 
  for arg in args:
    ParseLog(arg, search_string)
 
  print '\nCopyright (C) 2011 13Cubed. All rights reserved.'
 
if __name__ == '__main__':
  main()