#!/bin/sh

read -p "Press [Enter] key to start Initial Setup..."

###### My Start Up Script ######

echo " Update Upgrde "
apt-get update
apt-get upgrade

echo " Install Restricted extras "
apt-get -y install ubuntu-restricted-extras

echo " Install VLC player "
apt-get -y install vlc

echo " Flash Player "
apt-get -y install flashplugin-installer

echo " GIMP "
apt-get -y install gimp

echo " Mate Desktop "
apt-get install mate-desktop-environment-extras

echo " Classic Desktop "
apt-get install gnome-session-flashback

###### ---------- ######

echo "You are user $UID on $HOSTNAME"
echo "Your home directory is: $HOME"
echo "$HOSTNAME is running $OSTYPE"
