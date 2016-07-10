#!/usr/bin/env bash

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

java -version
sudo apt-get install oracle-java8-set-default
sudo update-java-alternatives -s java-8-oracle
