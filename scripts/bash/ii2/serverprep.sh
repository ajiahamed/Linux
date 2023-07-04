#!/usr/bin/env bash
#Title          : serverprep.sh
#Description    : To prepare the server environment and call the script to install needed software
#Author         : Mr.Nix
#Date           : 2019-02-12 18:40:35
#Version        : 0.01 v
#Usage          : . ./serverprep.sh
#Notes          : update, add repo, and call the scripts
#Bash_version   : 4.4.12(1)-release
#============================================================================

#Upadate && Upgrade
sudo apt update && sudo apt upgrade

#
