import bpy

def createSensor(ob, sensor_type, sensor_name, pulse=[False, False], value=None, level = False, tap = False, invert = False, frequency = 0):
    bpy.ops.logic.sensor_add( type=sensor_type.upper() )
    sen = ob.game.sensors[-1]
    sen.name = sensor_name
    if hasattr(sen, 'value'):
        sen.value = value
		
    sen.use_pulse_true_level, sen.use_pulse_false_level = pulse
    sen.use_tap = tap
    sen.use_level = level
    sen.invert = invert
    sen.frequency = frequency
    return sen
	
		
def typeToMethod(thing):
    types = {
    float:'FLOAT',
    str:'STRING',
    int:'INT',
    bool:'BOOL',
    }
    try:
        if thing in types:
            return types[thing]
        t = type(thing)
        if t in types:
            return types[t]
    except:
        pass
def createController(ob, controller_name, controller_type, controller_value, sensor = None, module = None, state = 1 ):
    bpy.ops.logic.controller_add()
    cont = ob.game.controllers[-1]
    cont.name = controller_name
    cont.type = controller_type.upper()
    if sensor:
        cont.link(sensor)
        
    cont = ob.game.controllers[-1]
    
    if module:
        if controller_value.endswith('.py'):
            controller_value = controller_value[:-3]
        cont.mode = 'MODULE'
        cont.module = controller_value+'.'+module
    else:
        cont.text = controller_value
        
    cont.states = state
    
    return cont
    
def createProperty(ob, property_name, property_value):   
    bpy.ops.object.game_property_new()
    prop = ob.game.properties[-1]
    prop.name = property_name
    
    property_type = typeToMethod(property_value)
    if property_type:
        prop.type = property_type.upper()
    prop = ob.game.properties[-1] # Re-adjust the type of property as string
    prop.value = property_value
    #print('added {0} property, name "{1}" and value "{2}"'.format(property_type.upper(), property_name, property_value))
    return prop
    
def getProperty(ob, property_name):
    same_properties = [p for p in ob.game.properties if p.name == property_name]
    if same_properties:
        return same_properties[0]
    return

def modifyProperty(ob, property_name, new_value):
    same_properties = [p for p in ob.game.properties if p.name == property_name]
    if same_properties:
        same_properties[0].value = new_value
    
    return same_properties[0]
def getSensor(ob, sensor_name):
    same_sensors = [p for p in ob.game.sensors if p.name == sensor_name]
    if same_sensors:
        return same_sensors[0]
    return

def getController(ob, controller_name):
    same_controllers = [p for p in ob.game.controllers if p.name == controller_name]
    if same_controllers:
        return same_controllers[0]
    return        
