# Main program
def main():
	
	# get current controller	
	controller = bge.logic.getCurrentController()
	
	# get object the controller is connected to
	obj = controller.owner
	
	# get the size of the game screen
	gameScreen = gameWindow()

	# get player cameras
	playerCams = playerCameras(obj)
	
	# make player 1 camera the active camera
	activeCamera(playerCams)
		
	# set viewport size
	viewportSize(gameScreen, playerCams, obj)
	
	# use viewports
	viewPorts(playerCams, obj)

#####################################################

# Game window
def gameWindow():
	
	# get width and height of game window
	width = bge.render.getWindowWidth()
	height = bge.render.getWindowHeight()
	
	# return game window size
	return (width, height)

#####################################################

# Player cameras
def playerCameras(obj):
		
	# get the current scene
	scene = bge.logic.getCurrentScene()
	
	# get list in objects in scene
	objList = scene.objects
		
	# get camera 1 name
	cam1_Name = obj["Viewport_1"]
	
	# get camera 2 name		
	cam2_Name = obj["Viewport_2"]
	
	# get player cameras
	player1 = objList[cam1_Name]	
	player2 = objList[cam2_Name]
	
	# return player cameras
	return (player1, player2)

#####################################################

# Active Camera
def activeCamera(playerCams):

	# get current scene
	scene = bge.logic.getCurrentScene()

	# get player 1 camera
	player1 = playerCams[0]
	
	# make player 1 the active camera
	scene.active_camera = player1


#####################################################

# Viewport size
def viewportSize(gameScreen, playerCams, obj):

	# game window width & height
	width = gameScreen[0]
	height = gameScreen[1]

	# player cameras
	player1 = playerCams[0]
	player2 = playerCams[1]
	
	
	# Check for propety named Vertical
	if "Vertical" in obj:
	
		# viewports side by side?
		if obj["Vertical"] == True:
		
			# Player 1 viewport: left side
			left_1 = 0; bottom_1 = 0; right_1 = width/2; top_1 = height
			   
			#  Player 2 viewport: right side
			left_2 = width/2; bottom_2 = 0; right_2 = width; top_2 = height 
		
		# vertical set to false
		else:
			# Player 1 viewport: top half
			left_1 = 0; bottom_1 = height/2; right_1 = width; top_1 = height
			   
			#  Player 2 viewport: bottom half
			left_2 = 0; bottom_2 = 0; right_2 = width; top_2 = height/2


	# set to default viewports size
	else:
	
		# Player 1 viewport: top half
		left_1 = 0; bottom_1 = height/2; right_1 = width; top_1 = height
		   
		#  Player 2 viewport: bottom half
		left_2 = 0; bottom_2 = 0; right_2 = width; top_2 = height/2
	
	# make sure they are integers
	left_1 = int(left_1)
	bottom_1 = int(bottom_1)
	right_1 = int(right_1)
	top_1 = int(top_1)
	
	left_2 = int(left_2)
	bottom_2 = int(bottom_2)
	right_2 = int(right_2)
	top_2 = int(top_2)
	
	# set player viewports
	player1.setViewport( left_1, bottom_1, right_1, top_1)
	player2.setViewport( left_2, bottom_2, right_2, top_2)

#############################################################

# enable viewports	
def viewPorts(playerCams, obj):

	# get player cameras
	player1 = playerCams[0]
	player2 = playerCams[1]
		
	# use viewports
	player1.useViewport = True
	player2.useViewport = True 

#############################################################

#import bge module
import bge

# Run Main Program
main()