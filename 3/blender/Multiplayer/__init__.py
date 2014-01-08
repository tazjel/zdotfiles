# ##### BEGIN GPL LICENSE BLOCK #####
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# ##### END GPL LICENSE BLOCK #####
bl_info = {
	"name": "Multiplayer",
	"description": "Interfaces with HostileStudios networking for easy use.",
	"author": "Angus Hollands",
	"version": (1, 6, 4),
	"blender": (2, 67, 0),
	"api": 56945,
	"location": "LOGIC_EDITOR > UI > MULTIPLAYER",
	"warning": "",
	"wiki_url": "http://blenderartists.org/forum/showthread.php?242740&goto=newpost",
	"tracker_url": "",
	"category": "Game Engine"}

import bpy
import random
import string
import os
import sys
import codecs 
import collections

from json import *
from bpy.props import *
from bpy.utils import register_module, unregister_module
from .logic_bricks import *
from .logic_functions import *
	
def typeToProperty(item):
	value_type = type(item)
	
	methods = {
		bool : BoolProperty(default=item, update=update_plugin),
		int : IntProperty(default=item, update=update_plugin),
		str : StringProperty(default=item, update=update_plugin),
		float : FloatProperty(default=item, update=update_plugin),
	}
	return methods.get(value_type)
			
def update_plugin(self, context):
	plugin = context.object.added_plugins[context.object.added_plugins_idx].name
	createPluginLog(context, plugin)

def create_text(name, content):
	matches = (t for t in bpy.data.texts if t.name == name)
	try:
		text = next(matches)
		
	except StopIteration:
		original_texts = list(bpy.data.texts)
		bpy.ops.text.new()
		text = set(original_texts).symmetric_difference(list(bpy.data.texts)).pop()
	
	else:
		text.clear()
	
	finally:
		text.write(content)
		text.name = name	
		print("writing to {}".format(name), text)

def get_plugins(path):
	'''Extracts information about plugins, hacky
	@param path: path of module directory'''
	
	filename = os.path.join(path, "plugins.py")
	myfile = open(filename)
	lines = [[i, line] for i, line in enumerate(myfile.readlines())]
	myfile.close()		
	is_finding = False
	
	args = {}
	docstrings = {}
	found_classes = ["bge.types.KX_PythonComponent"]
	
	for i, line in lines:
	
		# Only use classes
		if not "class" in line:
			continue
			
		start = line.find( "class" )
		module_start = line.find( "(" )
		module_end = line.find( ")" )
		
		if module_start == -1:
			continue
			
		# Find base classes
		inherited = line[module_start + 1: module_end]
		
		# If it is not a derivative of KX_PythonComponent
		if not inherited in found_classes:
			continue
			
		# Get name of class
		class_name = line[start + len("class"): module_start].strip()
		
		# Store class as a potential base class
		found_classes.append(class_name)
		
		docstring_index = line.index(class_name)
		doc_start = docstring_index + line[docstring_index:].index(':')
		
		found_start = 0
		look_str = None
		positions = {}
		
		for ni, nl in lines:
			if ni < i:
				continue
			
			if not look_str:
				type_strings = ['"""', "'''"]
				type_indices = {}
				
				type_indices = {t:nl.find(t) for t in type_strings}
				if not any([v != -1 for v in type_indices.values()]):							
					continue
					
				look_str = max(type_indices, key=lambda t:type_indices[t])
				
			if not look_str in nl:
				continue
			
			pos_doc = nl.find(look_str)
			
			if not pos_doc == -1:
				positions[found_start] = [ni, nl[pos_doc+3:]]
				found_start += 1
				
			else:
				pos_doc = 0
				
			pd = nl[pos_doc:].find(look_str)
			
			if not pd == -1:
				positions[found_start] =  [ni, nl[:pos_doc + pd]]
				found_start+=1
			
			if found_start == 2:
				start_d = positions[0][1]
				start_i = positions[0][0]
				end_d = positions[1][1]
				end_i = positions[1][0]
				
				between = ''.join([lines[i] for i in range(start_i+1,end_i)])
				
				docstring = (start_d + between + end_d).strip()
				if docstring.endswith(look_str):
					docstring = docstring[:-3]
					
				docstrings[class_name] = docstring
		
		# Build argument list
		for x, line in lines:
			line = line.strip() 
			if x <= i:
				continue
				
			if is_finding:
				is_variable = line.find( "}" )
				if is_variable != -1:
					is_finding = False
					args[class_name].append( line[:is_variable+1] )
					break
				
				args[class_name].append( line )
				
			args_index = line.find( "args" )
			if args_index == -1:
				continue
				
			is_variable = line.find( "{" )
			if is_variable == -1:
				continue
				
			is_finding = True
			args[class_name] = [line[is_variable:]]
			
	return args, docstrings


def update_play(self, context):
	enabled = context.scene.client_enable
	if enabled:
		createLogic(context, "client")
		
	if not enabled:
		removeLogic(context, "client")
	
def update_host(self, context):
	enabled = context.scene.host_enable
	if enabled:
		createLogic(context, "host")
		
	if not enabled:
		removeLogic(context, "host")

def parse_file(path, filename):
	file = codecs.open(os.path.join(path, filename), 'rb', 'utf-8-sig')
	data = ''.join([x.replace("\r","") for x in file.readlines()])
	file.close()
	return data
	
class PluginList( bpy.types.PropertyGroup ):
	bool = BoolProperty( default=False )
	integer = IntProperty()
	string  = StringProperty()

bpy.utils.register_class( PluginList )

class InitMultiplayer(bpy.types.Operator):
	"""Initialises the panel"""
	bl_idname = "scene.init_multiplayer"
	bl_label = "Initialise multiplayer"

	@classmethod
	def poll(cls, context):
		return context.active_object is not None

	def execute(self, context):
		# Convert args and plugin class names into properties that can be displayed.
		# Get each property, save it in a new dictionary as plugin - > property
		# then set the value of property to a random string. Setattr the string
		# to the object with the value of the argument as its value
		
		# Create text blocks
		path = os.path.join(sys.path[0], 'Multiplayer')
		texts = {
			"plugins.py" : parse_file(path, "plugins.py"),
			"multipy.py" : parse_file(path, "multipy.py"),
			"rencode.py" : parse_file(path, "rencode.py"),
			"classes.py" : parse_file(path, "classes.py"),
			"terminal.py" : parse_file(path, "terminal.py"),
			"wrapper.py" : parse_file(path, "wrapper.py")
		}
		
		for name, text in texts.items():
			create_text(name, text)	
			
		context.scene.multiplayer_initialised = True		
			
		return {'FINISHED'}
		
class MultiplayerPanel( bpy.types.Panel ):
	bl_space_type = "LOGIC_EDITOR"
	bl_region_type = "UI"
	bl_label = "Multiplayer"
	COMPAT_ENGINES = { 'BLENDER_GAME' }
		
	# We have to use JSON, as any data object other than the ones specified in bpy.props won't be saved
	# With the blend file. Therefore, a StringProperty can hold a json encoded object - this object is converted
	# From and back to a json string when accessed
	# Initiate empty JSON encoded items 
	jsondic = dumps( {} )
	jsonempty = dumps( None )
	
	# General Settings    
	bpy.types.Scene.client_enable = BoolProperty( name="Play Game", 
					description = "Create logic for client connection and plugins", 
					default=False, update=update_play)
					
	bpy.types.Scene.host_enable = BoolProperty( name="Host Game", 
					description = "Create logic for host connection", 
					default=False, update=update_host )
	
	# Multi user logic             
	bpy.types.Scene.multi_logic = StringProperty(default=jsondic)
	
	# Single user properties - can be removed w/o question
	bpy.types.Scene.single_properties = StringProperty(default=jsondic)
	
	# Multi user properties - have to be checked if they can be removed
	bpy.types.Scene.multi_properties = StringProperty(default=jsondic)
	
	
	# Client panel options
	bpy.types.Scene.server_port = IntProperty( name = "Server Port", 
					default = 1200, min = 1200, max = 65535, 
					description = "The port to listen for connections", 
					update=update_play )
					
	
	bpy.types.Scene.server_address = StringProperty(  name="Server Address", 
						default="localhost", 
						description = "The IP Address of the server",
						update=update_play )
	
	bpy.types.Scene.client_frequency = IntProperty( name = "Frequency", 
					default = 30, min = 1, max = 60, 
					description = "Frequency of operation" ,
					update=update_play )
					
	bpy.types.Scene.client_name = StringProperty(  name="Client Name", 
						default="", 
						description = "The Name of this client",
						update=update_play )                 
	# Host panel options    									
	bpy.types.Scene.host_port = IntProperty( name = "Host Port", 
					default = 1200, min = 1200, max = 65535, 
					description = "The port to listen for connections",
					update=update_host )
					
	bpy.types.Scene.player_limit = IntProperty( name = "Player Limit", 
					default = 4, min = 1, max = 1000, 
					description = "Maximum number of clients to permit",
					update=update_host )
					
	bpy.types.Scene.time_out = IntProperty( name = "Timeout", 
					default = 10, min = 1, max = 60, 
					description = "Time to wait in seconds before force disconnect",
					update=update_host )      
	
	# Parse plugins.py and retrieve possible plugins and their attributes
	path = os.path.join(sys.path[0], 'Multiplayer')
	
	args, docstrings = get_plugins(path)
	
	plugin_properties = {}
	for a, v in args.items():    
		plugin_properties[a] = eval( "".join( v ) )
		
	bpy.types.Scene.plugin_properties = StringProperty(default=dumps(plugin_properties ))
	
	plugin_list = []
	
	for p in plugin_properties.keys():
		plugin_list.append((p, p, docstrings.get(p, '')))
					
	bpy.types.Scene.plugin = EnumProperty( items = plugin_list,
				name = "plugin", default = "position" )
	
	bpy.types.Scene.add_plugin = BoolProperty( name="New Plugin", 
					description = "Add new plugin", 
					default=False )
	
	# Template list settings
	bpy.types.Object.added_plugins = CollectionProperty(type=PluginList)
	bpy.types.Object.added_plugins_idx = IntProperty()
	bpy.types.Object.added_plugins_active = IntProperty()
	
	# Multi user logic             
	bpy.types.Object.multi_logic = StringProperty(default=jsondic)
	
	# Single user properties - can be removed w/o question
	bpy.types.Object.single_properties = StringProperty(default=jsondic)
	
	# Multi user properties - have to be checked if they can be removed
	bpy.types.Object.multi_properties = StringProperty(default=jsondic)
	
	bpy.types.Object.remove = StringProperty(default=jsonempty) 
		
	converted_properties = collections.defaultdict(dict)
	
	for plugin, data in plugin_properties.items():
		plugin_data = converted_properties[plugin]
		for arg, value in data.items():
			key = (plugin + arg).strip()
			plugin_data[arg] = key
			setattr(bpy.types.Object, key, typeToProperty(value))
			
	bpy.types.Object.converted_properties = StringProperty(default=dumps(converted_properties))    
	bpy.types.Scene.multiplayer_initialised = BoolProperty(default=False)	
	
	def draw(self, context):
		layout = self.layout
		
		rd = context.scene.render
		
		core = self.layout        
		ob = bpy.context.object
		
		if not context.scene.multiplayer_initialised:
			layout.operator(InitMultiplayer.bl_idname, text=InitMultiplayer.bl_label)
			return
		
		# Settings panel
		setting_bool = core.column()
		setting_bool.label( text="Settings", icon="SCRIPT" )
		
		settings = core.split()
		left_side = settings.column()
		row = left_side.row()
		row.prop( context.scene, "host_enable", text="Host Game", icon="CONSOLE" )
		
		if context.scene.host_enable:
		
			host = left_side.column()
			host.active = context.scene.host_enable
			
			sub_row = host.row()
			sub_row.label("Server Port")        
			sub_row.prop(context.scene, "host_port", text="")
			
			sub_row = host.row()
			sub_row.label("Player Limit")
			sub_row.prop(context.scene, "player_limit", text="")
			
			sub_row = host.row()
			sub_row.label("Timeout (s)")
			sub_row.prop(context.scene, "time_out", text="")
			
		right_side = settings.column()
		row = right_side.row()
		row.prop(context.scene, "client_enable", text="Play Game", icon='GAME')
		
		if context.scene.client_enable:
			
			client = right_side.column()
			client.active = context.scene.client_enable
			
			sub_row = client.row()
			sub_row.label("Server address")        
			sub_row.prop(context.scene, "server_address", text="")
			
			sub_row = client.row()
			sub_row.label("Server port")
			sub_row.prop(context.scene, "server_port", text="")
			
			sub_row = client.row()
			sub_row.label("Frequency")
			sub_row.prop(context.scene, "client_frequency", text="")
			
			sub_row = client.row()
			sub_row.label("Name")
			sub_row.prop(context.scene, "client_name", text="")
		
		if ob:
			# Plugins panel
			plugins = core.column()
			plugins.label(text="Plugins", icon="PLUGIN")
			
			#Show's existing plugins
			col = plugins.column()
			
			dropdown = col.row()
			dropdown.label("Plugin Type")    
			
			dropdown.prop(context.scene, "plugin", text="")
			dropdown.operator("plugin.new", text="", icon="ZOOMIN")
			
			box = col.row()
			box.template_list('UI_UL_list', "added_plugins_id", context.object, "added_plugins", context.object, "added_plugins_idx", rows=3)
			
			controls = box.column(align=True)
			controls.operator("plugin.remove", text="", icon="X")
		
			# If there are elements in the list, then show it's properties.

			if context.object.added_plugins:
				current = context.object.added_plugins[context.object.added_plugins_idx].name
				args = loads(context.scene.plugin_properties)[current]
				for key, value in args.items():
					id = loads( context.object.converted_properties )[current][key]
					# Create a row for each property
					# And assign the key to the label, and the value to the object id string
					
					p = col.row()
					p.label( key )
					p.prop( context.object, str( id ), text="" )
		
			
			
class addPlugin(bpy.types.Operator):
	bl_label = "Add Plugin Operator"
	bl_idname = "plugin.new"
	bl_description = "Add a plugin"

	def invoke(self, context, event):
		my_sett = context.object.added_plugins
		if context.scene.plugin in my_sett:
			return{"FINISHED"}
		my_item = my_sett.add()
		my_item.name = context.scene.plugin
		createPluginLog(context, context.scene.plugin)
		return{"FINISHED"}
	
class removePlugin(bpy.types.Operator):
	bl_label = "Remove Plugin Operator"
	bl_idname = "plugin.remove"
	bl_description = "Remove a plugin"

	def invoke(self, context, event):
		if not context.object.added_plugins:
			return{"FINISHED"}
			
		current = context.object.added_plugins[context.object.added_plugins_idx].name
		removePluginLog(context, current)
		my_sett = context.object.added_plugins
		index = context.object.added_plugins_idx
		my_sett.remove(index)
		return{"FINISHED"}  
			
def register():
    bpy.utils.register_module(__name__)

def unregister():
    bpy.utils.unregister_module(__name__)
if __name__ == "__main__":
	register()