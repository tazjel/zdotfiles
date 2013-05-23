#!/bin/bash
export N6=/dev/null

function ahave()
{ unset -v ahave; command command type $1 &>$N6 && ahave="yes" || return 1 && echo "YES"; }
ahave ls
