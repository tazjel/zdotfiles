import bge

class KX_PythonComponent:
	'''Spoofs the KX_PythonComponent as a blank class
	'''
	pass    

def init(self, args, object):
	'''Provides a custom init function (as there is none)
	and sets the instance.object to the script owner
	'''
	self.object = object
	self.start(args)

def run(cont):
	'''Wrapper for Moguri's components
	Will take all components in property, import them
	and execute their instances whilst providing custom args'''
	
	own = cont.owner
	name = cont.name
	components = own['components'].split(', ')
	
	if not "imported_components" in own:
		
		setattr(bge.types, 'KX_PythonComponent', KX_PythonComponent)
		
		own['imported_components'] = []
		
		for component in components:
			source, module = component.split('.')						
				
			imported = __import__(source)
			comp = getattr(imported, module)
				
			
			comp.__init__ = init
			
			args = own.get(component, comp.args)
			
			args = eval(args)
			
			instance = comp(args, own)
			
			own['imported_components'].append(instance)
			
			
	for component in own["imported_components"]:			
		component.update()
