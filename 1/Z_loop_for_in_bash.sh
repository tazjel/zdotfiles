#!/usr/bin/env sh

for ip in `seq 1 7`; do
    mkdir -p $HOME/zdotfiles/$ip
    for cip in `seq 1 10`; do
        mkdir -p $HOME/zdotfiles/$ip/$cip
    done
done
