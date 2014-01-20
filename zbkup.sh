#!/bin/bash

ZBKUP=$(cd ~;find $HOME/zdotfiles/link -maxdepth 1 \
    -and -not ".easystroke" \
    -exec basename {} \;)

echo $ZBKUP

ZBKUPw=()
