import os
import bpy

filename = bpy.path.basename(bpy.data.filepath)
filename = os.path.splitext(filename)[0]

if filename:
    bpy.context.scene.render.filepath = os.path.join("~/Pictures", filename, filename + "_")
