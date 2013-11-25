import bpy


clip_end = 999999


cam = bpy.data.cameras.new("Cam")
cam.clip_end = clip_end
cam_ob = bpy.data.objects.new("Cam", cam)
bpy.context.scene.objects.link(cam_ob)


empty = bpy.data.objects.new("Emtpy", None)
bpy.context.scene.objects.link(empty)
bpy.context.scene.update()


bpy.ops.curve.primitive_bezier_circle_add()
circle = bpy.context.object
circle.scale *= 10
co = circle.data.splines[0].bezier_points[-1].co * 10
cam_ob.location = co


cam_ob.select = True
bpy.ops.object.parent_set(type='FOLLOW')


con = cam_ob.constraints.new('TRACK_TO')
con.target = empty
con.track_axis = 'TRACK_NEGATIVE_Z'
con.up_axis = 'UP_Y'


for area in bpy.context.screen.areas:
    if area.type == 'VIEW_3D':
        area.spaces[0].clip_end = clip_end
