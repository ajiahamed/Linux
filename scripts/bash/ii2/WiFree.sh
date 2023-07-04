#!/usr/bin/env bash
#Installation of Wifree server
#created By AJI AHAMED
#20-11-2017 @ 10:00 AM version 01
#24-11-2017 @ 06:00 PM version 02

###Updateing and Upgrading Ubuntu Server
apt-get update && apt-get upgrade
read -n 1 -s -r -p "Press any key to continue"
clear
echo " "
echo " "

###Installing Needed Packages

apt-get install memcached
read -n 1 -s -r -p "Press any key to continue"
vim /etc/memcached.conf
service memcached restart
read -n 1 -s -r -p "Press any key to continue"
clear
mkdir /usr/local/kiss-dns
ls
read -p "Continuing in 5 seconds..." -t 5
clear

###Installing Unzip

apt-get install unzip wget
read -n 1 -s -r -p "Press any key to continue"
clear
echo " "
echo " "
cd /usr/local/kiss-dns

###Download kiss-dns

wget http://kiss-server.s3-website-ap-northeast-1.amazonaws.com/kiss-dns-0.8.1.zip
echo " "
echo " "
unzip kiss-dns-0.8.1.zip
ls
read -p "Continuing in 5 seconds..." -t 5

### Phase Two of Setup ###
###Installing NodeJS

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
read -p "Continuing in 5 seconds..." -t 5
echo " "
echo " "
npm install
ls
read -p "Continuing in 5 seconds..." -t 5
clear
node kiss-dns.js configure
read -n 1 -s -r -p "Press any key to continue"
vim config.json
clear
node kiss-dns.js
echo " "
echo " "
npm install pm2 -g
pm2 list
read -p "Continuing in 5 seconds..." -t 5
clear
pm2 start kiss-dns.js
pm2 list
read -p "Continuing in 5 seconds..." -t 5
pm2 startup
pm2 save
pm2 list
pm2 logs

###Phase Three of Setup
###Installing NGINX....

apt-get install nginx nginx-extras
vim /etc/nginx/nginx.conf
read -n 1 -s -r -p "Press any key to continue"
service nginx restart
read -p "Continuing in 5 seconds..." -t 5
clear
curl 127.0.0.1
read -n 1 -s -r -p "Press any key to continue"
pm2 logs
