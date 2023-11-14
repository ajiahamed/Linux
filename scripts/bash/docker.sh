#!/usr/bin/env bash
#Title          : docker.sh
#Description    : For installing docker engine in deb based systems
#Author         : Aji   
#Date           : 2023-11-09 11:23:10
#Version        : 1     
#Usage          : . ./docker.sh
#Notes          : This script will install the docker engin in debian system 
#                 and all are done by the script alone
#Bash_version   : 5.2.15(1)-release
#============================================================================
### Variables 
red="\e[1;31m"
green="\e[0;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
magenta="\e[1;35m"
cyan="\e[1;36m"
eoc="\e[0m \n"
nline='\n'
colbg="\e[31;43m"
cole="\e[0m"

update (){
        echo " "
        echo -e $colbg"The Process started..... "$cole
        echo " "
        echo " "
        echo -e $colbg"Updating..... "$cole
        echo " "
        sudo apt update &> /dev/null && sudo apt upgrade -y &> /dev/null
        echo "done."
        echo " "
        echo -e $colbg"Cleaning Up....!!!"$cole
        echo " "
        sudo apt autoclean -y &> /dev/null && sudo apt autoremove -y &> /dev/null
        echo "done."
        echo " "
	echo "Checking if reboot is required or not."
	[ -f /var/run/reboot-required ] && sudo reboot -f
        clear
}

# Verify if sudo is installed.
sudo_installed () {
    dpkg -S `which sudo` > /dev/null
    if [ $? -eq 1 ]; then
         echo -e $green "Sudo is installed" $eoc
    else
         echo -e $red "Sudo is not installed" $eoc
	 read -p "Would you like to install it now? (y/n): " response01
	 if [ "$response01" == "y" ]; then
		 echo "Please log in as root user and install sudo !!!..."
		 sleep 5;
         fi
         exit 1
    fi
}
# Verify if the current user belongs to groups 'sudo' or 'root'.
sudo_enabled () {
local current_user_groups=$(groups $current_username)
if [[ $current_user_groups == *'root'* ]] ||
       [[ $current_user_groups == *'sudo'* ]]; then
       echo -e $green "User has sudo previlage" $eoc
else
       echo -e $red "User has no sudo previlage" $eoc
       exit 1
fi
}


# Execution of the command starts here

echo -e $nline   
sudo_enabled
echo -e $nline
sudo_installed
echo -e $nline

#Installation of Docker
update
#Installing prerequist before installing docker
echo "Installing Prerequist ....."
sudo apt install lsb-release gnupg2 apt-transport-https ca-certificates curl software-properties-common -y
echo "Done..."
echo " "
#clear
#Import the GPG key for docker repositories
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian.gpg
echo "Done ...."
echo " "
#Add the docker stable repository 
sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
#Update the repository 
sudo apt update
#Install docker-ce
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
#add the current user to the docker group
sudo usermod -aG docker $USER
#verify 
newgrp docker
#To ensure that the service is running and enabled
sudo systemctl start docker && sudo systemctl enable docker

echo " "
echo "Docker CE is installed and services running...!"
