#!/usr/bin/python

keys = ['a', 'b', 'c']
values = [1, 2, 3]
dictionary = dict(zip(keys, values))
print dictionary

zlist = []
for xp in dictionary:
    zlist.append(xp)

print zlist

d = {keys[n]: values[n] for n in range(len(keys))}
print(d)
items = []
items.append(item)  # many times
# items is now complete
result = ''.join(fn(i) for i in items)
for key in d.keys():
    d[str(key)] = d[key]
    # do this:
if key in d:
    ...do something with d[key]

# not this:
if d.has_key(key):
    ...do something with d[key]
    def good_append(new_item, a_list=None):
    if a_list is None:
        a_list = []
    a_list.append(new_item)
    return a_list
Filter out blank rows from a CSV reader (or items from a list):

def filter_rows(row_iterator):
    for row in row_iterator:
        if row:
            yield row

data_file = open(path, 'rb')
irows = filter_rows(csv.reader(data_file))
