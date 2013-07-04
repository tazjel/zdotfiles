#!/bin/bash

    if [ -n "`pgrep sixad`" ]; then #true when sixad is running
        gksudo "sh -c '/etc/init.d/sixad stop; service bluetooth restart'"
    else
        gksudo "sh -c 'service bluetooth stop; /etc/init.d/sixad restart'"
    fi

    exit 0;
