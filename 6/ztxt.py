#!/usr/bin/env python3.3
from textblob import TextBlob

text = '''
The titular threat of The Blob has always struck me as the ultimate movie
monster: an insatiably hungry, amoeba-like mass able to penetrate
virtually any safeguard, capable of--as a doomed doctor chillingly
describes it--"assimilating flesh on contact.
Snide comparisons to gelatin be damned, it's a concept with the most
devastating of potential consequences, not unlike the grey goo scenario
proposed by technological theorists fearful of
artificial intelligence run rampant.
'''

blob = TextBlob(text)
blob.tags           # [(u'The', u'DT'), (u'titular', u'JJ'),
                    #  (u'threat', u'NN'), (u'of', u'IN'), ...]

blob.noun_phrases   # WordList(['titular threat', 'blob',
                    #            'ultimate movie monster',
                    #            'amoeba-like mass', ...])

for sentence in blob.sentences:
    print(sentence.sentiment)  # returns (polarity, subjectivity)
# (0.060, 0.605)
# (-0.341, 0.767)

blob.translate(to="es")  # 'La amenaza titular de The Blob...'
