cube = GameLogic.getCurrentScene().getObjectList()["OBplayer2"]
cubePosi = cube.getPosition()
cubeRot = cube.getOrientation()

saveFile = open("Gamesav2.sav", "w")
saveFile.write("This is a valid save file\n")

for x in range(len(cubePosi)):
	saveFile.write(str(cubePosi[x]) + "\n")
for x in range(len(cubeRot)):
	for y in range(len(cubeRot[x])):
		saveFile.write(str(cubeRot[x][y]) + "\n")

saveFile.close()
