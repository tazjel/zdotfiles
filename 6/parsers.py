"""Use a java parser to generate a parse trees etc.  This
is pretty hacky, and just ammounts to running a java command and piping
things back into python, but thursday is pretty close so what can I do?
"""
import os
from subprocess import Popen, PIPE, STDOUT
from nltk.tree import ParentedTree
import nltk
from cache_utils import cache_get, cache_set


def _standford_parser_cmd(format='oneline'):
    parser_dir = os.path.realpath(os.path.join("contrib", "stanford-parser"))
    cmd_parts = ('java', '-mx150m', '-cp', parser_dir + "/*:",
                 'edu.stanford.nlp.parser.lexparser.LexicalizedParser',
                 '-outputFormat', format,
                 'edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz',
                 '-')
    return cmd_parts


def _exec_cmd(cmd, input):
    p = Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=STDOUT)
    response = p.communicate(input=input)[0]
    return response


def parse_coref(sentence, use_cache=True):
    cache_key = "coreferences"
    if use_cache:
        cache_attempt = cache_get(cache_key, sentence)
        if cache_attempt is not None:
            return cache_attempt

    import re
    if not hasattr(parse_coref, '_regex'):
        parse_coref._regex = re.compile(r'\((?P<pronoun_sentence>\d+),(?P<pronoun_loc>\d+),.*?-> \((?P<ref_sentence>\d+),(?P<ref_loc>\d+).*?"(?P<pronoun>.*?)" -> "(?P<ref>.*?)"')

    parser_dir = os.path.realpath(os.path.join("contrib", "stanford-corenlp"))
    cmd_parts = ('java', '-Xmx3g', '-cp', parser_dir + "/*:",
                 'edu.stanford.nlp.pipeline.StanfordCoreNLP',
                 '-annotators', 'tokenize,ssplit,pos,lemma,ner,parse,dcoref',
                 'dcoref.logFile', '/dev/null', '-')
    response = _exec_cmd(cmd_parts, sentence)

    matches = []
    start = False
    for line in response.split("\n"):
        if line == "NLP> Annotation pipeline timing information:":
            break
        elif line == "Coreference set:":
            start = True
        elif start:
            a_match = parse_coref._regex.search(line.strip())
            if a_match:
                matches.append(a_match.groupdict())

    if use_cache:
        cache_set(cache_key, sentence, matches)
    return matches


def parse_malt(sentence, use_cache=True):
    malt_dir = os.path.realpath(os.path.join('contrib', 'malt-parser'))
    os.environ['MALTPARSERHOME'] = malt_dir
    parser = nltk.parse.malt.MaltParser(working_dir=malt_dir,
                                        mco="engmalt.linear-1.7")
    return parser.parse(sentence)


def parse_stanford(sentence, use_cache=True):
    return _exec_cmd(_standford_parser_cmd(), sentence)


def parse(sentence, use_cache=True, parser='stanford'):

    cache_key = "parse_trees_{0}".format(parser)
    valid_lines = None

    if use_cache:
        cache_attempt = cache_get(cache_key, sentence)
        if cache_attempt:
            valid_lines = cache_attempt

    if valid_lines is None:
        if parser == "stanford":
            response = parse_stanford(sentence, use_cache=use_cache)
        elif parser == "malt":
            response = parse_malt(sentence, use_cache=use_cache)
        else:
            return []

        valid_lines = [line for line in response.split("\n") if len(line) > 2 and line[0] == "(" and line[-1] == ")"]

        if use_cache:
            cache_set(cache_key, sentence, valid_lines)

    # throw away the garbgage we don't want from the parser's response.
    # this could probably get us in trouble since it'll hide errors etc,
    # but we got deadlines....
    trees = [ParentedTree.parse(line) for line in valid_lines]

    return trees


def dependences(sentence, use_cache=True):
    import re

    if not hasattr(dependences, '_dep_regex'):
        dependences._dep_regex = re.compile(r'(?P<dep_name>.*?)\((?P<first_word>.*?)-(?P<first_loc>\d+), (?P<second_word>.*?)-(?P<second_loc>\d+)\)')

    response = _exec_cmd(_standford_parser_cmd(format='typedDependenciesCollapsed'), sentence)
    deps = response.split("\n")[3:-4]
    matches = []
    for dep in deps:
        a_match = dependences._dep_regex.search(dep)
        if a_match:
            matches.append(a_match.groupdict())
    return matches
