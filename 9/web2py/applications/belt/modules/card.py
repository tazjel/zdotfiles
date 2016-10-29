class Card():

    def __init__(self, value, color, trump=None):
        self.value = value
        self.color = color
        self.trump = trump

    def __repr__(self):
        return str(self.value) + self.color

    def __str__(self):
        return str(self.value) + self.color
