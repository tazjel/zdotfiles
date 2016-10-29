# -*- coding: utf-8 -*-


from deck import Deck
import random
from order import Order
order = Order()

class Game:

    def __init__(self, player_1, player_2, player_3, player_4, deck):

        self.loot_team_1 = []
        self.bonus_value_team_1 = 0
        self.loot_team_2 = []
        self.bonus_value_team_2 = 0
        self.players_list = [player_1, player_2, player_3, player_4]

        self.deal(player_1, player_2, player_3, player_4, deck)

        self.contract_value, self.trump, self.contracting_team = self.launch_auction()

        self.set_trump(deck, self.trump)
        self.deal(player_1, player_2, player_3, player_4, deck)
        self.check_for_belote(player_1, player_2, player_3, player_4)#         print(" ------- Game On -------")
        for i in range(1, 9):
            self.state = []
            self.add_card_to_state(player_1)
            self.add_card_to_state(player_2)
            self.add_card_to_state(player_3)
            self.add_card_to_state(player_4)

#             print("---------- state " + str(i) + "  ----------")
#             self.display_state()

            winning_player_position = self.resolve_state()
            if winning_player_position == 1 or winning_player_position == 3:
                for card in self.state:
                    self.loot_team_1.append(card)
            else:
                for card in self.state:
                    self.loot_team_2.append(card)

        if winning_player_position == 1 or winning_player_position == 3:
            self.bonus_value_team_1 += + 10
        else:
            self.bonus_value_team_2 += + 10

#         self.display_loot()

    def resolve_state(self):

        if order.compare_cards_is_bigger(self.state[0], self.state[1]):
            if order.compare_cards_is_bigger(self.state[0], self.state[2]):
                if order.compare_cards_is_bigger(self.state[0], self.state[3]):
                    return 1
                else:
                    return 4
            else:
                if order.compare_cards_is_bigger(self.state[2], self.state[3]):
                    return 3
                else:
                    return 4
        else:
            if order.compare_cards_is_bigger(self.state[1], self.state[2]):
                if order.compare_cards_is_bigger(self.state[1], self.state[3]):
                    return 2
                else:
                    return 4
            else:
                if order.compare_cards_is_bigger(self.state[2], self.state[3]):
                    return 3
                else:
                    return 4

    def add_card_to_state(self, player):
        self.state.append(player.play_card(self.state))
        # self.state.append(player.play_card(0))

    def deal(self, player_1, player_2, player_3, player_4, deck):

        player_1.get_cards(deck)
        player_2.get_cards(deck)
        player_3.get_cards(deck)
        player_4.get_cards(deck)

    def launch_auction(self):

        contestants_list = self.players_list
        contract_history = []

        while len(contestants_list) > 0:
            response = contestants_list[0].contract_response(contract_history)
            if response == "dropout":
                contestants_list.pop(0)
            else:
                contract_history.append(response)
                contestants_list.append(contestants_list.pop(0))

#         print(contract_history)

        # return the last/highest response
        return contract_history[-1][0], contract_history[-1][1], (contract_history[-1][2])



    def set_trump(self, deck, trump_color):

        deck.set_trump(trump_color)

    def display_state(self):

		statez = []
# 		for card in self.state:
# 			statez.append(card)
# 		return statez

    def check_for_belote(self, player_1, player_2, player_3, player_4):
        for player in [player_1, player_2, player_3, player_4]:
            pair = 0
            for card in player.cards:
                if card.trump and (card.value == 12 or card.value == 13):
                    pair += 1
            if pair == 2:
                if player.player_position == 1 or player.player_position == 3:
                    self.bonus_value_team_1 += 20
                else:
                    self.bonus_value_team_2 += 20


    def display_loot(self):

#         print("------- Results & Loots -------")
#         print("Loot Team 1")
#         lootz = []
	
# 		(card.value, card.color) for (card.value, card.color) in self.loot_team_1]
#         for card in self.loot_team_1:
# 			lootz.append(card)
        #
#         print("Loot Team 2")
        #
#         for card in self.loot_team_2:
#             print(card.value, card.color)

        value_team_1 = (order.compute_value(self.loot_team_1) + self.bonus_value_team_1)
        value_team_2 = (order.compute_value(self.loot_team_2) + self.bonus_value_team_2)
#
#         v1 = "Value Team 1: " + str(value_team_1)
        v1 = str(value_team_1)
        v2 = str(value_team_2)

        con_value = self.contract_value
# 		for team " + str(self.contracting_team)
# 		con_team = self.contracting_team
        if self.contracting_team == 1:
            if self.contract_value < value_team_1:
                con = "WIN TEAM 1"
            else:
               con = "LOSE TEAM 1"
        else:
            if self.contract_value < value_team_2:
                con = "WIN TEAM 2"
            else:
                con = "LOSE TEAM 2"
        end = "Contract was " + str(self.contract_value)# + " for team " + str(self.contracting_team)
        return end, v1, v2, con
