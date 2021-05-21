#!/bin/sh

#Stop automatic updater
sudo dpkg-reconfigure -plow unattended-upgrades

#Reconfigure unpacked packages
sudo dpkg --configure -a

#Update system
sudo apt update && sudo apt -f install && sudo apt full-upgrade

#Enable automatic updater
sudo dpkg-reconfigure -plow unattended-upgrades


