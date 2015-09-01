# Integrated webcam isnt working at all
# Dell Inspiron




# Install the Webcam driver packages :

sudo apt-get install build-essential linux-headers-`uname -r`

# If already installed them, reconfigure them:

sudo dpkg-reconfigure -phigh build-essential linux-headers-`uname -r`

# Reference http://askubuntu.com/questions/477978/integrated-webcam-isnt-working-at-all-ubuntu-14-04-x64?rq=1
