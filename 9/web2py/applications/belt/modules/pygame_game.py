import pygame
import sys
import time
import subprocess
from random import shuffle
from itertools import cycle
from pygame.locals import *
import os

GREY = (155, 155, 155)
DARK_GREEN = (0, 125, 0)

SCORE_LIMIT = 151
TAKE_HAND_DELAY = 0.6
announce = None

LEFT = 'LEFT'
RIGHT = 'RIGHT'
DOWN = 'DOWN'
UP = 'UP'

CARD_DISTANCE = 35

START_POSITIONS = {LEFT: {'x': 10, 'y': 140}, RIGHT: {'x': 635, 'y': 140},
                   UP: {'x': 200, 'y': 10}, DOWN: {'x': 200, 'y': 520}}

ON_TABLE = {LEFT: {'x': 215, 'y': 250}, RIGHT: {'x': 405, 'y': 250},
            UP: {'x': 310, 'y': 185}, DOWN: {'x': 310, 'y': 315}}

ANNOUNCES = {1: 'C', 2: 'D', 3: 'H', 4: 'S'}
ANNOUNCES_REVERSE = {'C': 1, 'D': 2, 'H': 3, 'S': 4}

ANNOUNCES_PRINT = {0: 'Пас', 1: 'Спатия', 2: 'Каро', 3: 'Купа',
                   4: 'Пика', 5: 'Без коз', 6: 'Всичко коз'}

CARD_POINTS = {'KOZ':
               {7: 0, 8: 0, 9: 14, 10: 10, 11: 20, 12: 3, 13: 4, 14: 11},
               'BEZ_KOZ':
               {7: 0, 8: 0, 9: 0, 10: 10, 11: 2, 12: 3, 13: 4, 14: 11}}

CARDS = {(7, 'C'): '7spatiq.png', (7, 'D'): '7karo.png',
         (7, 'H'): '7kupa.png', (7, 'S'): '7pika.png',
         (8, 'C'): '8spatiq.png', (8, 'D'): '8karo.png',
         (8, 'H'): '8kupa.png', (8, 'S'): '8pika.png',
         (9, 'C'): '9spatiq.png', (9, 'D'): '9karo.png',
         (9, 'H'): '9kupa.png', (9, 'S'): '9pika.png',
         (10, 'C'): '10spatiq.png', (10, 'D'): '10karo.png',
         (10, 'H'): '10kupa.png', (10, 'S'): '10pika.png',
         (11, 'C'): '11spatiq.png', (11, 'D'): '11karo.png',
         (11, 'H'): '11kupa.png', (11, 'S'): '11pika.png',
         (12, 'C'): '12spatiq.png', (12, 'D'): '12karo.png',
         (12, 'H'): '12kupa.png', (12, 'S'): '12pika.png',
         (13, 'C'): '13spatiq.png', (13, 'D'): '13karo.png',
         (13, 'H'): '13kupa.png', (13, 'S'): '13pika.png',
         (14, 'C'): '14spatiq.png', (14, 'D'): '14karo.png',
         (14, 'H'): '14kupa.png', (14, 'S'): '14pika.png'}

CARD_ORDER = ['C', 'D', 'S', 'H']

PRIORITIES = {5: [14, 10, 13, 12, 11, 9, 8, 7],
              6: [11, 9, 14, 10, 13, 12, 8, 7]}
TRUMPS = {1: 'C', 2: 'D', 3: 'H', 4: 'S'}


class Player:
    def __init__(self, name):
        self.name = name
        self.hand = []
        self.taken = []


P0 = Player('P0')
P00 = Player('P00')
P1 = Player('P1')
P11 = Player('P11')

PLAYERS = [P0, P1, P00, P11]

PLAYER_POSITIONS = {P0: DOWN, P1: RIGHT, P00: UP, P11: LEFT}

HIDDEN_POSITIONS = {P0: {'x': 0, 'y': 1}, P1: {'x': 1, 'y': 0},
                    P00: {'x': 0, 'y': -1}, P11: {'x': -1, 'y': 0}}


class Card:
    def __init__(self, nominal, color):
        self.nominal = nominal
        self.color = color
        fullname = os.path.join('images', CARDS[nominal, color])
        self.image = pygame.image.load(fullname)

    def __str__(self):
        return str(self.nominal) + " " + self.color


class Deck:
    def __init__(self):
        self.cards = []
        for color in ['C', 'D', 'H', 'S']:
            for nominal in range(7, 15):
                self.cards.append(Card(nominal, color))


def within(card, x, y):
    if x < card.x or y < card.y or x > card.xmax or y > card.ymax:
        return False
    return True


def sum(a, b):
    return a + b


def determine_position(cards, position):
    for c, j in zip(cards, range(len(cards))):
        c.x = sum(START_POSITIONS[position]['x'],
                  j * CARD_DISTANCE * (position in [DOWN, UP]))
        c.y = sum(START_POSITIONS[position]['y'],
                  j * CARD_DISTANCE * (position in [LEFT, RIGHT]))
        c.xmax = c.x + c.image.get_size()[0]
        c.ymax = c.y + c.image.get_size()[1]
        c.position = position


def sort_cards():
    for player in PLAYERS:
        player.hand = sorted(player.hand,
                             key=lambda card: CARD_ORDER.index(card.color))


def first_dial(deck):
    shuffle(deck.cards)
    P0.hand.extend(deck.cards[:5])
    P1.hand.extend(deck.cards[5:10])
    P00.hand.extend(deck.cards[10:15])
    P11.hand.extend(deck.cards[15:20])
    sort_cards()


def second_dial(deck):
    P0.hand.extend(deck.cards[20:23])
    P1.hand.extend(deck.cards[23:26])
    P00.hand.extend(deck.cards[26:29])
    P11.hand.extend(deck.cards[29:32])
    sort_cards()


def calculate(cards, announce):
    points = 0
    for card in cards:
        if announce == 6:  # всичко коз
            points += CARD_POINTS['KOZ'][card.nominal]
        elif announce == 5:  # без коз
            points += 2 * CARD_POINTS['BEZ_KOZ'][card.nominal]
        else:
            if card.color == ANNOUNCES[announce]:
                points += CARD_POINTS['KOZ'][card.nominal]
            else:
                points += CARD_POINTS['BEZ_KOZ'][card.nominal]
    return points


def calculate_points(announce, last_ten_winner):
    points = {0: sum(calculate(P0.taken, announce),
                     calculate(P00.taken, announce)),
              1: sum(calculate(P1.taken, announce),
                     calculate(P11.taken, announce))}
    points[last_ten_winner in [P1, P11]] += (10 + 10 * (announce == 5))

    return points


def cycle_players(first):
    index = PLAYERS.index(first)
    return cycle([first, PLAYERS[(index + 1) % 4], PLAYERS[(index + 2) % 4],
                  PLAYERS[(index + 3) % 4]])


def play_a_card(player, card, on_table):
    on_table.append(card)
    player.hand.remove(card)


def has_color(player, color):
    for card in player.hand:
        if card.color == color:
            return True
    return False


def teammates(player1, player2):
    return player1.name[1] == player2.name[1]


def winner_in_hand(on_table, announce):
    needed_color = on_table[0].color
    if announce in [5, 6]:
        return sorted([c for c in on_table if c.color == needed_color],
                      key=lambda c:
                      PRIORITIES[announce].index(c.nominal))[0].played_by
    trumps_on_table = [c for c in on_table if c.color == TRUMPS[announce]]
    if len(trumps_on_table):
        return sorted(trumps_on_table,
                      key=lambda c:
                      PRIORITIES[6].index(c.nominal))[0].played_by
    return sorted([c for c in on_table if c.color == needed_color],
                  key=lambda c: PRIORITIES[5].index(c.nominal))[0].played_by


def take_hand_animation(on_table, winner):
    time.sleep(TAKE_HAND_DELAY)
    for card in on_table:
        for i in range(30):
            card.x += HIDDEN_POSITIONS[winner]['x'] * 3 * i
            card.y += HIDDEN_POSITIONS[winner]['y'] * 3 * i
            DISPLAYSURF.blit(card.image, (card.x, card.y))
            pygame.display.update()


def move_played_card(card):
    card.x = ON_TABLE[card.position]['x']
    card.y = ON_TABLE[card.position]['y']
    card.xmax = card.x + card.image.get_size()[0]
    card.ymax = card.y + card.image.get_size()[1]


def are_consecutive(nominals):
    for i in range(len(nominals) - 1):
        if nominals[i] - nominals[i+1] != -1:
            return False
    return True


def check_for_consecutive(cards, length):
    consecutives = [0, []]
    for color in ['C', 'D', 'H', 'S']:
        same_color_cards = [card for card in cards if card.color == color]

        while len(same_color_cards) >= length:
            few_cards = same_color_cards[:length]
            if are_consecutive(sorted([card.nominal for card in few_cards])):
                consecutives[0] += 1
                same_color_cards = [card for card in same_color_cards
                                    if card not in few_cards]
                consecutives[1].extend(few_cards)
            else:
                same_color_cards = same_color_cards[1:]

    return consecutives


def check_bonuses(announce, cards):
    bonuses = {3: 0, 4: 0, 5: 0, '4ofakind': 0, 'belote': 0}
    if announce == 5:
        return bonuses

    nominals = [card.nominal for card in cards]
    for nominal in range(7, 15):
        if nominals.count(nominal) == 4:
            bonuses['4ofakind'] += 1
            cards = [card for card in cards if card.nominal != nominal]

    for i in range(5, 2, -1):
        consecutives = check_for_consecutive(cards, i)
        bonuses[i] = consecutives[0]
        cards = [card for card in cards if card not in consecutives[1]]

    return bonuses


def check_for_belote(card, on_turn, announce, bonuses):
    if any([card.nominal not in [12, 13],
            announce not in [6, ANNOUNCES_REVERSE[card.color]]]):
        return bonuses, False
    if len([c for c in on_turn.hand
            if c.nominal in [12, 13] and c.color == card.color]) == 2:
        bonuses[on_turn]['belote'] += 1
        return bonuses, True
    return bonuses, False


def draw_cards():
    all_cards = []
    for player in PLAYERS:
        for card in player.hand:
            all_cards.append(card)

    for player in PLAYERS:
        determine_position(player.hand, PLAYER_POSITIONS[player])

    DISPLAYSURF.fill(DARK_GREEN)
    for card in all_cards:
        DISPLAYSURF.blit(card.image, (card.x, card.y))
    pygame.display.update()


def count_color(cards, color):
    return len([c for c in cards if c.color == color])


def count_nominal(cards, nominal):
    return len([c for c in cards if c.nominal == nominal])


def certain_trump_suitable(cards, trump):
    trumps = [c for c in cards if c.color == trump]
    if all([len(trumps) >= 3,
           len([c for c in trumps if c.nominal == 9 or c.nominal == 11])]):
        return True
    return False


def no_trumps_suitable(cards):
    if any([count_nominal(cards, 14) >= 2,
            count_nominal(cards, 14) >= 1 and count_nominal(cards, 10) >= 2]):
        return True
    return False


def all_trumps_suitable(cards):
    if any([count_nominal(cards, 11) >= 2,
            all([count_nominal(cards, 9) >= 2,
                 count_nominal(cards, 11) >= 1]),
            count_nominal(cards, 9) >= 3]):
        return True
    return False


def decide_announce(speaker, availables, leader=None, announce=0):
    if leader is None:
        for ann in range(1, 5):
            if certain_trump_suitable(speaker.hand, TRUMPS[ann]):
                return ann
        if no_trumps_suitable(speaker.hand) and 5 in availables:
            return 5
        if all_trumps_suitable(speaker.hand) and 6 in availables:
            return 6
    else:
        if all([teammates(speaker, leader), announce in range(1, 5),
                all_trumps_suitable(speaker.hand)]):
            return 6
        if all([not teammates(speaker, leader),
                no_trumps_suitable(speaker.hand), 5 in availables]):
            return 5
    return 0


def weaker_trump(c1, c2):
    return PRIORITIES[6].index(c1.nominal) < PRIORITIES[6].index(c2.nominal)


def shape_result(small_result, leader, bonuses):
    leader_team = int(leader.name[1])
    other_team = (leader_team + 1) % 2
    result = small_result

    for i in [0, 1]:
        if small_result[i] == 0:
            result[(i + 1) % 2] += 90

    for player in [P0, P1, P00, P11]:
        team = int(player.name[1])
        result[team] += 20 * (bonuses[player][3] + bonuses[player]['belote'])
        result[team] += 50 * bonuses[player][4]
        result[team] += 100 * bonuses[player][5]
        result[team] += 100 * bonuses[player]['4ofakind']

    if result[leader_team] <= result[other_team]:
        return {leader_team: 0,
                other_team: round((result[0] + result[1]) / 10)}
    else:
        return {leader_team: round(result[leader_team] / 10),
                other_team: round(result[other_team] / 10)}


def is_available(card, on_table, on_turn, needed_color, announce):
    available = [c for c in on_turn.hand if c.color == needed_color]

    if announce in range(1, 5):  # когато играта е на коз
        trump = TRUMPS[announce]

        if needed_color == trump and len(on_table):  # когато се иска коз
            trumps = [c for c in on_table
                      if c.color == needed_color]
            best = sorted(trumps,
                          key=lambda c: PRIORITIES[6].index(c.nominal))[0]
            bigger = [c for c in available if weaker_trump(c, best)]
            if len(bigger):
                available = bigger
        # когато не се иска коз и играчът няма исканата боя
        elif not has_color(on_turn, needed_color):
            if has_color(on_turn, trump):
                trumps = [c for c in on_table
                          if c.color == trump]
                his_trumps = [c for c in on_turn.hand if c.color == trump]
                if len(trumps):  # ако играчът има коз и вече е игран друг коз
                    best = sorted(trumps,
                                  key=lambda c:
                                  PRIORITIES[6].index(c.nominal))[0]
                    his_bigger = [c for c in his_trumps
                                  if weaker_trump(c, best)]
                    if all([len(his_bigger),
                            not teammates(winner_in_hand(on_table, announce),
                                          on_turn)]):
                        available = his_bigger
                    else:
                        available = on_turn.hand
                else:
                    if teammates(winner_in_hand(on_table, announce), on_turn):
                        available = on_turn.hand
                    else:
                        available = his_trumps
            else:
                available = on_turn.hand

    if announce == 6 and len(on_table):  # на всичко коз
        trumps = [c for c in on_table
                  if c.color == needed_color]
        best = sorted(trumps,
                      key=lambda c: PRIORITIES[6].index(c.nominal))[0]
        available = [c for c in available
                     if weaker_trump(c, best)]
    if not len(available):
        available = on_turn.hand

    return card in available


def announces():
    leader = None
    announce = 0
    speakers = cycle_players(first_to_play)
    speaker = next(speakers)

    so_far = []
    availables = [i for i in range(7)]
    while len(so_far) < 4 or so_far[-3:] != [0, 0, 0]:
        if speaker == P0:
            print("Може да кажеш: ", [ANNOUNCES_PRINT[i] for i in availables])
            p = subprocess.Popen(["python", "announces.py"],
                                 stdout=subprocess.PIPE)
            line = p.stdout.readline()
            number = [c for c in str(line) if c >= '0' and c <= '9'][0]
            if int(number) in availables:
                announce = int(number)
                if announce != 0:
                    leader = P0
                    availables = list(range(announce + 1, 7))
        else:
            announce = decide_announce(speaker, availables, leader, announce)
            if announce != 0:
                availables = [0] + [i for i in range(7)][announce + 1:]
                leader = speaker
        so_far.append(announce)
        if announce != 0:
            print(speaker.name, "обяви", ANNOUNCES_PRINT[announce])
        speaker = next(speakers)
        announce = sorted(so_far)[-1]
    if announce == 0:
        return 0, None
    return announce, leader


def play_hand(deck, first_to_play, result):
    hands_played = 0
    on_table = []
    winner = None
    players = cycle_players(first_to_play)
    on_turn = next(players)
    announce = 0

    first_dial(deck)
    draw_cards()

    announce, leader = announces()

    if announce == 0:
        for player in PLAYERS:
            player.hand = []
            player.taken = []
        all_cards = []
        return
    else:
        print("=================================")
        print('Игра на {}, казана от {}'.format(ANNOUNCES_PRINT[announce],
                                                leader.name))
        print("=================================")
        second_dial(deck)

        all_cards = []
        for player in PLAYERS:
            for card in player.hand:
                all_cards.append(card)

        for player in PLAYERS:
            determine_position(player.hand, PLAYER_POSITIONS[player])

        bonuses = {}
        for player in PLAYERS:
            bonuses[player] = check_bonuses(announce, player.hand)
            if any([i[1] for i in bonuses[player].items()]):
                print(bonuses[player], "oт", player.name)

        while True:
            DISPLAYSURF.fill(DARK_GREEN)
            for card in all_cards:
                DISPLAYSURF.blit(card.image, (card.x, card.y))
            pygame.display.update()

            if len(on_table) == 4:
                hands_played += 1
                take_hand_animation(on_table, winner)
                on_table = []

            for event in pygame.event.get():
                if event.type == QUIT:
                    pygame.quit()
                    sys.exit()
                elif event.type == MOUSEBUTTONDOWN:
                    x, y = event.pos
                    for card in reversed(on_turn.hand):
                        if within(card, x, y):
                            if len(on_table) == 0:
                                needed_color = card.color
                            else:
                                if all([has_color(on_turn, needed_color),
                                       card.color != needed_color]):
                                    break
                                if not is_available(card, on_table, on_turn,
                                                    needed_color, announce):
                                    break

                            is_belote = check_for_belote(card, on_turn,
                                                         announce, bonuses)
                            bonuses = is_belote[0]
                            if is_belote[1]:
                                print("Белот oт", on_turn.name)

                            move_played_card(card)
                            play_a_card(on_turn, card, on_table)
                            card.played_by = on_turn
                            on_turn = next(players)

                            if len(on_table) == 4:
                                winner = winner_in_hand(on_table, announce)
                                for card in on_table:
                                    winner.taken.append(card)
                                players = cycle_players(winner)
                                on_turn = next(players)
                            break

                pygame.display.flip()
            if hands_played == 8:

                small_result = (calculate_points(announce, winner))
                for player in PLAYERS:
                    player.taken = []
                print("Резултат от играта:", small_result)
                for i in [0, 1]:
                    result[i] += shape_result(small_result, leader, bonuses)[i]
                print("Общ резултат: {}\n".format(result))
                break


if __name__ == '__main__':
    pygame.init()

    FPS = 30  # frames per second setting
    fpsClock = pygame.time.Clock()
    DISPLAYSURF = pygame.display.set_mode((740, 660), 0, 32)
    pygame.display.set_caption("Belote or somethin'")

    deck = Deck()
    result = {0: 0, 1: 0}
    players = cycle_players(P0)

    while True:  # the main game loop
        while result[0] < SCORE_LIMIT and result[1] < SCORE_LIMIT:
            first_to_play = next(players)
            play_hand(deck, first_to_play, result)

        pygame.display.flip()
        fpsClock.tick(FPS)
