#!/bin/bash

# Auhtor: Mohammad Shadman

# It will update & clean the system.  

echo -e "\n$(date "+%d-%m-%Y --- %T") --- Starting\n"

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade 
sudo apt-get -y autoremove
sudo apt-get -y clean
sudo apt-get -y autoclean

echo -e "\n$(date "+%d-%m-%Y --- %T") --- Done"
