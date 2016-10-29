from card import Card
import random
import itertools

class Deck():

    def __init__(self):
        self.deck = [Card(c[0], c[1]) for c in itertools.product(range(7, 15), ['Heart', 'Diamond', 'Spade', 'Club'])]

    def shuffle(self):
        random.shuffle(self.deck)

    def display_deck(self):
		self.deck

    def set_trump(self, card_color):
        for card in self.deck:
            if card.color == card_color:
                card.trump = True
            else:
                card.trump = False
