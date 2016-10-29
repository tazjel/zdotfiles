from player_repo import CreatePlayer

def GetGame(id):
    from gluon import current
    db = current.db
    
    return db.game(id)

def GetAllGames():
    from gluon import current
    db = current.db
    
    return db(db.game.id > 0).select()
    
def CreateGame(name, description, user_id):
    from gluon import current
    db = current.db
    
    id = db.game.insert(name = name, description = description, status_id = 1)
    db.player.insert(game_id = id, user_id = user_id, role_id = 1, status_id = 1)
    return id
    
def GetGamesByUser(id):
    from gluon import current
    db = current.db
    
    return db((db.game.id == db.player.game_id) & (db.player.user_id == id)).select(db.game.ALL)

