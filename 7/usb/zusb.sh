

# Find usb devices

usb_devices_product() {
    cat /sys/bus/usb/devices/usb*/product
}


lsusb_camera() {
    lsusb -v | grep Camera
}

usb_devices_show() {
    usb-devices
}
