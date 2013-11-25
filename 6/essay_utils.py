#!/usr/bin/env python


import os
import nltk

from nltk import pos_tag, word_tokenize

essays = [[line.strip() for line in\
           open(os.path.join("/home/ahmed/Dropbox/Causes.txt")).readlines()
           if len(line.strip()) > 1] for essay in range(1, 21)]


def essay_sent(num, sent=0):
    return word_tokenize(essay_sentences(num)[sent])


def essay_sent_tags(num, sent=0):
    return [tag for word, tag in pos_tag(essay_sent(num, sent))]


def essay_text(num):
    return " ".join(essays[(num - 1)])


def essay_sentences(num):
    essay = essays[int(num)]
    text = "\n".join(essay)
    text.replace("\n", ".")
    return [sent.strip() for sent in text.split(".")]

xp =essay_sent_tags(essays)

print(xp)
