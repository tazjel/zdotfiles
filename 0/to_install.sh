#! /bin/bash

toInstall="$@"
toInstall=${toInstall#*:}
lxterm -e "sudo apt-get install $toInstall; read"
