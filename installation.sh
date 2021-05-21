#!/bin/bash

apps=("skype" "slack" "google-chrome")

#Select menu
PS3="Select action: "
select opt in "Update" "Update & Install" "Quit"
do
  case $opt in
    "Update")

      #Stop automatic updater
      sudo dpkg-reconfigure -plow unattended-upgrades

      #Reconfigure unpacked packages
      sudo dpkg --configure -a

      #Update system
      sudo apt update && sudo apt -f install && sudo apt full-upgrade

      #Enable automatic updater
      sudo dpkg-reconfigure -plow unattended-upgrades
      break;;

    "Update & Install")

      #Stop automatic updater
      sudo dpkg-reconfigure -plow unattended-upgrades

      #Reconfigure unpacked packages
      sudo dpkg --configure -a

      #Update system
      sudo apt update && sudo apt -f install && sudo apt full-upgrade

      #Enable automatic updater
      sudo dpkg-reconfigure -plow unattended-upgrades

      #Array loop
      for i in ${apps[@]}
      do
	#Check if app is installed
        if ! command -v $i &> /dev/null
        then

	  #If value is google-chrome
          if [ "$i" == "google-chrome" ]
          then

	    #Google chrome installation
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo apt install ./google-chrome-stable_current_amd64.deb
          else
	    #Install from snap
            sudo snap install $i --classic
          fi
    	fi
      done
      break;;

    "Quit")
      break;;

    #If input is invalid
    *) echo "$REPLY is invalid";;

  esac
done

