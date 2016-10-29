from game_repo import *

@auth.requires_login()
def index():
    return dict()

@auth.requires_login()
def creategame():
    name = request.post_vars.name
    description = request.post_vars.description
    
    id = CreateGame(name, description, auth.user_id)
    
    redirect( URL('game','info', args = [id]))