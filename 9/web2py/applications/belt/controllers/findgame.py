from game_repo import *

def index():
    games = GetAllGames()
    return dict(games = games)