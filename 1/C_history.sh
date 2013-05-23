#!/bin/bash

w_history
{
    history | sed 's/^\( \w\{,4\}\)//g' | sed 's/^ //g'
}

echo "احمد"
