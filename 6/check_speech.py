#!/usr/bin/env python

"""
This script checks your wording and speech in a scientific paper. 
It shows you some hints what might be wrong. Not every hit is really bad. 
There could be a lot of false positives and vice versa.

This should be common rules for writing scientific papers, but when english 
is not your mother tongue or native language, some phrases can just hop 
through. Also when you are tired you tend to write sloppy.

The results are better, if you do not break your text lines in your document
by yourself, but rather use something like smart or soft line breaks. Also try 
to apply it on pure text, not marked up (LaTeX).
"""

__author__  = "Uwe Dauernheim"
__email__   = "uwe@dauernheim.net"
__version__ = "1.0"

##############################################################################

import sys, os, operator
import check_speech, policy_rules

# sys.argv.append("../_Report/src/main.tex") # For testing purpose...

if __name__ == "__main__":
  if len(sys.argv) < 2:
    print("Usage: %s [option] <textfile>" % os.path.basename(sys.argv[0]))
    print("")
    print("  -h, --help  Show this help screen.")
    print("")
    sys.exit(-1)
  elif sys.argv[1] == "--help" or sys.argv[1] == "-h":
    print(getattr(check_speech, "__doc__"))
    print("")
    print("Policy rules")
    print("============")
    print("")
    for Def in dir(policy_rules): 
      Fun = getattr(policy_rules, Def)
      if callable(Fun) and Def.startswith("policy_"):
        print("%s: %s" % (Def, getattr(Fun, "__doc__")))
    sys.exit(0)
  
  try:
    File = open(sys.argv[1], "rb")
    FileContent = File.read()
    File.close()
  except IOError:
    print("%s: Could not open file!" % sys.argv[1])
    sys.exit(-1)
  
  Founds = []
  for Def in dir(policy_rules): 
    Fun = getattr(policy_rules, Def)
    if callable(Fun) and Def.startswith("policy_"):
      for RegExp in Fun():
        for Match in RegExp.finditer(FileContent):
          Line = FileContent.count("\n", 0, Match.start(0)) + 1
          Policy = Def.replace("policy_", "").replace("_", " ").capitalize()
          Pattern = RegExp.pattern
          Text = Match.group(0).replace(os.linesep, " ")
          Founds.append((Line, Policy, Pattern, Text))
  
  Founds.sort(key=operator.itemgetter(0))
  for Found in Founds:
    print("%4d %-18s ...%s..." % (Found[0], Found[1]+":", Found[3]))
