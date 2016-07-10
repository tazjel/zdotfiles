def main():

	# get the current controller
	controller = bge.logic.getCurrentController()
	
	# get vehicle constraint ID
	vehicleID = ConstraintID(controller)

	# set tire grip
	Tire_Grip(vehicleID)
	
	# set suspension compression
	Suspension_Compression(vehicleID)
	
	# set suspension damping
	Suspension_Damping(vehicleID)
	
	# set suspension stiffness
	Suspension_Stiffness(vehicleID)
	
	# set roll influence
	Roll_Influence(vehicleID)

#########################################################

# get vehicle constraint ID
def ConstraintID(controller):

	# get car the controller is attached to
	carObj = controller.owner
		
	# get saved vehicle Constraint ID
	vehicleID = carObj["vehicleID"]
	
	return vehicleID


##########################################################

# set tire grip
def Tire_Grip(vehicleID):

	grip_0 = 30.0     # front driver's tire 
	grip_1 = 30.0     # front passenger's tire 
	grip_2 = 30.0     # rear driver's tire
	grip_3 = 30.0     # rear passenger's tire

	vehicleID.setTyreFriction(grip_0, 0)  # front driver's tire 
	vehicleID.setTyreFriction(grip_1, 1)  # front passenger's tire 
	vehicleID.setTyreFriction(grip_2, 2)  # rear driver's tire
	vehicleID.setTyreFriction(grip_3, 3)  # rear passenger's tire 

##########################################################

# set suspendion compression
def Suspension_Compression(vehicleID):

	compression_0 = 6.0     # front driver's tire 
	compression_1 = 6.0     # front passenger's tire 
	compression_2 = 6.0     # rear driver's tire
	compression_3 = 6.0     # rear passenger's tire

	vehicleID.setSuspensionCompression(compression_0, 0)  # front driver's tire 
	vehicleID.setSuspensionCompression(compression_1, 1)  # front passenger's tire 
	vehicleID.setSuspensionCompression(compression_2, 2)  # rear driver's tire
	vehicleID.setSuspensionCompression(compression_3, 3)  # rear passenger's tire 


##########################################################
	
# set suspension damping
def Suspension_Damping(vehicleID):
	
	damp_0 = 5.0     # front driver's tire 
	damp_1 = 5.0     # front passenger's tire 
	damp_2 = 5.0     # rear driver's tire
	damp_3 = 5.0     # rear passenger's tire
	
	vehicleID.setSuspensionDamping(damp_0, 0)  # front driver's tire 
	vehicleID.setSuspensionDamping(damp_1, 1)  # front passenger's tire 
	vehicleID.setSuspensionDamping(damp_2, 2)  # rear driver's tire
	vehicleID.setSuspensionDamping(damp_3, 3)  # rear passenger's tire 


###########################################################

# set suspension stiffness
def Suspension_Stiffness(vehicleID):
	
	stiffness_0 = 12.5     # front driver's tire 
	stiffness_1 = 12.5     # front passenger's tire 
	stiffness_2 = 12.5     # rear driver's tire
	stiffness_3 = 12.5     # rear passenger's tire
	
	vehicleID.setSuspensionStiffness(stiffness_0, 0)  # front driver's tire 
	vehicleID.setSuspensionStiffness(stiffness_1, 1)  # front passenger's tire 
	vehicleID.setSuspensionStiffness(stiffness_2, 2)  # rear driver's tire
	vehicleID.setSuspensionStiffness(stiffness_3, 3)  # rear passenger's tire 

############################################################

# set roll influence
def Roll_Influence(vehicleID):

	roll_0 = 0.06     # front driver's tire 
	roll_1 = 0.06     # front passenger's tire 
	roll_2 = 0.06     # rear driver's tire
	roll_3 = 0.06     # rear passenger's tire

	vehicleID.setRollInfluence( roll_0, 0)  # front driver's tire 
	vehicleID.setRollInfluence( roll_1, 1)  # front passenger's tire 
	vehicleID.setRollInfluence( roll_2, 2)  # rear driver's tire
	vehicleID.setRollInfluence( roll_3, 3)  # rear passenger's tire 
	

###########################################################

#import bge
import bge

# run main program
main()