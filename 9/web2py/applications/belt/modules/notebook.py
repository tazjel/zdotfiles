from deck import Deck
from players.playerRandomPlayableCards import PlayerRandomPlayableCards
from players.playerDummy import PlayerDummy
from order import Order
from game import Game

deck = Deck()
order = Order()

# Shuffle Deck
# deck.shuffle()
# deck.display_deck()

# Set players
player_1 = PlayerRandomPlayableCards("player_1", 1, 1)
player_2 = PlayerRandomPlayableCards("player_2", 2, 2)
player_3 = PlayerRandomPlayableCards("player_3", 3, 1)
player_4 = PlayerRandomPlayableCards("player_4", 4, 2)

# Game start
game = Game(player_1, player_2, player_3, player_4, deck)






