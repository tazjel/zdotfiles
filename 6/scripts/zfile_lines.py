import os, re
import sys


newlist = []
for word in oldlist:
    newlist.append(word.upper())

def iterwords(fh):
    for number, line in enumerate(fh):
        for word in re.split(r'\s+', line.strip()):
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


