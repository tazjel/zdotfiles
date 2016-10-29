# belot game web2py

from game_repo import *
from player_repo import *
#
#

#Pages

# <!-- {{for ll in P0_hand:}} -->

# <!-- {{for hh in ll:}} -->
# <!--      <img src={{=URL('static','images',args='images/%s' %CARDS[hh])}} alt="golem"class=bottom> -->

def _cards():
#     resp = db(db.player.game_id == game.id).select(orderby='<random>')
    lista = [list_str % dict(name=linha.name, png=linha.png)for linha in resp]
    return dict(lista=lista)
def _player_5_cards():
    list_str = """ 
        <tr class="odd gradeX">
            <td>%(nome)s</td>
            <td>%(png)s</td>
            <td><a href="%(edt)s" class="btn btn-primary btn-xs fa fa-pencil" >
                </a>
                <a href="%(delt)s" class="btn btn-primary btn-xs fa fa-trash-o" >
                </a>
            </td>
        </tr>
    """
    resp = db(Grupo).select(orderby=~Grupo.id)
    lista = [list_str % dict(nome=linha.nome,\
                             desc=linha.desc,\
                             edt=URL('grupo', 'editar', args=linha.id),\
                             delt=URL('grupo', 'deletar', args=linha.id),\
                             )for linha in resp]
    return dict(lista=lista)

def index():
    return

@auth.requires_login()
def current():
    games = db((db.game.id == db.player.game_id) & (db.player.user_id == auth.user_id)).select(db.game.ALL)

    return dict(games = games)


def info():
    game = GetGame(request.args[0])
    CARDS = {}

    if game is None:
        return response.render('game/notfound.html')
    CARDS = {(7, 'C'): '7spatiq.png', (7, 'D'): '7karo.png',
         (7, 'H'): '7kupa.png', (7, 'S'): '7pika.png',
         (8, 'C'): '8spatiq.png', (8, 'D'): '8karo.png',
         (8, 'H'): '8kupa.png', (8, 'S'): '8pika.png',
         (9, 'C'): '9spatiq.png', (9, 'D'): '9karo.png',
         (9, 'H'): '9kupa.png', (9, 'S'): '9pika.png',
         (10, 'C'): '10spatiq.png', (10, 'D'): '10karo.png',
         (10, 'H'): '10kupa.png', (10, 'S'): '10pika.png',
         (11, 'C'): '11spatiq.png', (11, 'D'): '11karo.png',
         (11, 'H'): '11kupa.png', (11, 'S'): '11pika.png',
         (12, 'C'): '12spatiq.png', (12, 'D'): '12karo.png',
         (12, 'H'): '12kupa.png', (12, 'S'): '12pika.png',
         (13, 'C'): '13spatiq.png', (13, 'D'): '13karo.png',
         (13, 'H'): '13kupa.png', (13, 'S'): '13pika.png',
         (14, 'C'): '14spatiq.png', (14, 'D'): '14karo.png',
         (14, 'H'): '14kupa.png', (14, 'S'): '14pika.png'}

    players = GetPlayersByGame(game.id)

    return dict(game = game, players = players, CARDS = CARDS)


#Partial Pages


def _gamebuttons():
    game = GetGame(request.args[0])
    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))
    btn = {'join':False, 'leave':False, 'start':False, 'delete':False, 'edit':False}
	#
#     btn_auction = {'join':False, 'leave':False, 'start':False, 'delete':False, 'edit':False}
# , btn_auction = btn_auction
    if auth.user is None:
        return dict(game = game, btn = btn)

    if player is None and game.status_id.name == 'not started':
        btn['join'] = True

    if player is not None and player.role_id.name != 'host':
        btn['leave'] = True

    if (player is not None) and (player.role_id.name == 'host'):
        btn['delete'] = True
        btn['edit'] = True
        if game.status_id.name == 'not started':
            btn['start'] = True

    return dict(game = game, btn = btn)

def _offer():
    if not auth.user_id:
        return ''

    game = GetGame(request.args[0])
    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))


#     cards = [Card(c[0], c[1]) for c in itertools.product(range(7, 15), ['Heart', 'Diamond', 'Spade', 'Club'])]
    if not player:
        return ''

#     if game.status_id.name == 'started':
#         return ''
#     if game.status_id.name == 'started':
#         return ''

    return dict(game = game, player = player)

#
def _deal_btn():
    game = GetGame(request.args[0])
    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))
    btn = {'sun':False, 'trump':False, 'pass':False, 'no':False, 'more':False}
    if (player is not None) and (player.role_id.name == 'host'):
#         btn['trump'] = True
#         btn['sun'] = True
        if game.status_id.name == 'started':
            btn['pass'] = True
            btn['trump'] = True
            btn['sun'] = True

    return dict(game = game, btn = btn)


@auth.requires_login()
def sun():
    game = GetGame(request.post_vars.id)

    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))
    game.update_record(status_id = 17)
#     if player:
#         return dict(success = False)

#     id = db.player.insert(game_id = game.id, user_id = auth.user_id, role_id = 2, status_id = 1)
    return dict(success = True)



def _cards():
    game = GetGame(request.args[0])
    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id)) 
    crd = {'five':False, 'eight':False, 'start':False, 'delete':False, 'edit':False}
#     cards = [Card(c[0], c[1]) for c in itertools.product(range(7, 15), ['Heart', 'Diamond', 'Spade', 'Club'])]
#     if not player:
#     card_btn = """ <img src={{=URL('static','images',args='images/%(nome)s')}} alt="golem"class=bottom>""" resp = db(db.player.game_id == game.id).select(orderby='<random>')
#     lista = [card_btn % dict(nome=linha.nome,\
#                                  desc=linha.desc,\
#                                  edt=URL('grupo', 'editar', args=linha.id),\
#                                  delt=URL('grupo', 'deletar', args=linha.id),\
#                                  )for linha in resp]
    CARDS = {}

#     if not auth.user_id:
#         return ''

#     game = GetGame(request.args[0])
#     player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))

#     if not player:
        return ''

    if game.status_id.name == 'started':
        crd['five'] = True

    return dict(game = game, player = player, crd = crd)

def _playerinfo():
    if not auth.user_id:
        return ''

    game = GetGame(request.args[0])
    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))

    if not player:
        return ''

    if game.status_id.name == 'not started':
        return ''

    return dict(game = game, player = player)

#Ajax
@auth.requires_login()
def deletegame():
    game = GetGame(request.post_vars.id)

    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))

    if player is None:
        return dict(success = False)
    if not player.role_id == db.player_type(db.player_type.name == 'host'):
        return dict(success = False)

    db(db.game.id == game.id).delete()
    return dict(success = True)

@auth.requires_login()
def joingame():
    game = GetGame(request.post_vars.id)

    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))

    if player:
        return dict(success = False)

    id = db.player.insert(game_id = game.id, user_id = auth.user_id, role_id = 2, status_id = 1)
    return dict(success = True)

@auth.requires_login()
def leavegame():
    game = GetGame(request.post_vars.id)

    player = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))

    if not player:
        return dict(success = False)

    if player.role_id.name == 'host':
        return dict(success = False)

    db(db.player.id == player.id).delete()


    return dict(success = True)

@auth.requires_login()
def startgame():
    game = GetGame(request.post_vars.id)

    hostplayer = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))

    if hostplayer is None:
        return dict(success = False)
    if not hostplayer.role_id.name == 'host':
        return dict(success = False)

    players = db(db.player.game_id == game.id).select(orderby='<random>')

    player = players[-1]
    target = players[0]
    player.update_record(target_id = target.id, status_id = 1)

    for i in range (0, len(players)-1):
		player = players[i]
		target = players[i+1]
		player.update_record(target_id = target.id, status_id = 1)

    game.update_record(status_id = 2)
   
    return dict(success = True)

@auth.requires_login()
def killplayer():
    player = db.player(request.post_vars.id)
    game = GetGame(player.game_id)
    hostplayer = db.player((db.player.user_id == auth.user_id) & (db.player.game_id == game.id))

    if player.user_id == auth.user_id:
        pass
    elif hostplayer is not none:
        pass
    else:
        return dict(success = False, message = 'Nice try buddy')

    if game.status_id.name == 'started':
        db(db.player.target_id == player.id).update(target_id = player.target_id)
        player.update_record(target_id = player.id, status_id = 2)
        CheckEndGame(game.id)

    return dict(success = True)

#Private?

def CheckEndGame(game_id):
    aliveplayers = db((db.player.status_id.name == 'alive') & (db.player.game_id == game_id)).select()
    if len(aliveplayers) <= 1:
        db(db.game.id == game_id).update(status_id = 3)
    return
