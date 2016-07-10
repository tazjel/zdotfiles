################################################
#
#  Mouselook + Movement Script (v2.61)
#   by Riyuzakisan (9/15/2012)
#   Made in Blender 2.63.0 (r46461:46487M)
#
#  Contact:
#   Email:		riyuzakisan@gmail.com
#   Website:	riyuzakisan.weebly.com
#
#  Released under the Creative Commons
#  Attribution 3.0 Unported License
#
#  If you use this code, please include
#  this information header.
#
################################################

################################################
#
# For more information, please check the Manual
# document included with this script file.
#
################################################

from bge import logic, render, events
import math, mathutils

# Don't change these values - Use property tags
DEF_SENS = 0.0005
DEF_INVERT = 1

DEF_LSPEED = 0.05

DEF_DSPEED = 8
DEF_DJUMP = 10
DEF_DRANGE = 2

class Mouselook:
	def __init__(self, cont):
		self.cont = cont
		self.own = cont.owner
		
		self.init = False
		
		self.controls = Controls()
		self.keyboardTimer = 120
		self.air = False
		
		self.getProperties()
		
	def main(self):
		self.controls.main()
		
		self.getProperties()
		
		self.moveMouse()
		self.moveLoc()
		self.moveDynam()
	
	def getProperties(self):
		self.size = self.getWindowSize()
		self.move = self.getMovement()
		
		self.sensitivity = self.getSensitivity()
		self.invert = self.getInvert()
		self.capped = self.getCap()
		self.enable = self.getEnable()
		self.useParent = self.getUseparent()
		
		self.getCursor() # Doesn't need to return anything
		
		# Keyboard layout for R/L hand users
		self.layout = self.getLayout()
		self.controls.switch(self.layout)
		
		self.locUse = self.getLocUse()
		self.locSpeed = self.getLocSpeed()
		self.locScale = self.getLocScale()
		
		self.dynamUse = self.getDynamUse()
		self.dynamSpeed = self.getDynamSpeed()
		self.dynamJump = self.getDynamJump()
		self.dynamFly = self.getDynamFly()
		self.dynamRange = self.getDynamRange()
		self.dynamScale = self.getDynamScale()
	
	################################
	
	def moveMouse(self):
		horizontal = self.move[0] * self.sensitivity * self.invert
		vertical = self.move[1] * self.sensitivity * self.invert
		
		if self.capped:
			vertical = 0
		
		# Apply Mouse movement
		if self.enable:
			ori = self.own.localOrientation.to_euler()
			ori.x += vertical
			
			if (self.useParent == False) or (self.own.parent == None):
				ori.z += horizontal
			
			if self.useParent and self.own.parent:
				pOri = self.own.parent.localOrientation.to_euler()
				pOri.z += horizontal
				self.own.parent.localOrientation = pOri
			
			self.own.localOrientation = ori
			
			# Center mouse
			pos = logic.mouse.position
			pos = (round(pos[0], 1), round(pos[1], 1))
			
			self.setCenter()
	
	################################
	
	def moveLoc(self):
		if self.locUse and self.own.parent == None and self.locUse != self.dynamUse:
			loc = self.locSpeed * self.locScale
			
			if self.controls.run:
				loc *= 4
			
			move = [0, 0, 0]
			fmove = [0, 0, 0]
			
			if self.controls.forward:
				move[2] = -loc
			if self.controls.back:
				move[2] = loc
			if self.controls.left:
				move[0] = -loc
			if self.controls.right:
				move[0] = loc
			
			if self.controls.space or self.controls.up:
				fmove[2] = loc
			if self.controls.crouch or self.controls.down:
				fmove[2] = -loc
			
			self.own.applyMovement(move, True) # True = apply locally
			self.own.applyMovement(fmove, False)
	
	################################
	
	def moveDynam(self):
		if self.dynamUse and self.own.parent and self.dynamUse != self.locUse:
			parent = self.own.parent
			
			### Sensor Management ###
			colSen = None
			raySen = None
			keyboardSen = None
			
			for i in self.cont.sensors:
				senClass = str(i.__class__)
				
				if senClass == "<class 'KX_TouchSensor'>":
					colSen = i
				elif senClass == "<class 'KX_RaySensor'>":
					raySen = i
				elif senClass == "<class 'SCA_KeyboardSensor'>":
					keyboardSen = i
			
			# Keyboard activity timer
			if keyboardSen != None:
				if keyboardSen.positive:
					self.keyboardTimer = 120
					keyboardSen.useNegPulseMode = True
				elif self.keyboardTimer > 0:
					self.keyboardTimer -= 1
				
				if self.keyboardTimer <= 0:
					keyboardSen.useNegPulseMode = False
			
			# Sensor States
			col = False
			ray = False
			
			if raySen != None:
				raySen.range = self.dynamRange
				raySen.axis = 5
				
				if raySen.positive:
					ray = True
			
			if colSen != None:
				if colSen.positive:
					col = True
			
			### Speed Management ###
			speed = self.dynamSpeed * self.dynamScale
			jspeed = self.dynamJump * self.dynamScale
			limit = 0.2
			
			# Touching ground + Crouching + Not flying
			if self.controls.crouch and not self.air and not self.dynamFly:
				speed = speed/3
				limit = .85
			
			# Touching ground + Running + Not Flying + Not Crouching
			if self.controls.run and not self.air and not self.dynamFly and not self.controls.crouch:
				if self.controls.forward and not self.controls.back:
					speed *= 1.5
					limit = .18
			
			# Assign Velocity
			fmove = speed * (self.controls.forward - self.controls.back)
			smove = speed * (self.controls.right - self.controls.left)
			jmove = 0
			
			# Diagonal Movement
			if fmove and smove:
				fmove *= 0.70710678
				smove *= 0.70710678
			
			# Both Collision and Ray sensors added
			if colSen != None and raySen != None:
				# Not touching ground + Not in Fly mode
				if (self.air or not col) and not self.dynamFly:
					fmove *= 0.005
					smove *= 0.005
					
			if colSen == None or raySen == None:
				self.setDynamFly(True)
				self.dynamFly = self.getDynamFly()
			
			# Touching Ground + Jumping + Not crouching
			if self.controls.space and not self.air and ray and not self.controls.crouch:
				jmove = jspeed
				self.air = True
			
			# Jumping and Flying
			if self.controls.space and self.dynamFly:
				jmove = 1
			elif col and not self.controls.space:
				# Touching ground + Not jumping
				self.air = False
				
			### Apply Velocity ###
			velVec = mathutils.Vector((smove, fmove, jmove))
			parent.localLinearVelocity += velVec
			
			### Limit Velocity ###
			index = 0
			for i in parent.localLinearVelocity:
				if index != 2:
					if i > speed:
						i = speed
					if i < -speed:
						i = -speed
				parent.localLinearVelocity[index] = i
				index += 1
			
			if parent.worldLinearVelocity[2] > jspeed:
				parent.worldLinearVelocity[2] = jspeed
			
			# Touching Ground OR (Flying + Crouching) -- Slowing velocity
			if not self.air or (self.dynamFly and self.controls.crouch):
				# Not forward + Not backward
				if not self.controls.forward and not self.controls.back:
					parent.localLinearVelocity[1] -= parent.localLinearVelocity[1]*limit
				# Not left + Not right
				if not self.controls.left and not self.controls.right:
					parent.localLinearVelocity[0] -= parent.localLinearVelocity[0]*limit
					
			elif self.air and not self.dynamFly:
				# Not touching ground + Not flying
				parent.applyForce([0, 0, (-10*self.dynamScale)], False)
				index = 0
				for i in parent.localLinearVelocity:
					if index != 2:
						parent.localLinearVelocity[index] += i*0.02
						
					index += 1
			
			# Flying + Crouching
			if self.dynamFly and self.controls.crouch:
				# keep the player from falling
				parent.localLinearVelocity[2] = .175
	
	################################
	# The following code consists of
	# functions used to get/set properties
	
	def getWindowSize(self):
		width = render.getWindowWidth()
		height = render.getWindowHeight()
		
		return (width, height)
	
	# Get Center
	def getCenter(self):
		size = self.getWindowSize()
		scrCenter = (size[0]//2, size[1]//2)
		
		return (scrCenter[0]*(1.0/size[0]), scrCenter[1]*(1.0/size[1]))
	
	# Center Mouse
	def setCenter(self):
		render.setMousePosition(self.size[0]//2, self.size[1]//2)
	
	def getMovement(self):
		pos = logic.mouse.position
		realCenter = self.getCenter()
		move = [realCenter[0] - pos[0], realCenter[1] - pos[1]]
		
		xMove = int(self.size[0] * move[0])
		yMove = int(self.size[1] * move[1])
		
		if not self.init:
			self.init = True
			xMove = 0
			yMove = 0
			self.setCenter()
		
		return (xMove, yMove)
	
	################################
	# Get/Set KX_GameObject properties
	
	def getProp(self, propname):
		props = {}
		for i in self.own.getPropertyNames():
			props[i.upper()] = i
		
		if propname.upper() in props:
			return self.own[props[propname.upper()]]
	
	def setProp(self, propname, value):
		props = {}
		for i in self.own.getPropertyNames():
			props[i.upper()] = i
		
		if propname.upper() in props:
			self.own[props[propname.upper()]] = value
		else:
			self.own[propname.upper()] = value
	
	################################
		
	def getSensitivity(self):
		sens = self.getProp('adjust')
		if sens != None:
			if sens < 0:
				self.setProp('adjust', 0)
			
			return sens * DEF_SENS
		
		return DEF_SENS
	
	def setSensitivity(self, value):
		if value >= 0:
			self.setProp('adjust', value)
		
		self.sensitivity = self.getSensitivity()
			
	def getInvert(self):
		invert = self.getProp('invert')
		if invert != None:
			if invert == True:
				return -1
			else:
				return 1
		
		return DEF_INVERT
	
	def setInvert(self, value):
		if value in [1, -1]:
			self.setProp('invert', value)
		
		self.invert = self.getInvert()
	
	# Note: "cap" = cap value; "capped" = is capped/is not capped
	def getCap(self):
		cap = self.getProp('cap')
		
		if cap != None:
			if cap > 180:
				self.setProp('cap', 180)
			if cap < 0:
				self.setProp('cap', 0)
			
			cap = self.getProp('cap')
			
			camOri = self.own.localOrientation
			
			camZ = mathutils.Vector([camOri[0][2], camOri[1][2], camOri[2][2]])
			parentZ = mathutils.Vector([0.0, 0.0, 0.1])
			
			rads = mathutils.Vector.angle(parentZ, camZ)
			angle = rads * (180.00 / math.pi)
			
			moveY = self.move[1] * self.invert
			
			if (angle > (90 + cap/2) and moveY > 0) or (angle < (90 - cap/2) and moveY < 0) == True:
				return True
		
		return False
	
	def setCap(self, value):
		if (value == None) or (value >= 0 and value <= 180):
			self.setProp('cap', value)
		
		self.capped = self.getCap()
	
	def getEnable(self):
		enable = self.getProp('enable')
		if enable in [True, False]:
			return enable
		
		return True
	
	def setEnable(self, value):
		if value in [True, False]:
			self.setProp('enable', value)
		
		self.enable = self.getEnable()
	
	def getCursor(self):
		cursor = self.getProp('cursor')
		if cursor != None:
			if cursor in [True, False]:
				render.showMouse(cursor)
	
	# No parameters = reset cursor
	def setCursor(self, value=None):
		cursor = self.getProp('cursor')
		
		if value in [True, False, None]:
			self.setProp('cursor', value)
		
		self.getCursor()
	
	def getUseparent(self):
		useparent = self.getProp('useparent')
		
		if self.own.parent != None:
			if useparent == None:
				return True
			elif useparent in [True, False]:
				return useparent
		
		return False
		
	def setUseparent(self, value):
		if value in [True, False]:
			self.setProp('useparent', value)
		
		self.useParent = self.getUseparent()
	
	################################
	
	def getLayout(self):
		layout = self.getProp('layout')
		if layout in [1, 2]:
			return layout
		
		return 1
	
	def setLayout(self, value):
		if value in [1, 2]:
			self.setProp('layout', value)
		
		self.layout = self.getLayout()
	
	################################
	
	def getLocUse(self):
		use = self.getProp('lmove')
		if use in [True, False]:
			return use
		
		return False
	
	def setLocUse(self, value):
		if value in [True, False]:
			self.setProp('lmove', value)
		
		self.locUse = self.getLocUse()
	
	def getLocSpeed(self):
		speed = self.getProp('lspeed')
		if speed != None and speed >= 0:
			return speed
		
		return DEF_LSPEED
	
	def setLocSpeed(self, value):
		if value >= 0:
			self.setProp('lspeed', value)
		
		self.locSpeed = self.getLocSpeed()
	
	def getLocScale(self):
		scale = self.getProp('lscale')
		if scale != None:
			return scale
		
		return 1.0
	
	def setLocScale(self, value):
		self.setProp('lscale', value)
		self.locScale = self.getLocScale()
	
	################################
	
	def getDynamUse(self):
		use = self.getProp('dmove')
		if use in [True, False]:
			return use
		
		return False
	
	def setDynamUse(self, value):
		if value in [True, False]:
			self.setProp('dmove', value)
		
		self.dynamUse = self.getDynamUse()
	
	def getDynamSpeed(self):
		speed = self.getProp('dspeed')
		if speed != None and speed >= 0:
			return speed
		
		return DEF_DSPEED
	
	def setDynamSpeed(self, value):
		if value >= 0:
			self.setProp('dmove', value)
		
		self.dynamSpeed = self.getDynamSpeed()
	
	def getDynamJump(self):
		jump = self.getProp('djump')
		if jump != None and jump >= 0:
			return jump
		
		return DEF_DJUMP
		
	def setDynamJump(self, value):
		if value >= 0:
			self.setProp('djump', value)
		
		self.dynamJump = self.getDynamJump()
	
	def getDynamFly(self):
		fly = self.getProp('dfly')
		if fly in [True, False]:
			return fly
		
		return False
	
	def setDynamFly(self, value):
		if value in [True, False]:
			self.setProp('dfly', value)
		
		self.dynamFly = self.getDynamFly()
	
	def getDynamRange(self):
		range = self.getProp('drange')
		if range != None and range > 0:
			return range
		
		return DEF_DRANGE
	
	def setDynamRange(self, value):
		if value > 0:
			self.setProp('drange', value)
		
		self.dynamRange = self.getDynamRange()
	
	def getDynamScale(self):
		scale = self.getProp('dscale')
		if scale != None:
			return scale
		
		return 1.0
	
	def setDynamScale(self, value):
		self.setProp('dscale', value)
		self.dynamScale = self.getDynamScale()
	
class Controls:
	def __init__(self):
		self.submain = self.layout1
		self.main()
		
	def main(self):
		key = logic.keyboard.events
		self.space = key[events.SPACEKEY] == 2
		
		self.submain()
		
	def layout1(self):
		key = logic.keyboard.events
		
		self.forward = key[events.WKEY] == 2
		self.back = key[events.SKEY] == 2
		self.left = key[events.AKEY] == 2
		self.right = key[events.DKEY] == 2
		
		self.up = key[events.EKEY] == 2
		self.down = key[events.QKEY] == 2
		
		self.crouch = key[events.LEFTCTRLKEY] == 2
		self.run = key[events.LEFTSHIFTKEY] == 2
	
	def layout2(self):
		key = logic.keyboard.events
		
		self.forward = key[events.IKEY] == 2
		self.back = key[events.KKEY] == 2
		self.left = key[events.JKEY] == 2
		self.right = key[events.LKEY] == 2
		
		self.up = key[events.UKEY] == 2
		self.down = key[events.OKEY] == 2
		
		self.crouch = key[events.RIGHTCTRLKEY] == 2
		self.run = key[events.RIGHTSHIFTKEY] == 2
		
	def switch(self, value):
		if value == 2:
			self.submain = self.layout2
		else:
			self.submain = self.layout1
		
def main():
	cont = logic.getCurrentController()
	own = cont.owner
	
	if 'MOUSELOOK' not in own:
		own['MOUSELOOK'] = Mouselook(cont)
	else:
		own['MOUSELOOK'].main()

# Non-module execution mode (script)
if logic.getCurrentController().mode == 0:
	main()