#!/bin/bash    
 
if [ -d $HOME/zdotfiles/link ]; then
        for f in $HOME/zdotfiles/link/.*; do
                [ -x "$f" ] && echo "$f"
        done
        unset f
fi