from mathutils import *
from math import *
from bpy.props import *
import os
import time

# Init
position_vector = []

# Open file
file = open("~/zdotfiles/where.csv", "r")

# Loop over line in file
for line in file:

    # Split line at ";"
    splittet_line = line.split(";")

    # Append new postion
    position_vector.append(
        Vector((float(splittet_line[0]),
                float(splittet_line[1]),
                float(splittet_line[2]))))

# Close file
file.close()

# Get first selected object
selected_object = bpy.context.selected_objects[0]

# Get first selected object
for position in position_vector:
    selected_object.location = position
