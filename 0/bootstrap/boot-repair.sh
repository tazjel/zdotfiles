#!/usr/bin/env bash

#How to Dual Boot Ubuntu and Windows Properly

#January 9th, 2014, 16:05 GMT · By Silviu Stahie

#http://news.softpedia.com/news/How-to-Dual-Boot-Ubuntu-and-Windows-Properly-415377.shtml


sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt-get update
sudo apt-get install -y boot-repair && (boot-repair &)
