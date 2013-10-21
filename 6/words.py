
#http://stackoverflow.com/questions/18938302/remove-duplicate-remove-certain-letters-from-line-if-found

def wdouble(filename):
    new_line = ''
    with open(filename) as fin:
        for line in fin.readlines():
            words = line.split()    # list of words
            new_words = []
            unique_words = ['conflict','Conflict Analysis & Resolution']
            for word in words:
                if (word not in unique_words and
                        (not word.isdigit() or int(word) <= 65000)):
                    new_words.append(word)
                    unique_words.append(word)
                new_line = ' '.join(new_words)
        return new_line
print wdouble('/home/ahmed/Dropbox/DCAR/aal-qa-conflict.txt')
#print [x for x in wdouble('/home/ahmed/Dropbox/DCAR/qaDCA')]
