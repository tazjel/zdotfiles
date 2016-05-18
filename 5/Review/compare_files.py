#!/usr/bin/python
# audit-tool.py - A simple one way file comparision utility.
# Copyright 2011 13Cubed. All rights reserved. Written by: Richard Davis

import sys

def compareFiles(filename1, filename2, ignorecase):
  """
  Given two filenames and an ignorecase booelean, compares filename1
  against filename2 and returns list of the differences and a count of
  how many were found. If ignorecase is 1, the contents of both files
  are read in as lowercase so that case differences are ignored.
  """
  results = []

  try:
    f1 = open(filename1, 'rU')
  except IOError:
    print 'Could not find the specified file:', filename1
    sys.exit(1)

  try:
    f2 = open(filename2, 'rU')
  except IOError:
    print 'Could not find the specified file:', filename2
    sys.exit(1)

  list1 = f1.readlines()
  list2 = f2.readlines()

  f2.close()
  f1.close()

  if ignorecase == 1:
    for i in range(0,len(list1)):
      list1[i] = list1[i].lower()
    for i in range(0,len(list2)):
      list2[i] = list2[i].lower()

  diffs = set(list1) - set(list2)

  diffcount = 0

  for diff in diffs:
    results.append(diff)
    diffcount = diffcount + 1

  return results, diffcount

def main():
  if (len(sys.argv) < 3) or (len(sys.argv) > 4):
    print 'usage: ./audit.py filename1 filename2 [--ignorecase]'
    sys.exit(1)

  ignorecase = 0

  filename1 = sys.argv[1]
  filename2 = sys.argv[2]

  if len(sys.argv) == 4:
    option = sys.argv[3]
    if option == '--ignorecase':
      ignorecase = 1
    else:
      print 'unknown option: ' + option
      sys.exit(1)

  (results, diffcount) = compareFiles(filename1, filename2, ignorecase)

  if diffcount:
    print '\n%d difference(s) found:' % (diffcount)
    for line in results:
      print line,
  else:
    print '\nNo differences -- files are identical.'

  print '\nCopyright (C) 2011 13Cubed. All rights reserved.'

if __name__ == '__main__':
  main()
