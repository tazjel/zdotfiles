import parsers
import tree_utils
from tree_utils import semi_tree_roots
import hmm_utils
import essay_utils
import cmd_utils
from cmd_utils import log, cmd_log_level
import tag_utils
from cache_utils import cache_get, cache_set


correct_line_counts = (
    (1, 1, 1, 1, 1, 2, 1,),  # 1
    (1, 1, 1, 1, 1, 2,),
    (1, 1, 1, 1, 1, 1, 1, 1,),
    (2, 1, 1,),
    (3, 2, 2, 3, 1,),  # 5
    (4, 2,),
    (2, 3,),
    (1, 1, 1, 1, 1, 1, 1,),
    (2, 1, 2, 1,),
    (1, 1, 1, 1, 1, 1, 1, 1, 1, 1,),  # 10
    (2, 2, 2, 1,),
    (1, 2, 1, 2,),
    (3, 3, 2, 2,),
    (2, 3,),
    (2, 2, 1,),  # 15
    (1, 1, 1, 3, 1),
    (2, 1,),
    (2, 2, 1,),
    (2, 3,),
    (2, 2, 2, 2),  # 20
)

counts = hmm_utils.get_transition_counts()
essay_index = int(cmd_utils.cmd_arg('--essay', 0)) - 1
line_index = int(cmd_utils.cmd_arg('--line', -1))
use_stdin = cmd_utils.cmd_flag('--stdin')


# How much to prefer long answers over shorter onces
weight = .0001

invalid_boundary_tags = ('IN', 'CC', 'SINV', 'RP', 'TO')
pers_pro_tags = ('PRP', 'PRP$')
start_pers_pro_weight = 1000


def _possible_sentences_in_line(line, min_sentence_len=3):
    # The simplest thing here is to defer to the paper.  If it looks like they've
    # added punctuation already, lets just use that
    has_abbr = sum([1 if len(word) > 0 and word[-1] == "." and word.count(".") > 1 else 0 for word in line.split(" ")])
    if not has_abbr and line.count(". ") > 0:
        return [line.split(". ")]

    normalized_line = line.replace(".", "")
    sentences = [[normalized_line]]
    words = normalized_line.split()
    num_words = len(words)
    if num_words >= 6:
        for i in range(min_sentence_len, num_words - min_sentence_len):
            sentences += [[" ".join(words[:i]), " ".join(words[i:])]]
            if num_words - i >= 6:
                for j in range(i + 3, num_words - min_sentence_len + 1):
                    sentences += [[" ".join(words[:i]), " ".join(words[i:j]), " ".join(words[j:])]]
    return sentences


def is_possible_sentence(tree):
    """Perform some basic filtering to remove unlikely constructs, like
    starting a setnence with because"""
    leaf_trees = tree.subtrees(lambda x: x.height() == 2)
    leaf_nodes = [n.node for n in leaf_trees]

    if leaf_nodes[0] in invalid_boundary_tags:
        log("Rejecting sentence becuase it starts with an invalid boundry tag: %s" % (leaf_nodes[0],), 3)
    elif leaf_nodes[-1] in invalid_boundary_tags:
        log("Rejecting sentence becuase it ends with an invalid boundry tag: %s" % (leaf_nodes[-1],), 3)
        return False
    elif leaf_nodes[0] == "PP":
        log("Rejecting sentence because it stats with PP", 3)
        return False
    else:
        flatten_tags = []
        useful_roots = list(tree.subtrees(lambda x: (x.node in semi_tree_roots) and len(x) > 1))

        if len(useful_roots) == 0 or len(useful_roots[0]) < 2:
            log("Rejecting sentence becuase can't find a useful root", 3)
            return False

        sub_tree = useful_roots[0]

        for sub_sub_tree in sub_tree:
            flatten_tags.append(tag_utils.simplify_tag(sub_sub_tree.node))

        sen_is_inverted = tree[0].node == "SINV"

        if sen_is_inverted:
            early_set = ("VP", "VB")
            late_set = ("NP",)
        else:
            early_set = ("NP", "NN")
            late_set = ("VP", "ADJP")

        try:
            earliest_index = min([flatten_tags.index(tag) for tag in early_set if tag in flatten_tags])
            latest_index = max([flatten_tags.index(tag) for tag in late_set if tag in flatten_tags])
            if earliest_index > latest_index:
                if sen_is_inverted:
                    log("Rejecting possible sentence because earliest NP like tag occurs before earliest VP like tag (%d vs %d)" % (earliest_index, latest_index), 3)
                else:
                    log("Rejecting possible sentence because earliest VP like tag occurs before earliest NP like tag (%d vs %d) and sentence parse SINV" % (earliest_index, latest_index), 3)
                return False
            else:
                return True
        except ValueError:
            log("Rejecting possible sentence because the head structure doesn't look like a valid parse", 3)
            return False


def boost_for_sentence_tree(tree):
    weight = 1

    first_np = list(tree.subtrees(lambda x: x.node == "NP"))[0]
    has_pro = len(list(first_np.subtrees(lambda x: x.node in pers_pro_tags))) > 0
    if has_pro:
        log("BOOST: Starts with Pers Pronouns", 2)
        weight *= start_pers_pro_weight

    # @NOTE TOGGLE POINT
    # if tree[0].node == "S":
    #     weight *= 10

    return weight


def prod(nums):
    total = 1
    for num in nums:
        total *= num
    return total


def contains_any_invalid_setences(sentences, invalid_sentences):
    for sentence in sentences:
        if sentence in invalid_sentences:
            return True
    return False


def parse(text, use_cache=True, include_prob=False):
    lines = text.split("\n")
    sentences = []
    for line in lines:
        sentences += parse_sentences(line, use_cache=use_cache, include_prob=include_prob)
    return sentences


def parse_sentences(line, use_cache=True, include_prob=False):

    log("Working on: %s" % (line,), 2)

    if use_cache:
        correct_parse = cache_get("sentence_tokenizer", line)
        if correct_parse:
            log("Cache Hit: %s" % (correct_parse[0],), 4)
            log("-------------\n", 4)
            return correct_parse if include_prob else correct_parse[0]

    all_possible_sentences = _possible_sentences_in_line(line)
    all_possible_sentence_probs = []
    invalid_possible_sentences = []
    stored_probs = {}

    for possible_sentences in all_possible_sentences:

        log("Examining: %s" % (possible_sentences,), 1)
        prob_for_sentences = []
        sent_is_impossible = False

        for possible_sentence in possible_sentences:

            if use_cache:
                possible_sentence_prob = cache_get('possible_sentences', possible_sentence)
                if possible_sentence_prob is not None:
                    log("Cache Hit: %s (from %s)" % (possible_sentence, 'possible sentences'), 4)
                    prob_for_sentences.append(possible_sentence_prob)
                    continue

            if contains_any_invalid_setences(possible_sentences, invalid_possible_sentences) or sent_is_impossible:
                prob_for_sentences.append(0)
                continue
            elif possible_sentence in stored_probs:
                prob_for_sentences.append(stored_probs[possible_sentence])
                continue

            sentence_trees = parsers.parse(possible_sentence)
            if len(sentence_trees) == 0:
                log("Wasn't able to parse input %s" % (possible_sentence,), 0)
                prob_for_sentences.append(0)
                invalid_possible_sentences.append(possible_sentence)
                sent_is_impossible = True
                continue
            else:
                sentence_tree = sentence_trees[0]

            if cmd_log_level() >= 4:
                print "--------"
                print "Pre Simplified Tree"
                print sentence_tree

            tree_utils.simplify_tree(sentence_tree,
                                     remove_starting_cc=possible_sentences.index(possible_sentence) == 0)

            if cmd_log_level() >= 4:
                print "--------"
                print "Post Simplified Tree"
                print sentence_tree

            sentence_transitions = tree_utils.transitions_in_tree(sentence_tree)

            if not is_possible_sentence(sentence_tree):
                log("%s" % (sentence_transitions,), 2)
                log("Invalid parse", 2)
                prob_for_sentences.append(0)
                invalid_possible_sentences.append(possible_sentence)
                sent_is_impossible = True
                if use_cache:
                    cache_set('possible_sentences', possible_sentence, 0)
            else:
                log("%s" % (sentence_transitions,), 2)
                sentence_probs = []
                for transition in sentence_transitions:
                    try:
                        probs = hmm_utils.prob_of_all_transitions(transition, counts, gram_size=3)
                    except KeyError, e:
                        log("'Imposible' Tag order", 2, sep=' ** ')
                        log("%s" % (e,), 2, sep=' ** ')
                        probs = [0]
                    sentence_probs += probs
                    log("Transitions: %s" % (transition,), 3)
                    log("Probabilities: %s" % (probs,), 3)

                attempt_sentence_prob = prod(sentence_probs)

                sentence_prob_boost = boost_for_sentence_tree(sentence_tree)
                attempt_sentence_prob *= sentence_prob_boost

                prob_for_sentences.append(attempt_sentence_prob)
                stored_probs[possible_sentence] = attempt_sentence_prob
                if use_cache:
                    cache_set('possible_sentences', possible_sentence, attempt_sentence_prob)
        weighted_score = prod(prob_for_sentences) * (weight ** (len(possible_sentences) - 1))
        if weighted_score > 0:
            log("Valid Parse: %s" % (possible_sentences,), 2)
            log(weighted_score, 2)

        all_possible_sentence_probs.append(weighted_score)
    max_prob = max(all_possible_sentence_probs)
    parse_for_max_prob = all_possible_sentences[all_possible_sentence_probs.index(max_prob)]
    log("All Probs: %s" % (all_possible_sentence_probs,), 2)
    log("MAX Prob: %f" % (max_prob,), 2)
    log("Parse for max prob: %s" % (parse_for_max_prob,), 2)
    log("Best Guess Num Sentences: %d" % (len(parse_for_max_prob),), 1)
    log("-------------\n\n", 1)

    if use_cache:
        cache_set("sentence_tokenizer", line, (parse_for_max_prob, max_prob))
    return (parse_for_max_prob, max_prob) if include_prob else parse_for_max_prob


if __name__ == '__main__':
    ## Simple method for testing from STDIN
    if use_stdin:
        print parse_sentences(cmd_utils.get_stdin())
    else:
        essays = essay_utils.essays if essay_index == -1 else [essay_utils.essays[essay_index]]

        essays_in_corpus = []

        for essay in essays:

            sentences_for_essay = []
            lines = essay if line_index == -1 else [essay[line_index]]

            for line in lines:
                sentences_for_essay.append(len(parse_sentences(line)))
            log("Sentence counts for essay: %s" % (sentences_for_essay,))
            essays_in_corpus.append(sentences_for_essay)

        wrong_answers = []
        wrong_tally = 0
        for i in range(0, len(essays_in_corpus)):
            wrong_answers.append([])
            for j in range(0, len(essays_in_corpus[i])):
                correct_lines = correct_line_counts[i][j]
                found_lines = essays_in_corpus[i][j]
                diff = correct_lines - found_lines
                wrong_tally += abs(diff)
                wrong_answers[i].append(0 if diff == 0 else diff)

        log("Num Wrong Answers: %d" % (wrong_tally,), 0)
        for row in wrong_answers:
            print row

        log("Counts", 0)
        for row in essays_in_corpus:
            print row
