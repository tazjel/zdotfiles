from card import Card
from deck import Deck
from players.interface_player import Hand


class PlayerDummy(Hand):

    def __init__(self, name, player_position, player_team):
       #super().__init__(name, player_position, player_team)
       self.name = name
       self.player_position = player_position
       self.player_team = player_team

    def play_card(self, state):
        return self.cards.pop(0)

    def contract_response(self, contract_history):
        if len(contract_history) == 0:
            contract_offer = [80, "Spade", self.player_team]
            return contract_offer
        else:
            return "dropout"
