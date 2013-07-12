#!/bin/bash

#You have to install ipcalc to make that solution work.

IP_AND_MASK=`ifconfig | grep "inet addr" | head -n1 | sed 's|.*addr:\([0-9\.]*\).*Mask:\([0-9\.]*\)|\1/\2|g'`
NETWORK=`ipcalc "$IP_AND_MASK" | grep "Network:" | sed 's|^Network:\s*\([0-9/\.]*\).*|\1|g'`
nmap -sP "$NETWORK"
