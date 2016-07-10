cube = GameLogic.getCurrentScene().getObjectList()["OBplayer1"]
cubePosi = cube.getPosition()
cubeRot = cube.getOrientation()

loadFile = open("Gamesav.sav", "r")
### Check for the header
header = loadFile.readline()
header = header[0:-1]

if header == "This is a valid save file":
	for x in range(len(cubePosi)):
		loadCoord = loadFile.readline()
		cubePosi[x] = float(loadCoord[0:-1])
	cube.setPosition(cubePosi)
	for x in range(len(cubeRot)):
		for y in range(len(cubeRot[x])):
			loadCoord = loadFile.readline()
			cubeRot[x][y] = float(loadCoord[0:-1])
	cube.setOrientation(cubeRot)

loadFile.close()