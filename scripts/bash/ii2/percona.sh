#!/usr/bin/env bash
#Title          : percona.sh
#Description    : To install percona server
#Author         : Mr.NIX
#Date           : 2019-02-12 18:38:15
#Version        : 0.01 V
#Usage          : . ./percona.sh
#Notes          : For installing mysql Percona server
#Bash_version   : 4.4.12(1)-release
#============================================================================

#Update & upgrade
sudo apt update && sudo apt upgrade

#Install Percona server
sudo apt install percona-server-server
