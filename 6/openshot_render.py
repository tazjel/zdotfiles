#!/usr/bin/env python

#	OpenShot Video Editor is a program that creates, modifies, and edits video files.
#   Copyright (C) 2009  TJ, Jonathan Thomas
#
#	This file is part of OpenShot Video Editor (http://launchpad.net/openshot/).
#
#	OpenShot Video Editor is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	OpenShot Video Editor is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with OpenShot Video Editor.  If not, see <http://www.gnu.org/licenses/>.

import sys, os

# ensure the openshot module directory is in the system path so relative 'import' statements work
base_path = os.path.dirname(os.path.abspath(__file__))
if sys.path.count(base_path) == 0:
	sys.path.insert(0, base_path)



def main():
# If the openshot python code is found in the Python path, then
# we should be able to import openshot cli renderer and call the main() method

	from classes import cli_render

	bot = cli_render.Bot()
	bot.render()
	sys.exit()



if __name__ == "__main__":
    main()
