#	OpenShot Video Editor is a program that creates, modifies, and edits video files.
#   Copyright (C) 2009  Jonathan Thomas
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



#   ----------------------------- EXAMPLE CODE ----------------------------
#   Use this snippet on any module that needs to support translations.  Once this 
#   snippet is in place, you can use the _("") method to set all your strings.
#
#	   import language.Language_Init as Language_Init
#
#	   # Add this to each method that needs to translate strings
#	   _ = Language_Init.Translator().lang.gettext
#
#	   # To mark a string as 'translatable', use this syntax:
#	   MyString = _("Here is my string")



# ----------------------- GENERATE THE POT FILE --------------------
# To generate the POT file, which contains all translatable text in
# OpenShot, run the Generate_POT.py script (in this same folder)
# Example:  $ python Generate_POT.py
#
# Ignore warnings, and the new POT file should be located at
# /openshot/openshot/locale/OpenShot/OpenShot.pot



# Command to Launch Program in any language
# LANG=es python OpenShot.py
#
# *** TROUBLESHOOTING TIPS:  If you get the following error: 
# (process:27990): Gtk-WARNING **: Locale not supported by C library. Using the fallback 'C' locale.
# 
# SOLUTION:  Step 1) Modify this file and add your language: /var/lib/locales/supported.d/local
#            Step 2) sudo dpkg-reconfigure locales
#            Step 3) Be sure the correct translation file localted at /usr/local/share/openshot/openshot/language/
#               NOTE:  fr <> fr_FR.  You must match the language code exactly.
# -------------------------------------------------------------------------


# import modules needed for language translation & gtk support
import os, sys
import gettext, locale
import gtk


########################################################################
class Translator:
	"""Class that contains functions to initiate language translations"""  
	
	#----------------------------------------------------------------------
	def __init__(self, project):
		"""Constructor"""  
		self.project = project
		
		# Setup foreign language support
		langs = []
		lc, encoding = locale.getlocale(locale.LC_MESSAGES)

		if (lc):
			langs = [lc]			
		language = os.environ.get('LANGUAGE', None)
		if (language):
			langs += language.split(":")

		# Set locale specific settings
		locale.setlocale(locale.LC_ALL)
		locale.bindtextdomain("OpenShot", self.project.LOCALE_DIR)
		locale.bind_textdomain_codeset("OpenShot", "UTF-8")

		# Set gettext settings
		gettext.bindtextdomain("OpenShot", self.project.LOCALE_DIR)
		gettext.bind_textdomain_codeset("OpenShot", "UTF-8")
		gettext.textdomain("OpenShot")
		gettext.install(domain="OpenShot")

		# This reference is used by other classes to define the _ method 
		self.lang = gettext.translation("OpenShot", self.project.LOCALE_DIR, languages = langs, fallback = True)
