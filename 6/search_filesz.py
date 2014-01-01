#Make sure you understand the three return values of os.walk:

#for root, subFolders, files in os.walk(rootdir):
#has the following meaning:

#root: Current path which is "walked through"
#subFolders: Files in root of type directory
#files: Files in root (not in subFolders) of type other than directory
#And please use os.path.join instead of concatenating with a slash! Your problem is filePath = rootdir + '/' + file - you must concatenate the currently "walked" folder instead of the topmost folder. So that must be filePath = os.path.join(root, file). BTW "file" is a builtin, so you don't normally use it as variable name.

#Another problem are your loops, which should be like this, for example:

import os, re
import sys

rootdir = sys.argv[1]

for root, subFolders, files in os.walk(rootdir):
    outfileName = os.path.join(root, "py-outfile.txt")
    print "outfileName is " + outfileName
    with open( outfileName, 'w' ) as folderOut:
        for folder in subFolders:
            print "%s has subdirectory %s" % (root, folder)

        for filename in files:
            filePath = os.path.join(root, filename)

            with open( filePath, 'r' ) as f:
                toWrite = f.read()
                folderOut.write("The file %s contains %s" % (filePath, toWrite))
                folderOut.write( toWrite )




newlist = []
for word in oldlist:
    newlist.append(word.upper())



def iterwords(fh):
    for number, line in enumerate(fh):
        for word in re.split(r'\s+', line.strip()):
            yield number, word


import sys
import re


def iterwords(fh):
    for number, line in enumerate(fh):
        for word in re.split(r'\s+', line.strip()):
            # Preprocess the words here, for example to strip out punctuation
            # (the following example is sloooow, compile this regex if you
            # really want to use it):
            #
            #     word = re.sub(r'[,.:]', '', word)
            #
            word = word.lower()
            yield number, word



def search(fh, query):
    query = re.split(r'\s+', query.strip().lower())
    matches = []
    words = iterwords(fh)

    for line, word in words:
        lines_count = 1
        current_line = line
        for keyword in query:
            if keyword == word:
                next_line, word = next(words)
                if next_line > current_line:
                    lines_count += 1
                    current_line = next_line
            else:
                break
        else:
            matches.append((line, lines_count))

    return tuple(matches)



if __name__ == '__main__':
    query = sys.argv[1]
    fh = open(sys.argv[2])

    matches = search(fh, query)

    # Form here on it's only presentation
    fh.seek(0)
    lines = enumerate(fh)
    for lineno, linecount in matches:
        number, line = next(lines)
        while number < lineno:
            number, line = next(lines)

        result_lines = [line]

        for i in range(linecount-1):
            result_lines.append(next(lines)[1])

        print "Match found on line {0} (spawning {1} lines):\n > {2}".format(
            lineno, linecount, ' > '.join(result_lines).strip())



#If you didn't know, the "with" statement for files is a shorthand:


with open("filename", "r") as f:
    iterwords()

# is effectively the same as

f = open("filename", "r")
try:
    iterwords()
finally:
    f.close()


with open('output.txt','w') as fout:
    for root, subFolders, files in os.walk(rootdir):
        for file in files:
            if (file == 'data.txt'):
                #print file
                with open(os.path.join(root, file), 'r') as fin:
                    for lines in fin:
                        iterwords()



import fnmatch
import os

matches = []
for root, dirnames, filenames in os.walk('src'):
  for filename in fnmatch.filter(filenames, '*.c'):
      matches.append(os.path.join(root, filename))





#Similar to other solutions, but using fnmatch.fnmatch instead of glob, since os.walk already listed the filenames:
import os, fnmatch


def find_files(directory, pattern):
    for root, dirs, files in os.walk(directory):
        for basename in files:
            if fnmatch.fnmatch(basename, pattern):
                filename = os.path.join(root, basename)
                yield filename


for filename in find_files('src', '*.c'):
    print 'Found C source:', filename
