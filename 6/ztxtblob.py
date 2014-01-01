#!/usr/bin/python
from random import randrange,random
from textblob import TextBlob
from textblob.sentiments import NaiveBayesAnalyzer
blob = TextBlob("I love this library", analyzer=NaiveBayesAnalyzer())
print  blob.sentiment
