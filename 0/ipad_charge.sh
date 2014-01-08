
mkdir ~/src

cd ~/src

sudo apt-get install libusb-1.0-0 libusb-1.0-0-dev

git clone https://github.com/mkorenkov/ipad_charge.git

cd ipad_charge/

make

sudo make install

#Original discussion available here: #http://ubuntuforums.org/showthread.php?t=1504845

##Packaging

#sudo apt-get install -y checkinstall build-essential libusb-1.0-0 libusb-1.0-0-dev #vim git-core git-doc
#git clone https://github.com/mkorenkov/ipad_charge.git
#cd ./ipad_charge
#make
#sudo checkinstall

##Author. (# Date of publication). # Title of article. # Title of Online Periodical, # volume number(# issue number if available). Retrieved from
 ##  #https://github.com/mkorenkov/ipad_charge/wiki
