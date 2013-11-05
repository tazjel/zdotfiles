import os
import sentence_tokenizer
import word_order
import essay_utils
from math import floor
from cmd_utils import log


cols = ('1a', '1b', '1c', '1d', '2a', '2b', '3a')
implemented_grades = ('1a', '1b', '1c', '1d', '2a', '2b', '3a')
grades = [[float(n) for n in l.split()[1:]] for l in open(os.path.join("data/grades.txt")).readlines()[::-1][:-5]]


def correct_essay_grade(essay_index, grade_type):
    if grade_type not in cols:
        raise Exception('%s is not a valid grade category' % (grade_type),)
    return grades[essay_index][cols.index(grade_type)]


def grade_text(text, grade_type):
    if grade_type not in cols:
        raise Exception('%s is not a valid grade category' % (grade_type),)
    if grade_type == "3a":
        return grade_3a(text)
    elif grade_type == "1a":
        return grade_1a(text)
    elif grade_type == '1b':
        return grade_1b(text)
    elif grade_type == '1c':
        return grade_1c(text)
    elif grade_type == '1d':
        return grade_1d(text)
    elif grade_type == '2a':
        return grade_2a(text)
    elif grade_type == '2b':
        return grade_2b(text)


def grade_1a(text):
    sentences = sentence_tokenizer.parse(text)
    num_problems = 0
    num_sentences = 0
    for sentence in sentences:
        issues_in_sentence = word_order.issues_in_sentence(sentence)
        num_sentences += 1
        num_problems += len(issues_in_sentence)
    if num_problems in (0, 1):
        return 5
    elif num_problems == 2:
        return 4
    elif num_problems in (3, 4):
        return 3
    elif num_problems in (5, 6):
        return 2
    else:
        return 1


def grade_1b(text):
    import agreement_utils
    rs = agreement_utils.parse(text)
    num_agreements, num_non_agreements, num_unsure = rs
    num_agreements_tested = sum(rs)
    if num_agreements_tested == 0:
        log("No possible agreements found in text", 2)
        return 0
    else:
        log("Sub Scores: %s" % (rs,), 2)
        prob = float(num_agreements) / sum(rs)
        log("%d/%d -> %f" % (num_agreements, sum(rs), prob), 2)
        return floor(prob * 5)


def grade_1c(text):
    return 3.2


def grade_1d(text):
    import syntactic_formation
    import math
    sentence_problems = syntactic_formation.parse(text)
    num_sentences_with_problems = sum([1 if count > 0 else 0 for count in sentence_problems])
    num_sentences = len(sentence_problems)
    score = max(0, math.floor((1 - (float(num_sentences_with_problems)/num_sentences)) * 5))
    return score


def grade_2a(text):
    import text_coherence

    # weights
    weight_2nd_person = -1
    weight_3rd_person_good = 1
    weight_3rd_person_bad = -2
    weight_3rd_person_avg = .5
    weight_sen = .2

    pronoun_biz = text_coherence.parse(text)

    first_person_pronouns = []
    second_person_pronouns = []
    third_person_pronouns = []

    score = 0

    for sentence in pronoun_biz:
        first_person_pronouns += sentence[0]
        second_person_pronouns += sentence[1]
        third_person_pronouns += sentence[2]
        for third_person_pronoun in third_person_pronouns:
            if third_person_pronoun[1] == -1:
                score += (weight_3rd_person_bad)
            elif third_person_pronoun[1] == .5:
                score += (weight_3rd_person_avg)
            else:
                score += (weight_3rd_person_good)

    return max(1, min(5, (2 + (weight_2nd_person * len(second_person_pronouns)) + score + (len(pronoun_biz) * weight_sen))))


def grade_2b(text):
    import topic_coherence
    from math import ceil

    family_weight = 1
    work_weight = .5

    family_hits, work_hits, nouns = topic_coherence.parse(text)
    score = (float(family_hits * (5 * family_weight)) / (nouns - 1))
    score += (float(work_hits * (5 * work_weight)) / (nouns - 1))
    return ceil(min(5, score, nouns))


def grade_3a(text):
    sentences = sentence_tokenizer.parse(text)
    num_sentences = len(sentences)
    if num_sentences >= 6:
        return 5
    else:
        return max(num_sentences - 1, 1)

if __name__ == '__main__':
    import cmd_utils

    tests = cmd_utils.cmd_test()
    tests = [tests] if tests else ('1a', '1b', '1d', '2a', '2b', '3a')
    essay_index = int(cmd_utils.cmd_arg('--essay', 0)) - 1

    for test in tests:
        if essay_index >= 0:
            essay_text = "\n".join(essay_utils.essays[essay_index])
            received_grade = grade_text(essay_text, test)
            log("Expect %s score: %d" % (test, correct_essay_grade(essay_index, test)), 0)
            log("Received %s score: %d" % (test, received_grade), 0)
        else:
            print "Values for %s" % (test,)
            print "-------------"
            for i in range(0, len(essay_utils.essays)):
                essay_text = "\n".join(essay_utils.essays[i])
                received_grade = grade_text(essay_text, test)
                expected_grade = correct_essay_grade(i, test)
                diff = received_grade - expected_grade
                print " | ".join([str(s) for s in [(i + 1), expected_grade, received_grade, diff, abs(diff)]])
            print "\n\n"
