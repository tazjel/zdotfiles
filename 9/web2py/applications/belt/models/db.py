# -*- coding: utf-8 -*-


if not request.env.web2py_runtime_gae:
    ## if NOT running on Google App Engine use SQLite or other DB
    db = DAL('sqlite://storage.sqlite',pool_size=1,check_reserved=['all'])
else:
    ## connect to Google BigTable (optional 'google:datastore://namespace')
    db = DAL('google:datastore+ndb')
    ## store sessions and tickets there
    session.connect(request, response, db=db)
    ## or store session in Memcache, Redis, etc.
    ## from gluon.contrib.memdb import MEMDB
    ## from google.appengine.api.memcache import Client
    ## session.connect(request, response, db = MEMDB(Client()))

## by default give a view/generic.extension to all actions from localhost
## none otherwise. a pattern can be 'controller/function.extension'
response.generic_patterns = ['*'] if request.is_local else []


from gluon.tools import Auth, Service, PluginManager
import random
import itertools

auth = Auth(db)
service = Service()
plugins = PluginManager()

#
from gluon import current
current.db = db



# before define_tables()
auth.settings.extra_fields['auth_user'] = [
    Field('username', unique=True),
    Field('name', required=IS_NOT_EMPTY())
    ]

## create all tables needed by auth if not custom tables
auth.define_tables(username=False, signature=False)

## configure email
mail = auth.settings.mailer
mail.settings.server = 'logging' if request.is_local else 'smtp.gmail.com:587'
mail.settings.sender = 'tazjel@gmail.com'
mail.settings.login = 'tazjel@gmail.com:WQazzaq1'

## configure auth policy
auth.settings.registration_requires_verification = False
auth.settings.registration_requires_approval = False
auth.settings.reset_password_requires_verification = True

## if you need to use OpenID, Facebook, MySpace, Twitter, Linkedin, etc.
## register with janrain.com, write your domain:api_key in private/janrain.key
from gluon.contrib.login_methods.janrain_account import use_janrain
use_janrain(auth, filename='private/janrain.key')

db.auth_user.first_name.readable = db.auth_user.first_name.writable = False
db.auth_user.last_name.readable = db.auth_user.last_name.writable = False
auth.settings.login_next = URL("game","current")
auth.settings.logout_next = URL("default","login")
auth.settings.login_url = URL("default", "login")

#

db.define_table('game_cycle',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('contract_offers',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('player_dealer',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('player_team',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('player_buyer',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('deck',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )



db.define_table('hand_0',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('hand_1',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )
db.define_table('hand_2',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('hand_3',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('table_offer',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('loot_1',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('loot_2',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )
db.define_table('scores',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('game_status',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('player_status',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('player_type',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('game',
    Field('name', default='Default Game', required=IS_NOT_EMPTY()),
    Field('description', 'text', default='room'),
    Field('status_id', 'reference game_status', notnull=True)
    )

db.define_table('player',
    Field('game_id', 'reference game', notnull=True),
    Field('user_id', 'reference auth_user', notnull=True),
    Field('target_id', 'reference player'),
    Field('status_id', 'reference player_status', notnull=True),
    Field('role_id', 'reference player_type', notnull=True)
    )

db.define_table('zplayer',
    Field('game_id', 'reference game', notnull=True),
    Field('user_id', 'reference auth_user', notnull=True),
    Field('target_id', 'reference player'),
    Field('hand_0', 'reference hand_0'),
    Field('hand', 'reference hand_0'),
#     Field('taken', 'reference '),
    Field('status_id', 'reference player_status', notnull=True),
    Field('role_id', 'reference player_type', notnull=True)
    )

# PLAYERS = [P0, P1, P00, P11]

# PLAYER_POSITIONS = {P0: DOWN, P1: RIGHT, P00: UP, P11: LEFT}

# Field('_id', 'reference player_status', notnull=True),
# player status

db.player_status.update_or_insert(id = 1, name = 'alive')
db.player_status.update_or_insert(id = 2, name = 'dead')

db.player_status.update_or_insert(id = 3, name = 'dealer_1')
db.player_status.update_or_insert(id = 4, name = 'dealer_2')
db.player_status.update_or_insert(id = 5, name = 'dealer_other_1')
db.player_status.update_or_insert(id = 6, name = 'dealer_other_2')
db.player_status.update_or_insert(id = 7, name = 'buyer')

# player type

db.player_type.update_or_insert(id = 1, name = 'host')
db.player_type.update_or_insert(id = 2, name = 'player')
db.player_type.update_or_insert(id = 3, name = 'banned', description = 'A player that is no longer allowed to join this game')
db.player_type.update_or_insert(id = 4, name = 'gone', description = 'A player that has left the game after it has started')
db.player_type.update_or_insert(id = 5, name = 'watching', description = 'A player that is no longer allowed to join this game')
db.player_type.update_or_insert(id = 6, name = 'reserve', description = 'A player that is no longer allowed to join this game')

########################

# order_classic = [11, 10, 14, 13, 12, 9, 8, 7]
cards_sun = [11, 14, 13, 12, 10, 9, 8, 7]
order_classic = [11, 10, 14, 13, 12, 9, 8, 7]
order_trump = [12, 9, 11, 10, 14, 13, 8, 7]

value_classic = [11, 10, 4, 3, 2, 0, 0, 0]
value_trump = [20, 14, 11, 10, 4, 3, 0, 0]

# db.define_table('classic', Field('name', required=IS_NOT_EMPTY()), Field('description'), Field('order_b'), Field('c_value')) db.define_table('rewards', Field('name', required=IS_NOT_EMPTY()), Field('description'), Field('order_b'), Field('value_A'))


db.define_table('peer_rating',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description'),
	Field('order_b'),
	Field('value_A')
    )

# Card

db.define_table('card',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description'),
	Field('color'),
	Field('svg'),
	Field('png'),
	Field('sun_value'),
	Field('sun_order'),
	Field('trump_value'),
	Field('trump_order'),
    Field('trump_status')
    )





# for card, value in CARDS[]:
#     db.card.update_or_insert(name = card, png = value)

# for color in ['C', 'D', 'H', 'S']:
    # for nominal in range(7, 15):
#         db.card.update_or_insert(name = '(%s, \'%s\')' %(nominal,color), png = CARDS[  )
#         db.card.update_or_insert(name = '(%nominals, %colors)' %dict(nominal = nominal, color = color))
# db.cards.update_or_insert(id = 0, name = 'gone', description = 'A player that has left the game after it has started')

# db.define_table('state_now', Field('name', required=IS_NOT_EMPTY()), Field('description'))

db.define_table('loot',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('cards_order_b_',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('deal',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('cards_value_As',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('auction',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('auction_history',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('contract',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )

db.define_table('bonus_value_A_team_1',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('bonus_value_A_team_2',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('check_for_belote',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


db.define_table('check_for_con',
    Field('name', required=IS_NOT_EMPTY()),
    Field('description')
    )


# from card import Card
# cards = [Card(c[0], c[1]) for c in itertools.product(range(7, 15), ['Heart', 'Diamond', 'Spade', 'Club'])]

#         deck = [Card(c[0], c[1]) for c in itertools.product(range(7, 15), ['Heart', 'Diamond', 'Spade', 'Club'])]


db.game_status.update_or_insert(id = 1, name = 'not started')
db.game_status.update_or_insert(id = 2, name = 'started')
db.game_status.update_or_insert(id = 3, name = 'finished')
db.game_status.update_or_insert(id = 4, name = 'deal')
db.game_status.update_or_insert(id = 5, name = 'first')

db.game_status.update_or_insert(id = 6, name = 'sun')
db.game_status.update_or_insert(id = 7, name = 'trump')

db.game_status.update_or_insert(id = 8, name = 'trump_2_open')

db.game_status.update_or_insert(id = 9, name = 'trump_2_close')


db.game_status.update_or_insert(id = 10, name = 'trump_3_open')

db.game_status.update_or_insert(id = 11, name = 'trump_3_close')

db.game_status.update_or_insert(id = 12, name = 'trump_4_open')

db.game_status.update_or_insert(id = 13, name = 'trump_4_close')

db.game_status.update_or_insert(id = 14, name = 'trump_5_open')

db.game_status.update_or_insert(id = 15, name = 'sun_2')

db.game_status.update_or_insert(id = 16, name = 'casho')

# auction
db.game_status.update_or_insert(id = 17, name = '1_1')
db.game_status.update_or_insert(id = 18, name = '1_2')
db.game_status.update_or_insert(id = 19, name = '1_3')
db.game_status.update_or_insert(id = 20, name = '1_4')
db.game_status.update_or_insert(id = 21, name = '2_1')
db.game_status.update_or_insert(id = 22, name = '2_2')
db.game_status.update_or_insert(id = 23, name = '2_3')
db.game_status.update_or_insert(id = 24, name = '2_3')
db.game_status.update_or_insert(id = 25, name = '2_4')
db.game_status.update_or_insert(id = 26, name = '2_5')
db.game_status.update_or_insert(id = 27, name = '3_1')
