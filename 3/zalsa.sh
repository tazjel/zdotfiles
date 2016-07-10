#!/usr/bin/env bash



/sbin/alsactl store && /sbin/alsa suspend
/sbin/alsactl store && /sbin/alsa 
sudo alsa force-reload
sudo alsa force-reload
sox -t alsa default ./recording.flac silence 1 0.1 5% 1 1.0
sudo alsa force-reload
sudo alsa force-reload
sudo alsa force-reload
alsa H
alsa resume
