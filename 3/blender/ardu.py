# serial communication Blender Game Engine to arduino?
# http://stackoverflow.com/questions/6587507/how-to-install-pip-with-python-3
# sudo pip3 install pyserial
import sys
sys.path.append("/usr/local/lib/python3.4/dist-packages/")
import serial
arduino = serial.Serial('/dev/ttyACM0', 9600)
