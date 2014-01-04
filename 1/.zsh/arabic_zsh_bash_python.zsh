#!/bin/zsh



wgp() {
    python -c 'exec("import sys,os\nfor line in sys.stdin:\n\tprint line")'
}



help_bash()
{
    python -c 'exec("import sys,os\nprint sys.stdin")'
}

help_bash $@
