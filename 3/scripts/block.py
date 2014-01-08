import bge
gl = bge.logic
cont = gl.getCurrentController()
se = gl.getCurrentScene()
obs = se.objects
own = cont.owner

outline = obs['outline']

lclick = cont.sensors['lclick']
rclick = cont.sensors['rclick']
blockray = cont.sensors['blockray']
holdclick = cont.sensors['holdclick']

def clearChildren(block):
    if len(block.children) > 0:
        for x in block.children:
            x.endObject()
    
if lclick.positive and blockray.positive:
    own['destroy'] += 1
    block = blockray.hitObject
    if block != gl.lastblock and gl.lastblock != "":
        clearChildren(gl.lastblock)
        own['destroy'] = 0
    if own['destroy'] <= 10 and not 'instabreak' in block:
        if len(block.children) > 0:
            block.children[0].endObject()
            gl.lastblock = block
            destroy = se.addObject("destroy"+str(own['destroy']), block)
            destroy.setParent(block)
        else:
            gl.lastblock = block
            destroy = se.addObject("destroy"+str(own['destroy']), block)
            destroy.setParent(block)            
    else:
        block.endObject()
        gl.lastblock = ""
        own['destroy'] = 0
elif not holdclick.positive:
    if gl.lastblock != "":
        clearChildren(gl.lastblock)    
    own['destroy'] = 0
    
if blockray.positive:
    outline.visible = 1
    outline.position = blockray.hitObject.position
else:
    outline.visible = 0
    
if rclick.positive and blockray.positive:
    norm = blockray.hitNormal
    block = blockray.hitObject
    pos = block.position.copy()
    pos[0] += round(norm[0]*2)
    pos[1] += round(norm[1]*2)
    pos[2] += round(norm[2]*2)
    box = own.parent.position
    if abs(box[0] - pos[0]) > 2 or abs(box[1] - pos[1]) > 2 or abs(box[2] - pos[2]) > 2.5:
        name = gl.selected
        if name == "Torch":
            if round(norm[2]) == 0:
                name = "Torch2"
        newblock = se.addObject(name, "outline")
        newblock.position = pos
        if name == "Torch2":
            norm2 = norm.copy()
            temp = norm2[1]
            norm2[1] = norm2[0]
            norm2[0] = temp
            newblock.orientation = [norm, norm2, [0,0,1]]
        if name == "Torch" or name == "Torch2":
            lamp = se.addObject("torchLight", block)
            lamp.position = newblock.position
            lamp.setParent(newblock)            

                
