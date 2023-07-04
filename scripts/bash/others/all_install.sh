#!/usr/bin/env bash
#
##################################################################################################################
# This script is for 64 bits Operating System
# Author 			: 	Aji Ahamed (Mr. Nix, AjiNix)
# Website 			: 	http://www.NixnTronics.in, http://www.ajiahamed.com
# E-mail			:	ajiahamed@gmail.com
# Script Version		:	0.6
# Date 				:  	 07-03-2018
#################################################################################################################
echo """                                                              '
  echo ' _   _  _            _______                   _              '
  echo '| \ | |(_)          |__   __|                 (_)             '
  echo '|  \| | _ __  __ _ __  | | _ __   ___   _ __   _   ___  ___   '
  echo '|   \ || |\ \/ /| '_ \ | || '__| / _ \ | '_ \ | | / __|/ __|  '
  echo '| |\  || | >  < | | | || || |   | (_) || | | || || (__ \__ \  '
  echo '|_| \_||_|/_/\_\|_| |_||_||_|    \___/||_| |_||_| \___||___/  '
  echo ''
  echo ''
  echo 'Created By Mr. Nix'
  echo 'Version o.4'
  echo 'www.NixnTronics.in '
  echo """
##################################################################################################################
##################################################################################################################
#                                                                                                                #
#   RUN THIS SCRIPT AT YOUR OWN RISK.                                                                            #
#                                                                                                                #
##################################################################################################################

colbg="\e[31;43m"
cole="\e[0m"
red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
magenta='\e[1;35m'
cyan='\e[1;36m'
eoc='\e[0m\n'
tab='\n'

echo -e"

#####################################################################
#						SYSTEM DETAILS								#
#####################################################################

Hostname         : `hostname`
Kernel Version   : `uname -r`
Uptime           : `uptime | sed 's/.*up \([^,]*\), .*/\1/'`
Last Reboot Time : `who -b | awk '{print $3,$4}'`

*********************************************************************
*	Continueing...... 												*
*********************************************************************
"
##update upgrade
echo -e $colbg'***** Updating and Upgrading.....!'$cole
sudo apt-get update && sudo apt-get upgrade -y
echo " "
echo " "
echo "Please Press Enter to continue...."
read 
echo 

## Create a temp folder for downloading
DPKG_DIR="./debs"
CDIR="$PWD"

if [ ! -d $DPKG_DIR ]
	then
	echo -n " -> making a directory for downloads ...!"
	mkdir $DPKG_DIR
	echo "[ok]"
fi
## Change dir to the newlly created drive
cd $CDIR/$DPKG_DIR



##################################################################################################################
##################################################################################################################
#                                                                                                                #
#   SYSTEM INFORMATION..                                                                                         #
#                                                                                                                #
##################################################################################################################

# Hostname information
echo -e $colbg'***** HOSTNAME INFORMATION *****'$cole
hostnamectl
echo ""
# File system disk space usage:
echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE ******\e[0m"
df -h
echo ""
#Free and used memmory in the system :
echo -e "\e[31;43m***** FREE AND USED MEMORY *****\e[0m"
free
echo ""
# System uptime and load:
echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""
# Logged in users:
echo -e "\e[31;43m***** CURRENT LOGGED IN USERS *****\e[0m"
who
echo ""
# Top 5 processes as far as memory usage is concerned:
echo -e "\e[31;43m***** TOP 5 MEMORY CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo -e "
\e[1;32m
##################################################################################################################
#                                                                                                                #
#                               DONE ....!!!                                                                     #
#                                                                                                                #
##################################################################################################################

