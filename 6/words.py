
#http://stackoverflow.com/questions/18938302/remove-duplicate-remove-certain-letters-from-line-if-found


def wdouble(filename):
    new_line = ''
    with open(filename) as fin:
        for line in fin.readlines():
            words = line.split()    # list of words
            new_words = []
            unique_words = set()
            for word in words:
                if (word not in unique_words and
                        (not word.isdigit() or int(word) <= 65000)):
                    new_words.append(word)
                    unique_words.add(word)
            new_line = ' '.join(new_words)
        print new_line
wdouble('/home/ahmed/Dropbox/DCAR/qaDCA')
#def wdouble(filename):
    #seen = set()
    #with open(filename, 'r') as infile:
        #for line in infile:
            #for word in line.split():
                #if word in seen:
                     #return True
                #seen.add(word)
    #return False

#def double(filename):
    #seen = set()
    #with open(filename, 'r') as infile:
        #return (word in seen or seen.add(word) for line in infile for word in line.split())

##print double('/home/ahmed/Dropbox/DCAR/w_phrase.snip')
