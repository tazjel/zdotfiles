#!/bin/bash

wget http://key-mon.googlecode.com/files/key-mon-1.16.zip

unzip key-mon-1.16.zip
cd key-mon-1.16
sudo python setup.py install

#equirements:
#Linux or equivalent.
#GTK+
#pyGtk 2.0 (python-gtk2)
#XLib (python-xlib)
#X.Org "record" module.
#librsvg2-common library 
#
#Installation:
#
#From zip. Download the zip file and unzip into a directory.
#
#unzip key-mon*.zip
#cd key-mon*
#sudo python setup.py install
#
#From deb package.
#
#sudo dpkg -i key-mon*.deb
#                        
#sudo aptitude update 
#
#If you download the source there is a file called xlib.py which can be run to see the keystrokes, or mouse click events.
#
#
#If you download the source there is a file called xlib.py which can be run to see the keystrokes, or mouse click events.
#If you download the source there is a file called xlib.py which can be run to see the keystrokes, or mouse click events.
#sudo aptitude update 
#
#    $ python src/keymon/xlib.py 
#
