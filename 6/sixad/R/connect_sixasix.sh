#!/bin/bash
sudo -S hcitool dc $(hcitool con)
sudo -S killall sixad-bin
sudo -S killall sixad
sudo -S sixad -s
