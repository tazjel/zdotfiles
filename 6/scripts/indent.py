 #Control how much indentation to trim
#http://code.activestate.com/recipes/145672-multi-line-string-block-formatting/

def ltrimBlock(s, i=0, tz=4, sp=' ', n='\n'):
    p = sp * i  # p = line prefix

    # break the lines down
    st = s.strip(n).expandtabs(sz).split(n)   # list of lines

    # get the smallest indent
    w = min([len(l)-len(l.lstrip()) for l in st if l.lstrip()])

    # rebuild block with new indent
    b = n.join([p + l[w:] for l in st])

    return b
