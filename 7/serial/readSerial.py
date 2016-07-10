# Import pySerial module
from serial import *
 
# Open serial port and setup
ser = Serial("COM10", baudrate=9600, bytesize=8, parity='N', stopbits=1, timeout=1)
 
# Power up MaxSonar via DTR pin
ser.setDTR(True)
 
# Infinite loop
while (True):
 
    # Read serial data
    data = ser.read(5)
 
    # Check data length 
    if len(data) == 5:
 
        # Check data packet
        if data[0] == "R" and data[1:4].isdigit():
 
            # Convert to cm and print 
            print int(data[1:4]) * 2.54, "cm"
 
    # Request next measurement        
    ser.write(0)
 
# Close 
ser.close()
