import random
from card import Card
from deck import Deck
from order import Order
from players.interface_player import Hand
order = Order()


class PlayerRandomPlayableCards(Hand):

    def __init__(self, name, player_position, player_team):
        self.name = name
        self.player_position = player_position
        self.player_team = player_team

    def play_card(self, state):
        playable_cards = self.find_playable_cards(state)
        chosen_card = playable_cards[random.randint(0, len(playable_cards)-1)]
        index = self.cards.index(chosen_card)
        return self.cards.pop(index)

    def find_playable_cards(self, state):

        if len(state) == 0:
            return self.cards
        else:
            list_trump = []
            list_bigger_trump = []
            list_asked_color = []
            played_card = state[0]
            for card_overlook in self.cards:
                if card_overlook.color == played_card.color:
                    list_asked_color.append(card_overlook)
                if card_overlook.trump:
                    list_trump.append(card_overlook)
                    if order.compare_cards_is_bigger(card_overlook, state[0]):
                        list_bigger_trump.append(card_overlook)

        if not played_card.trump:
            if len(list_asked_color) == 0:
                if len(list_trump) == 0:
                    return self.cards
                else:
                    return list_trump
            else:
                return list_asked_color
        else:
            if len(list_bigger_trump) == 0:
                if len(list_trump) == 0:
                    return self.cards
                else:
                    return list_trump
            else:
                return list_bigger_trump

    def contract_response(self, contract_history):
        if len(contract_history) == 0:
            contract_offer = [80, "Spade", self.player_position]
            return contract_offer
        else:
            return "dropout"
