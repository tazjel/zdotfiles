#!/bin/sh
# Date:  Tue Sep  3 10:21:50 AST 2013
# Author: Ahmed
archs=`uname -m`
case "$archs" in
    i?86) archs=i386 ;;
    x86_64) archs="x86_64 i386" ;;
    ppc64) archs="ppc64 ppc" ;;
esac

for arch in $archs; do
    test -x ./ioquake3.$arch || continue
    exec ./ioquake3.$arch "$@"
done


# First Obtain "kernel" name
KERNEL=$(uname -s)

if      [[ $KERNEL == "Darwin" ]]; then
        KERNEL=mac
elif        [[ $Nucleo == "Linux" ]]; then
        KERNEL=linux
elif        [[ $Nucleo == "FreeBSD" ]]; then
        KERNEL=linux
else
        echo "Unsupported OS"
fi

# Second get the right Arquitecture
ARCH=$(uname -m)

if         [ $ARCH = "i386" ]; then
            PATH="$PWD/wine/$KERNEL/x86/bin:$PATH"
            export WINESERVER="$PWD/wine/$KERNEL/x86/bin/wineserver"
            export WINELOADER="$PWD/wine/$KERNEL/x86/bin/wine"
            export WINEPREFIX="$PWD/wine/data"
            export WINEDEBUG=-all:$WINEDEBUG
            ARCH="32 Bits"
    elif    [ $ARCH = "i486" ]; then
            PATH="$PWD/wine/$KERNEL/x86/bin:$PATH"
            export WINESERVER="$PWD/wine/$KERNEL/x86/bin/wineserver"
            export WINELOADER="$PWD/wine/$KERNEL/x86/bin/wine"
            export WINEPREFIX="$PWD/wine/data"
            export WINEDEBUG=-all:$WINEDEBUG
            ARCH="32 Bits"
    elif    [ $ARCH = "i586" ]; then
            PATH="$PWD/wine/$KERNEL/x86/bin:$PATH"
            export WINESERVER="$PWD/wine/$KERNEL/x86/bin/wineserver"
            export WINELOADER="$PWD/wine/$Nucleo/x86/bin/wine"
            export WINEPREFIX="$PWD/wine/data"
            export WINEDEBUG=-all:$WINEDEBUG
            ARCH="32 Bits"
    elif    [ $ARCH = "i686" ]; then
            PATH="$PWD/wine/$KERNEL/x86/bin:$PATH"
            export WINESERVER="$PWD/wine/$KERNEL/x86/bin/wineserver"
            export WINELOADER="$PWD/wine/$KERNEL/x86/bin/wine"
            export WINEPREFIX="$PWD/wine/data"
            export WINEDEBUG=-all:$WINEDEBUG
            ARCH="32 Bits"
         elif [ $ARCH = "x86_64" ]; then
            export WINESERVER="$PWD/wine/$KERNEL/x86_64/bin/wineserver"
            export WINELOADER="$PWD/wine/$KERNEL/x86_64/bin/wine"
            export WINEPREFIX="$PWD/wine/data"
            export WINEDEBUG=-all:$WINEDEBUG
            ARCH="64 Bits"
    else
        echo "Unsoportted Architecture"
fi
