#!/usr/bin/env bash


if [ pgrep easystroke ]; then
    kill -9 $(pgrep easystroke) && easystroke quite
else
    easystroke -c $HOME/.easystroke && echo "start..."
fi
