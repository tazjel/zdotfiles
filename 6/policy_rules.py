import re

def policy_first_person():
  """
  Don't use the first person. Use third person.
  """
  return \
  re.compile(r"\s+I\s+", re.I), \
  re.compile(r"\s+me\s+", re.I), \
  re.compile(r"\s+we\s+", re.I), \
  re.compile(r"\s+our\s+", re.I), \
  re.compile(r"\s+us\s+", re.I)

def policy_second_person():
  """
  Don't use second person. Use third person.
  """
  return \
  re.compile(r"\s+you\s+", re.I), \
  re.compile(r"\s+your\s+", re.I)

def policy_negative():
  """
  Don't use negation. Use e.g. \"It didn't work\" vs. \"It did crash\".
  """
  return \
  re.compile(r"did not", re.I), \
  re.compile(r"does not", re.I), \
  re.compile(r"can not", re.I)

def policy_passive_voice():
  """
  Don't use passive voice.
  """
  return \
  re.compile(r"\s+is\s+[^\.\;\:]*?\s+by", re.I), \
  re.compile(r"\s+was\s+[^\.\;\:]*?\s+by", re.I), \
  re.compile(r"\s+has\s+[^\.\;\:]*?\s+by", re.I), \
  re.compile(r"\s+have\s+[^\.\;\:]*?\s+by", re.I), \
  re.compile(r"\s+had\s+[^\.\;\:]*?\s+by", re.I)

def policy_command_instruction():
  """
  Don't use commands or instruct your reader.
  """
  return \
  re.compile(r"be sure to", re.I), \
  re.compile(r"need", re.I), \
  re.compile(r"must", re.I), \
  re.compile(r"should", re.I)

def policy_uncertainty():
  """
  Don't use uncertainties.
  """
  return \
  re.compile(r"could", re.I), \
  re.compile(r"might", re.I), \
  re.compile(r"may", re.I), \
  re.compile(r"maybe", re.I), \
  re.compile(r"probably", re.I)

def policy_announcement():
  """
  Don't announce your work. 
  Bad: "In this paper, I will discuss how ABC..."
  Good: "ABC has made a significant impact on the teenage population due to its..."
  """
  return \
  re.compile(r"In this paper", re.I), \
  re.compile(r"I will discuss", re.I), \
  re.compile(r"This paper will", re.I), \
  re.compile(r"In the article", re.I), \
  re.compile(r"In the essay", re.I)

def policy_punctation_outside_quote():
  """
  Use punctation always outside a quote.
  """
  return \
  re.compile(r"\"\.", re.I), \
  re.compile(r"\",", re.I), \
  re.compile(r"\";", re.I), \
  re.compile(r"''\.", re.I), \
  re.compile(r"'',", re.I), \
  re.compile(r"'';", re.I)

def policy_gerundial():
  """
  Don't use gerundial.
  """
  return \
  re.compile(r"is[^\.\;\:]*?ing", re.I), \
  re.compile(r"are[^\.\;\:]*?ing", re.I), \
  re.compile(r"was[^\.\;\:]*?ing", re.I), \
  re.compile(r"were[^\.\;\:]*?ing", re.I), \
  re.compile(r"have[^\.\;\:]*?ing", re.I)

def policy_vague_pronous():
  """
  Don't use vague pronous.
  Bad: This, these, it, you
  Good: One
  """
  return \
  re.compile(r"you", re.I), \
  re.compile(r"\s+it\s+", re.I), \
  re.compile(r"it is", re.I), \
  re.compile(r"there is", re.I), \
  re.compile(r"there are", re.I), \
  re.compile(r"these", re.I), \
  re.compile(r"this", re.I), \
  re.compile(r"that", re.I), \
  re.compile(r"which", re.I)

def policy_too_few_conjunctive_adverb():
  """
  Don't use too few conjunctive adverbs.
  """
  return \
  re.compile(r"however", re.I), \
  re.compile(r"therefore", re.I), \
  re.compile(r"then", re.I), \
  re.compile(r"therefore", re.I), \
  re.compile(r"nevertheless", re.I), \
  re.compile(r"accordingly", re.I), \
  re.compile(r"as a result", re.I), \
  re.compile(r"moreover", re.I), \
  re.compile(r"even so", re.I), \
  re.compile(r"rather", re.I), \
  re.compile(r"for example", re.I)

def policy_phrase_and_word():
  """
  Don't think, believe or feel. State.
  """
  return \
  re.compile(r"I think that", re.I), \
  re.compile(r"I believe that", re.I), \
  re.compile(r"I feel that", re.I), \
  re.compile(r"in my opinion", re.I), \
  \
  re.compile(r" of ", re.I), \
  re.compile(r"by", re.I), \
  re.compile(r"being", re.I), \
  re.compile(r"one", re.I)

def policy_editorialization():
  """
  Don't editorialize your work.
  """
  return \
  re.compile(r"unfortunately", re.I), \
  re.compile(r"virtually impossible", re.I), \
  re.compile(r"well worth", re.I), \
  re.compile(r"obviously", re.I), \
  re.compile(r"hopefully", re.I), \
  re.compile(r"fortunately", re.I), \
  re.compile(r"invaluable", re.I), \
  re.compile(r"undoubtedly", re.I), \
  re.compile(r"assuredly", re.I), \
  re.compile(r"literally", re.I)

def policy_contraction():
  """
  Don't use contractions. Write them out. Correctly.
  """
  return \
  re.compile(r"can't", re.I), \
  re.compile(r"can not", re.I), \
  re.compile(r"couldn't", re.I), \
  re.compile(r"won't", re.I), \
  re.compile(r"wouldn't", re.I), \
  re.compile(r"shouldn't", re.I), \
  re.compile(r"mustn't", re.I), \
  re.compile(r"don't", re.I), \
  re.compile(r"does't", re.I), \
  re.compile(r"didn't", re.I), \
  re.compile(r"ain't", re.I), \
  re.compile(r"haven't", re.I), \
  re.compile(r"hadn't", re.I), \
  re.compile(r"hasn't", re.I)

def policy_sentence_begin():
  """
  Don't start a sentence with the wrong words.
  """
  return \
  re.compile(r"\.\s*As *"), \
  re.compile(r"\.\s*It *"), \
  re.compile(r"\.\s*In *"), \
  re.compile(r"\.\s*There *"), \
  re.compile(r"\.\s*This *"), \
  re.compile(r"\.\s*That *"), \
  re.compile(r"\.\s*They *"), \
  re.compile(r"\.\s*Their *"), \
  re.compile(r"\.\s*By *"), \
  re.compile(r"\.\s*If *"), \
  re.compile(r"\.\s*When *"), \
  re.compile(r"\.\s*While *"), \
  re.compile(r"\.\s*With *"), \
  re.compile(r"\.\s*Because *"), \
  re.compile(r"\.\s*Through *"), \
  re.compile(r"\.\s*With *")

def policy_redundant_pair():
  """
  Don't use redundant pairs.
  """
  return \
  re.compile(r"past memories", re.I), \
  re.compile(r"various differences", re.I), \
  re.compile(r"each individual", re.I), \
  re.compile(r"basic fundamentals", re.I), \
  re.compile(r"true facts", re.I), \
  re.compile(r"important essentials", re.I), \
  re.compile(r"future plans", re.I), \
  \
  re.compile(r"terrible tragedy", re.I), \
  re.compile(r"end result", re.I), \
  re.compile(r"final outcome", re.I), \
  re.compile(r"free gift", re.I), \
  re.compile(r"past history", re.I), \
  re.compile(r"unexpected surprise", re.I), \
  re.compile(r"sudden crisis", re.I), \
  re.compile(r"very unique", re.I), \
  \
  re.compile(r"large in size", re.I), \
  re.compile(r"often times", re.I), \
  re.compile(r"of a bright color", re.I), \
  re.compile(r"heavy in weight", re.I), \
  re.compile(r"period in time", re.I), \
  re.compile(r"round in shape", re.I), \
  re.compile(r"at an early time", re.I), \
  re.compile(r"economics field", re.I), \
  \
  re.compile(r"of cheap quality", re.I), \
  re.compile(r"honest in character", re.I), \
  re.compile(r"of an uncertain condition", re.I), \
  re.compile(r"in a confused state", re.I), \
  re.compile(r"unusual in nature", re.I), \
  re.compile(r"extreme in degree", re.I), \
  re.compile(r"of a strange type", re.I)

def policy_wordiness():
  """
  Don't bring gap fillers and be wordiness.
  """
  return \
  re.compile(r"the fact that", re.I), \
  re.compile(r"at that point in time", re.I), \
  re.compile(r"in other words", re.I), \
  re.compile(r"play a role", re.I), \
  re.compile(r"due to", re.I), \
  re.compile(r"as a result of", re.I), \
  re.compile(r"as to why", re.I), \
  re.compile(r"whereas", re.I), \
  re.compile(r"thus", re.I), \
  re.compile(r"therefore", re.I), \
  re.compile(r"which is", re.I), \
  re.compile(r"the most common", re.I), \
  re.compile(r"one of", re.I), \
  re.compile(r"not only", re.I), \
  re.compile(r"but also", re.I), \
  re.compile(r"very", re.I), \
  re.compile(r"extremely", re.I), \
  re.compile(r"really", re.I), \
  re.compile(r"a lot", re.I), \
  re.compile(r"great", re.I), \
  re.compile(r"best", re.I), \
  re.compile(r"usually", re.I), \
  re.compile(r"greater", re.I), \
  re.compile(r"many", re.I), \
  re.compile(r"most", re.I), \
  re.compile(r"some", re.I), \
  re.compile(r"a little", re.I), \
  re.compile(r"a few", re.I), \
  re.compile(r"often", re.I), \
  re.compile(r"sometimes", re.I), \
  re.compile(r"oftentimes", re.I), \
  re.compile(r"can be established", re.I), \
  re.compile(r"such as", re.I), \
  re.compile(r"just as", re.I), \
  re.compile(r"of this", re.I), \
  re.compile(r"is that", re.I), \
  re.compile(r"the fact that", re.I), \
  re.compile(r"means that", re.I), \
  re.compile(r"for many reasons", re.I), \
  re.compile(r"all these", re.I), \
  re.compile(r"serve to", re.I), \
  re.compile(r"to name a few", re.I), \
  re.compile(r"in order to", re.I), \
  re.compile(r"when it comes to", re.I), \
  re.compile(r"as noted", re.I), \
  re.compile(r"on the part of", re.I), \
  re.compile(r"by means of", re.I), \
  re.compile(r"after all", re.I), \
  re.compile(r"this means that", re.I), \
  re.compile(r"the reason is", re.I), \
  re.compile(r"in general", re.I), \
  re.compile(r"again", re.I), \
  re.compile(r"once again", re.I), \
  re.compile(r"important", re.I), \
  re.compile(r"imperative", re.I), \
  re.compile(r"vital", re.I), \
  re.compile(r"essential", re.I), \
  re.compile(r"valuable", re.I), \
  re.compile(r"key", re.I), \
  re.compile(r"inevitable", re.I), \
  re.compile(r"paramount", re.I), \
  re.compile(r"significant", re.I), \
  re.compile(r"necessary", re.I), \
  re.compile(r"core", re.I), \
  re.compile(r"fundamental", re.I), \
  re.compile(r"priority", re.I), \
  re.compile(r"pivotal", re.I), \
  re.compile(r"evident", re.I), \
  re.compile(r"unique", re.I)

def policy_terms_and_phrases():
  """
  Don't use common sloppy language words.
  """
  return \
  re.compile(r"bad", re.I), \
  re.compile(r"good", re.I), \
  re.compile(r"nice", re.I), \
  re.compile(r"terrible", re.I), \
  re.compile(r"stupid", re.I), \
  re.compile(r"true", re.I), \
  re.compile(r"pure", re.I), \
  re.compile(r"perfect", re.I), \
  re.compile(r"an ideal solution", re.I), \
  re.compile(r"today", re.I), \
  re.compile(r"modern times", re.I), \
  re.compile(r"soon", re.I), \
  re.compile(r"surpris", re.I), \
  re.compile(r"seems", re.I), \
  re.compile(r"seemingly", re.I), \
  re.compile(r"would seem to show", re.I), \
  re.compile(r"in terms of", re.I), \
  re.compile(r"based on", re.I), \
  re.compile(r"-based", re.I), \
  re.compile(r"as the basis of", re.I), \
  re.compile(r"different", re.I), \
  re.compile(r"in light of", re.I), \
  re.compile(r"lots of", re.I), \
  re.compile(r"kind of", re.I), \
  re.compile(r"type of", re.I), \
  re.compile(r"something like", re.I), \
  re.compile(r"just about", re.I), \
  re.compile(r"number of", re.I), \
  re.compile(r"due to", re.I), \
  re.compile(r"probably", re.I), \
  re.compile(r"obviously", re.I), \
  re.compile(r"clearly", re.I), \
  re.compile(r"simple", re.I), \
  re.compile(r"along with", re.I), \
  re.compile(r"actually", re.I), \
  re.compile(r"really", re.I), \
  re.compile(r"the fact that", re.I), \
  re.compile(r"You will read about", re.I), \
  re.compile(r"I will describe", re.I), \
  re.compile(r"we see that", re.I), \
  re.compile(r"Hopefully", re.I), \
  re.compile(r"the program", re.I), \
  re.compile(r"few", re.I), \
  re.compile(r"most", re.I), \
  re.compile(r"all", re.I), \
  re.compile(r"any", re.I), \
  re.compile(r"every", re.I), \
  re.compile(r"must", re.I), \
  re.compile(r"always", re.I), \
  re.compile(r"should", re.I), \
  re.compile(r"proof", re.I), \
  re.compile(r"prove", re.I), \
  re.compile(r"show", re.I), \
  re.compile(r"can", re.I), \
  re.compile(r"may", re.I)
