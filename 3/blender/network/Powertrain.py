# Main Program
def main():
		
	# get the current controller
	controller = bge.logic.getCurrentController()
	
	# get vehicle constraint ID
	vehicleID = ConstraintID(controller)
	
	# brakes
	brakes = Brakes(vehicleID, controller)
		
	# gas & reverse
	Power( vehicleID, controller, brakes)
		
	# steering
	Steering(vehicleID, controller)
	

########################################################  Vehicle ID

# get vehicle constraint ID
def ConstraintID(controller):

	# get car the controller is attached to
	car = controller.owner
		
	# get saved vehicle Constraint ID
	vehicleID = car["vehicleID"]
	
	return vehicleID

########################################################  Brakes

def Brakes(vehicleID, controller):

	# set braking amount
	brakeAmount = 40.0  	# front and back brakes
	ebrakeAmount = 100.0	# back brakes only  

	# get sensors
	reverse = controller.sensors["Reverse"]		# sensor named "Reverse"
	brake = controller.sensors["Brake"]			# sensor named "Brake
	emergency = controller.sensors["EBrake"]	# sensor named "EBrake"
	
	# emergency brakes		
	if emergency.positive == True:
		
		front_Brake = 0.0
		back_Brake = ebrakeAmount
		brakes = True
	
	# brake
	elif brake.positive == True and reverse.positive == False:
		
		front_Brake = brakeAmount
		back_Brake = brakeAmount
		brakes = True

	# no brakes
	else:
		
		front_Brake = 0.0
		back_Brake = 0.0
		brakes = False

	# brakes	
	vehicleID.applyBraking( front_Brake, 0)
	vehicleID.applyBraking( front_Brake, 1)
	vehicleID.applyBraking( back_Brake, 2)
	vehicleID.applyBraking( back_Brake, 3)

	return brakes

##########################################  Gas & Reverse 
	
# gas and reverse	
def Power( vehicleID, controller, brakes):	
	
	# set power amounts
	reversePower = 200.0
	gasPower = 800.0

	# get power sensors
	gas = controller.sensors["Gas"]				# sensor named "Gas"
	reverse = controller.sensors["Reverse"]		# sensor named "Reverse"
	
	# brakes
	if brakes == True:
		
		power = 0.0
					
	# reverse
	elif reverse.positive == True:
		
		power = reversePower
	
	# gas pedal 
	elif gas.positive == True:
		
		power = -gasPower
	
	# no gas and no reverse
	else:
		
		power = 0.0

	# apply power
	vehicleID.applyEngineForce( power, 0)
	vehicleID.applyEngineForce( power, 1)
	vehicleID.applyEngineForce( power, 2)
	vehicleID.applyEngineForce( power, 3)										
		

##################################################  Steering 

def Steering( vehicleID, controller):

	# set turn amount
	turn = 0.3
	

	# get steering sensors
	steerLeft = controller.sensors["Left"]		# sensor named "Left"
	steerRight = controller.sensors["Right"]	# sensor named "Right"
		
	# turn left	
	if steerLeft.positive == True:
		
		turn = turn
	
	# turn right	
	elif steerRight.positive == True:
		
		turn = -turn
	
	# go straight	
	else:
		turn = 0.0
		
	# steer with front tires only
	vehicleID.setSteeringValue(turn,0)
	vehicleID.setSteeringValue(turn,1)


###############################################

#import bge
import bge

# run main program
main()
	