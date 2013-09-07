import bpy
from mathutils import *
from math import *
from bpy.props import *
import os
import time

# Init
position_vector = []

# Open file

file = open("/home/ahmed/zdotfiles/where.csv", "r")
# Loop over line in file
for line in file:
    splittet_line = line.split(",")
    position_vector.append(
        Vector((float(splittet_line[0]),
                float(splittet_line[1]),
                float(splittet_line[2]))))

#bpy.ops.mesh.primitive_cube_add(view_align=True, location=(
# Get first selected object


for postion in position_vector: bpy.ops.mesh.primitive_cube_add(location=position)
