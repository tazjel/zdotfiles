# Author : Ahmed Bani
from card import Card


class Order:

    def __init__(self):
        self.order_classic = [11, 10, 14, 13, 12, 9, 8, 7]
        self.order_trump = [12, 9, 11, 10, 14, 13, 8, 7]

        self.value_classic = [11, 10, 4, 3, 2, 0, 0, 0]
        self.value_trump = [20, 14, 11, 10, 4, 3, 0, 0]

    def compare_cards_is_bigger(self, card_1, card_2):
        if card_1.trump == card_2.trump:
            if card_1.trump:
                return self.order_trump.index(card_1.value) < self.order_trump.index(card_2.value)
            else:
                if card_1.color == card_2.color:
                    return self.order_classic.index(card_1.value) < self.order_classic.index(card_2.value)
                else:
                    return True
        else:
            return card_1.trump

    def compute_value(self, list_of_cards):

        value = 0
        for card in list_of_cards:
            if card.trump:
                value += self.value_trump[self.order_trump.index(card.value)]
            else:
                value += self.value_classic[self.order_classic.index(card.value)]

        return value

if __name__ == '__main__':

    order = Order()
    card_9_heart = Card(9, "Heart", False)
    card_10_heart = Card(10, "Heart", False)
    card_9_spade = Card(9, "Spade", True)
    card_10_spade = Card(10, "Spade", True)
    card_10_diamond = Card(10, "Diamond", False)
    list_of_cards = [card_9_heart, card_10_heart, card_9_spade, card_10_spade, card_10_diamond]

    print(order.compare_cards_is_bigger(card_9_heart, card_10_heart))  # False
    print(order.compare_cards_is_bigger(card_10_heart, card_9_heart))  # True

    print(order.compare_cards_is_bigger(card_9_spade, card_10_spade))   # True
    print(order.compare_cards_is_bigger(card_10_spade, card_9_spade))  # False

    print(order.compare_cards_is_bigger(card_10_spade, card_10_heart))  # True
    print(order.compare_cards_is_bigger(card_10_heart, card_10_spade))  # False

    print(order.compare_cards_is_bigger(card_10_heart, card_10_diamond))  # True
    print(order.compare_cards_is_bigger(card_10_diamond, card_10_heart))  # True

    print(str(order.compute_value(list_of_cards)))  # 44

