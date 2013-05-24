# Enter script code
from random import randrange
announcement = ["rRREses","","DARN","","OH BOY","","COME HERE","","TP ME","","MESHUGANA","","OY",""]
declaration = ["I could seriously use some help here","The devs must be crazy","","Dodge bullets? Sure. But this","MONSTERS"]
expletives = ["!","!!","!!!","!!!!1","!!!1!","!!1!1!"]

if not store.has_key("mana"):
    # set the key 'persistant variable' if we don't have it already
    # or if the value is greater than 8 reset it to 5
    store.set_value("mana",5)

mana = store.get_value("mana")
if mana > 8:
    mana = 5

part1 = announcement[randrange(len(announcement))]
part2 = declaration[randrange(len(declaration))]

if part1 != "":
    part1 = part1 + expletives[randrange(len(expletives))]
if part2 != "":
    part2 = part2 + expletives[randrange(len(expletives))]

output = "/yell " + part1 + " " + part2 + "\n"
keyboard.send_keys(output)

#do the mana thing
output = str(mana)
keyboard.send_key(output)
#increment the mana
mana = mana + 1
store.set_value("mana",mana)