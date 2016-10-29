import pygame
import sys
import os
from pygame.locals import *


WHITE = (255, 255, 255)

SURF_X = 170
SURF_Y = 360

Y_COORDS = [12, 53, 93, 131, 167, 205, 241, 286, 320]

BUTTON_IMAGES = {'pas': ['pas.png', 'pasL.png', 'pas.png'],
                 'spatiq': ['spatiq.png', 'spatiqL.png', 'spatiqD.png'],
                 'karo': ['karo.png', 'karoL.png', 'karoD.png'],
                 'kupa': ['kupa.png', 'kupaL.png', 'kupaD.png'],
                 'pika': ['pika.png', 'pikaL.png', 'pikaD.png'],
                 'bezkoz': ['bezkoz.png', 'bezkozL.png', 'bezkozD.png'],
                 'vsichkokoz': ['vsichkokoz.png', 'vsichkokozL.png',
                                'vsichkokozD.png'],
                 'kontra': ['kontra.png', 'kontraL.png', 'kontraD.png'],
                 'rekontra': ['rekontra.png', 'rekontraL.png',
                              'rekontraD.png']}


def within(card, x, y):
    if x < card.x or y < card.y or x > card.xmax or y > card.ymax:
        return False
    return True


class Button:
    def __init__(self, images, available=True):
        self.images = images
        fullname = os.path.join('images', images[0])
        self.image = pygame.image.load(fullname)
        self.available = available


Pas = Button(BUTTON_IMAGES['pas'])
Spatiq = Button(BUTTON_IMAGES['spatiq'])
Karo = Button(BUTTON_IMAGES['karo'])
Kupa = Button(BUTTON_IMAGES['kupa'])
Pika = Button(BUTTON_IMAGES['pika'])
BezKoz = Button(BUTTON_IMAGES['bezkoz'])
VsichkoKoz = Button(BUTTON_IMAGES['vsichkokoz'])

Kontra = Button(BUTTON_IMAGES['kontra'], False)
Kontra.image = pygame.image.load(os.path.join('images', Kontra.images[2]))
Rekontra = Button(BUTTON_IMAGES['rekontra'], False)
Rekontra.image = pygame.image.load(os.path.join('images', Rekontra.images[2]))


BUTTONS = [Pas, Spatiq, Karo, Kupa, Pika, BezKoz,
           VsichkoKoz, Kontra, Rekontra]
ANNOUNCES = {Pas: 0, Spatiq: 1, Karo: 2, Kupa: 3, Pika: 4,
             BezKoz: 5, VsichkoKoz: 6, Kontra: 10, Rekontra: 100}
ANNOUNCES_REV = {v: k for k, v in ANNOUNCES.items()}


# def update_buttons(availables):
#     #print("These are availables:", availables)
#     #print("len:", len(availables))
#     for button in BUTTONS:
#         button.available = ANNOUNCES[button] in availables
#     Karo.available = False
#     Karo.image = pygame.image.load(Karo.images[2])

#     for button in BUTTONS:
#         if button.available:
#             button.image = pygame.image.load(button.images[0])
#         else:
#             button.image = pygame.image.load(button.images[2])


for button, y in zip(BUTTONS, Y_COORDS):
    button.x = (SURF_X - button.image.get_size()[0]) / 2
    button.xmax = button.x + button.image.get_size()[0]
    button.y = y
    button.ymax = button.y + button.image.get_size()[1]


pygame.init()
surf = pygame.display.set_mode((SURF_X, SURF_Y))
surf.fill(WHITE)
pygame.display.set_caption("Choose")


pygame.display.flip()


if __name__ == "__main__":
    while True:
        for button in BUTTONS:
            surf.blit(button.image, (button.x, button.y))
            pygame.display.update()

        for event in pygame.event.get():
            if event.type == QUIT:
                pygame.quit()
                sys.exit()
            pos = pygame.mouse.get_pos()

            for button in [b for b in BUTTONS if b.available]:
                if within(button, pos[0], pos[1]):
                    fullname = os.path.join('images', button.images[1])
                    button.image = pygame.image.load(fullname)
                    surf.blit(button.image, (button.x, button.y))
                    pygame.display.flip()
                else:
                    fullname = os.path.join('images', button.images[0])
                    button.image = pygame.image.load(fullname)
                    surf.blit(button.image, (button.x, button.y))
                    pygame.display.flip()
            if event.type == MOUSEBUTTONDOWN:
                x, y = event.pos
                for b in [b for b in BUTTONS if b.available]:
                    if within(b, x, y):
                        announce = ANNOUNCES[b]
                        print(announce)
                        pygame.quit()
                        sys.exit()
