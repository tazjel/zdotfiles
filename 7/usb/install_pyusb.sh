# Install python-usb through pip !
## >>> import usb.core
# Problem : "ImportError: No module named core"

# Solution : uninstalling python-usb and reinstalling it with :
sudo apt-get remove python-usb
sudo pip install --pre pyusb
