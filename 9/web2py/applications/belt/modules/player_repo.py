def GetPlayersByGame(id):
    from gluon import current
    db = current.db
    return db(db.player.game_id == id).select()
    
def CreatePlayer(game_id, user_id):
    from gluon import current
    db = current.db

    player = db((db.player.game_id == game_id) & (db.player.user_id == user_id))
    
    if player:
        return player
        
    id = db.player.insert(game_id = id, user_id = user_id, role_id = 1, status_id = 1)
    return id
 