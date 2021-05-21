#!/bin/bash

apps=("skype" "slack" "google-chrome")

for i in ${apps[@]}
do

    if ! command -v $i &> /dev/null
    then
    	echo $i "needs to install"

	if [ "$i" == "google-chrome" ]
	then
	  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	  sudo apt install ./google-chrome-stable_current_amd64.deb
	else
	  sudo snap install $i --classic
	fi
    else
    	echo $i  "Installed already"
    fi
done
