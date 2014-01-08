#!/usr/bin/python


### Imports ###
import nltk
import re
import sys
import os
###############

def regexp_answer(strQuestion, listQuestion, articleFile):
	"""Takes a question list tagged and tokenized and attempts to return a true/false value for easy questions."""
	
	fullStr = ""
	
	### First, try to answer the question using a regex ###		
	print "Trying to answer: " + strQuestion
	
	### Build the regex. Remove the question word and the punctuation. ###
	regex = ""
	flag = 0			### Flag if we've just passed a noun or not ###
	
	### For each tagged word tuple in the question ###
	for group in listQuestion[1:-1]:
		### If the word is a noun, either plural or singular, up our flag count ###
		if(group[1] == "NN" or group[1] == "NNS"):
			flag += 1
		### If this is the first noun, it is probably the subject of the sentence ###
		if(flag == 1):
			### Safe to assume we can pop the question verb in here to form a statement? ###
			regex += group[0] + " " + listQuestion[0][0] + " "
			flag += 1
		else:
			regex += group[0] + " "
		
	### Trim the excess spaces from beginning / end ###
	regex = regex.strip()
	
	### Lets see what our regex actually looks like now ###
	print "DEBUG: Regex = " + "(" + regex + ")"
	
	
	### Read the article ###
	article = articleFile.read()
	
	### Print the length of the article in words (just as a sanity check here) ###
	print "DEBUG: " + str(len(article))
	
	### Search the article for our regex ###
	answer = re.findall(regex, article, re.IGNORECASE)
	
	if(answer[0].lower() == regex.lower()):
		print "Yes"
	else:
		print "No"