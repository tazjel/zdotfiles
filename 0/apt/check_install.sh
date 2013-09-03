#!/bin/sh
# Date:  Tue Sep  3 10:21:50 AST 2013
# Author: Ahmed 

#check MACHINE_TYPE
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == "x86_64" ] ; then
    echo "64-bit stuff here"
else
    echo "32-bit stuff here"
fi
