#!/usr/bin/env python


#Best Practice
#http://www.blender.org/documentation/blender_python_api_2_69_release/info_best_practice.html

#It’s faster to build a new list with list comprehension.

faces = [f for f in mesh.tessfaces if len(f.vertices) != 3]

my_list = []
#Adding List Items

my_list.extend([a, b, c...])


#join is fastest on many strings,
file.write(" ".join([str1, str2, str3, "\n"]))
