project 2 for CS421 - University of Illinois at Chicago
Name1 Peter Snyder  <psnyde2(at)uic.edu>
https://github.com/snyderp/cs412-scorer
-------------------------------------------------------------------------
--->SETUP<---------------------------------------------------------------

Before you can run our scorer, you'll need a python setup with nltk
installed.  This can be done by running something like the below:

    pip install nltk

The scorer also uses the Penn Treebank corpus to build up counts for an HMM,
so the penn treebank is also required.  This can be downloaded using the
built in nltk downloader (instructions provided on the nltk site,
http://nltk.org/data.html).

You'll also need a bash environment with a java environment recent
enough to run the Stanford Parser and the Stanford CoreNLP tool chain.

A simple bash script is included to download both of these project and set them
up in the contrib/ directory.  Use the following command to run this simple
install script:

    sh setup.sh

The program uses STDIN to determine what text to grade, so a unix
line environment that can do input redirection is needed.  The setup script
also relies on standard unix environment tools, such as 'tar', 'curl',
'unzip', 'rm' and 'ln'.

Probably best to have python 2.7 or something similarly
recent too.

-------------------------------------------------------------------------
--->INPUT<---------------------------------------------------------------

The essay scorer uses stdin, and accepts several command line arguments.
The entry file is called scoring_utils.py.

The simplest way to run the scorer is the below

    python scoring_utils.py --final-score < (path to file to score)

To grade an entire directory of files, the below command would work,
grading each input file one after another:

for i in `ls (path to directory)`; do p27 scoring_utils.py --final-score < $i; done

Because of the statistical models and the use on the Stanford Parser (in java,
which requires starting up the parser and reading its results in through STDIO),
the script can be very slow.  We promise it hasn't frozen!  If you'd like more
feedback on what the script is doing, you can pass the "--log [1-5]" command
for feedback.  For example:

    echo "A little logging please." | python scoring_utils.py --final-score --log 1

will produce some feedback, describing what the parser is doing, while

    echo "Lots more logging please." | python scoring_utils.py --final-score --log 5

will provide a torrent of feedback.

-------------------------------------------------------------------------
--->OUTPUT<--------------------------------------------------------------

For each piece of text / essay being evaluated, the following output is
generated (assuming no logging / verbose output is specified):

    1. The text "Grading"
    2. The string "----------"
    3. A copy of the text being graded, verbatum
    4. The string "----------"
    5. Each of the implemented tests, with the corresponding score, 1-5,
       appearing afterwards

Below is an example of output produced by the grading script:

    Grading
    ----------
    The red cat talked back
    ----------

    1a: 5
    1b: 5
    1c: 3
    1d: 2
    2a: 1
    2b: 1
    3a: 1
    Weighted Total: 2.0


-------------------------------------------------------------------------
--->FILES<---------------------------------------------------------------

This project uses the following files to complete the grading:

    - README.txt
        This file

    - agreement_utils.py
        A set of python functions used for measuring if there is subject-
        verb agreement in a given piece of text

    - cache/
        A directory used to cache intermediate results used by the parser.
        All files written to this directory are in the format of pickled
        python dictionaries. These files can be deleted safely at any time
        and the program will regenerate them as needed.

    - cache_utils.py
        Python functions of generating, updating, and deleting the above
        mentioned cached files as needed

    - cmd_utils.py
        Python functions to make it easier to envoke different parts of this
        project's code / functionality through the commandline, instead of
        needing to write throwaway scripts or use the python interpreter

    - contrib/
        Third party code required by this script, but not written by us.
        Currently this only includes the Stanford Parser (since the
        other libraries used, such as nltk, python stdlib, etc, are all
        expected to be included in the user's environment)

    - coref.properties
        A properties file for running the coreference determinier from the
        Stanford CoreNLP package

    - data/
        - The provided essays and other project materials

    - essay_utils.py
        Python functions to read and make it easier to work with the included
        training essays.

    - grade_utils.py
        Bridge functions that handling envoking the functionality provided
        by other files and assessing them as 1-5 scores

    - hmm_utils.py
        Python code for generating HMM counts from the NLTK Penn Treebank data,
        as well as functions for evaluating the probabilities of sequences
        of POS tags against that test collection

    - parsers.py
        A collection of bridges between python code an java code.  These
        functions open a pipe, execute the relevant command line java tool,
        read the input back in and parse the text into something python can
        understand and deal with.  The used bridges are currently
        the Stanford POS tagger, the dependency tagger in the Stanford Parser,
        and the coreference determiner from the Stanford CoreNLP toolkit.
        There is also orphaned code used to launch the Malt Parser here, though
        its not currently used or included in the project.

    - scoring_utils.py
        Python code for scoring the included essays or inputed text (through
        STDIN) against different pieces of the included code's functionality,
        including specific grading criteria, splitting apart sentences, etc.
        This file is intended to be envoked from the commandline.

    - sentence_tokenizer.py
        Python code used for splitting a chunk of text into sentences,
        using lexical information (in addition to punctionation, etc.)

    - setup.sh
        A simple bash script to download the Stanford Parser and Stanford
        CoreNLP packages and install them in the expected location in the
        contrib directory

    - syntactic_formation.py
        Python code used for determining if a sentence is syntacticly well
        formed.  This code relies on a set of lexical rules generated from
        the Penn Treebank data, along with the parse tree generated by the
        Stanford Parser.

    - tag_utils.py
        Python code for dealing with sets of POS tags. The most important
        piece of funcitonality here is simplifying sequences of POS tags
        to account of language issues.

    - text_coherence.py
        Python code used to check for pronoun coherence.  This code relies on
        the Stanford coreference determining code in the Stanford CoreNLP
        package.  A more details description of how this code works is provided
        below.

    - topic_coherence.py
        Python code used to determine if the topic of a given chunk of text
        matches the requirements of the essay.  Specifically if the text is
        about family, and to a lesser degree, work.

    - tree_utils.py
        Python functionality for dealing with nltk.tree.Tree and
        nltk.tree.ParentedTree structures representing Stanford Parser
        generated parses of sentences.

    - word_order.py
        Python code for measuring if a given set of words appear in the correct
        order (ie the 1a part of the project)


-------------------------------------------------------------------------
--->TECHNIQUE<-----------------------------------------------------------

Problem 3a
---

The core part of our solution is in the sentence parser.  All of the
reasoning the program does is on the sentence level.  We do sentence parsing
using the following high level approach:

    1. Split input text on newlines
    2. For each line of text
        2.1. Split each sentence into all possible subsets of words where
             the input words wwere contiguious in the input sentence,
             each sub sentence is at least three words long, and
             where we're not considering that a line of text could include
             more than 3 sentences (for computational reasons).  For example,
             given the line of text "I went running the day is hot", we consider
             each of the following sub-sets of possible setences
                "I went running the day is very hot outside"
                "I went running" AND "the day is very hot outside"
                "I went running the" AND "day is very hot outside"
                "I went running the day" AND "is very hot outside"
                "I went running the day is" AND "very hot outside"
                "I went running" AND "the day is" AND "very hot outside"

        2.2. For each of these sets of sub sentences:
            2.2.1. Parse with the Stanford Parser
            2.2.2. Simply the returned tree (by normalizing tense,
                   singular/plural, simplying the stucture of nested senteces,
                   etc.)
            2.2.3. Collect sequences of POS tag sequences at the same level
                   in the tree
            2.2.4. Find the HMM probability of each POS tag sequence
            2.2.5. Apply some weights, favoring fewer subsentences and sentences
                   that start with personal pronouns
            2.2.6. Disqualify sentences that match some conditions (such as
                   starting or ending with a conjunction)
            2.2.7. Determine the probability of the joint parse
    3. Select the set of subsentences with the highest probability

Problem 1a
---

Once we have a good measure of the individual sentences in the text to
be graded, we look for word order issues using the following strategy (for
each sentence in the text):

    1. Parse sentence in Stanford Parser
    2. Greatly simplify the given parse tree using methods like:
        - by normalizing tense, singular/plural, simplying the stucture of nested senteces
        - removing numbers that are next to a noun
        - collapsing complex parts of the parse tree (ex a S element that
          has only one child, a SBAR elment)
        - more items in the tree_utils.simplify_tree function
    3. Checking each level of the remaining, simplified parse tree to see if
       it has an unlikely POS tag ordering (ex VP->NP as children of a S tag,
       or NP->VP as children of a SINV tag).
    4. Return the number of blacklist rules the sentence violates (we flag
       nodes in the tree to make sure that the same POS tag sequence doesn't
       trigger multiple ordering errors)

Problem 1b
---

For the 1b subject-verb agreement section, we use the following method to check
for agreement issues in each sentence

    1. Parse each sentence in Stanford Parser to generate POS parse tree
    2. Also generate the dependency information generated by the Stanford Parser
    3. For each 'nsubj' dependency returned
        3.1. Locate each end of the dependency in the parse tree
        3.2. If the nodes in the parse tree aren't one noun and one verb,
             search up in the tree to find the closest verb to the given nouns,
             and use that verb and the remaining noun node
        3.3. Check to see if the given noun and verbs are correct regarding
            singular / plural and 1st / 3rd person

In general, the hardest part of dealing with the given POS trees is that
the language problems make it common that the given trees are invaid productions
of a stict English grammar.  By combining heuristics for simplifying the tree
with the HMM probabilities, we were able to reason about the trees as if they
were more "correct" English.

Problem 1c
---

This part was originally going to be completed by my partner in as part
of project 1.  However, she did not complete this section (or any other
section).  I was able to complete the other sections that she was going to
complete, but I wasn't able to go back and complete this section in addition
to the rest of project 2.  In order to still generate semi-accurate scores,
I have hardcoded the returned score from this problem to be 3.2, the average
value in the test corpus.

Problem 1d
---

Just as with the other parts of the project, the initial step was to split
the given text up into sentences, using the above described method in
problem 3a.  In order to measure syntatic well-formedness, the following
steps were taken:

    1. Parse each sentence in Stanford Parser to generate POS parse tree
    2. Parse the Penn Treebank and record all productions in all given
       levels of the tree.  Recorded productions were only one level, so
       S->NP,VP was recorded, but the entire production allowed by each
       parsed sentence was not noted.  The goal was the build a collection
       of all the English lexical rules in the Penn Treebank.
    3. The Stanford Parser generated POS parse tree for the currently examined
       sentence was compared to see if it contained any productions /
       transitions not found in the collection of rules generated by the
       Penn Treebank.  The count of each invalid transition was recorded
    4. The number of X and FRAG tags in the Stanford Parser generated parse
       tree was recorded.  Care was taken to not double count the same error
       twice between step 3 above and this step.
    5. The number of SBAR tags in the parse tree where the SBAR is both not a
       child of  'S', 'SINV' or 'VP' tag and not a sibling of an 'IN' tag was
       recorded
    6. The number of sentences with any of the above mentioned problems was
       divided by the number of sentences in the essay, and this resulting
       franction, multipled by 5, resulted in a 1-5 score

Problem 2a
---

Again, sentences were parsed into individual sentences using the stragey
described in problem 3a.  Then, to measure the coherence of the essay,
as measured by the coherence of the pronouns in the sentence, the following
steps were taken:

    1. Parse each essay into a list of sentences
    2. For each sentence, generate a parse tree using the Stanford Parser
       and extract all of the pronouns.  Disregard the first person pronouns,
       note the count of second person pronouns, and keep track of which
       sentence each third person pronoun appeared in.
    3. Iterate back over each sentence that contains a pronoun.  For each
       third person pronoun:
       3.1 Look back 2 sentences and, using the codependency tagger in the
           Stanford CoreNLP package, see if we can find what the pronoun
           refers to in the previous 1 or 2 sentences.  If not, consider
           this pronoun's usage to be an error and process no further
       3.2 If we were able to find an antecedent, replace the antecedent
           with the word "RUNNING" (to ensure that it won't be marked
           as an antecedent again).
       3.3 Use the codependency tagger a second time to see if we can locate
           another antecedent for the pronoun.  If not, then count this
           pronoun's usage as correct.  Replace the pronoun with the located
           antecedent and move on to the next pronoun.
       3.4 If a second antecedent was found, consider this a non-felicitous
           usage
    4. The final score for the essay is generated using the following weights
            2 (an the default weight for each essay)
       + -1 * the number of times a 3rd person pronoun was used incorrectly
       + .5 * the number of times a 3rd person pronoun had multiple antecedents
       +      the number of times a 3rd person pronoun was used correctly
       + .2 * the number of sentences in the essay (to favor longer slightly
              incorrect essays over very short but correct ones)

Problem 2b
---

Finally, I again parsed the given essay into sentences using the strategy
described in problem 3a.  Then, the following steps were taken:

    1. A collection of 20 words related to families were looked up in Wordnet.
       Theses words were noted as being "family related" and stored in a
       collection.
    2. For each word in the "family related" collection, the word's
       hypernyms and hyponyms were added to the word collection.  Then,
       recursivly, each word newly added to the family related word collection
       was seached for new hypernyms and hyponyms to add to the collection.
       This process was repeated two iterations to collect a large number
       of family related words.
    3. The above two steps were repeated, but this time using a collection
       of 4 work related words.  Again, the recursive search was repeated
       two iterations to create a sizeable collection of work related words.
    4. Both the work and family related words were stemmed using the Porter
       Stemmer.
    5. All regular-nouns were found in the essay and stemmed.  For each
       of these nouns, I checked to see if the stemmed form appeared in
       the family related collection of words, work related set of words,
       or neither.
    6. The essay was then assigned a score equal to:
       (float(family_hits * (5)) / (num_nouns - 1)) +
       (float(work_hits * (5 * .5)) / (num_nouns - 1))

       Two items to note in the above formula are that (1) essays can still get
       a perfect score of 5 if they have one noun not related to the given
       topic (since the essay could be fully about the topic, but still include
       a mention of a not-directly related noun), and (2) that, because
       the main focus of these essays is intended to be family related,
       essays only get "half credit" for discussing work topics.

