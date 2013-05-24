#Enter script code
import sys, os, socket, glob, shutil, time
try:
    from autokey import evdev, daemon, configmanager
    from autokey.common import DOMAIN_SOCKET_PATH, PACKET_SIZE
except ImportError:
    # Per DPM Â§ 9.3.2 script should fail gracefully if not installed.
    print "It does not seem Autokey is installed. Exiting..."