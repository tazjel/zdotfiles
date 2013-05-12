#!/bin/bash
echo w | sudo -S hcitool dc XX:XX:XX:XX:XX:XX
echo w | sudo -S killall sixad-bin
echo w | sudo -S killall sixad
echo w | sudo -S sixad -s
