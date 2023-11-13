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
        clear
}

# Verify if sudo is installed.
sudo_installed () {
    dpkg -S `which sudo` > /dev/null
    if [ $? -eq 1 ]; then
         echo -e $green "Sudo is installed" $eoc
    else
         echo -e $red "Sudo is not installed" $eoc
         return 0
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
       return 0
fi
}

# Execution of the command starts here
update

echo -e $nline   
sudo_enabled
echo -e $nline
sudo_installed
echo -e $nline
