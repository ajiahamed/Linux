#!/usr/bin/env bash
#Regular backup of data!
#Created on 06-07-2018 5:35PM
#Author Aji Ahamed
#Version 2

SPath=/usr/local/bin
. $SPath/up

banner_bkp

#START
TIME=`date +%b-%d-%y`	#date and time format
hostname=$(hostname -s)
#DBFILE=$hostname-db-$TIME.tar.gz
#APPFILE=$hostname-app-$TIME.tar.gz
BKPFILE=$hostname-bkp-$TIME.tar.gz

#SRCDIRDB=/<location>
#SRCDIRAPP=/<location>
SRCDIR=~/BKP/bin
#SRC="/xxx/xxx /sd/sd/sd /etc /boot /opt"
LDESDIR=~/LBKP
SNAR=~/LBKP/LOG/bkplog-$TIME.snar
#
#echo $SRCDIR
#echo
#echo $LDESDIR
#echo
#echo $SNAR
#echo

#tar -cpzvf $DESDIR/$DBFILE -g $SNAR $SRCDIRDB $SRCDIRAPP
tar -cpzvf $LDESDIR/$BKPFILE -g $SNAR $SRCDIR

echo read -n1 -s -r -p "Press any key to continue..."

rsync --rsync-path="mkdir -p ~/BKP/$hostname && rsync" pi@172.16.18.117:~/BKP/$hostname/
echo " "
echo "The remote path is setuped...!!!"
echo " "
echo "upload files ....!!!"
rsync -avzhrtu $LDESDIR/ pi@172.16.18.117:~/BKP/$hostname/
# -avzhrtu
# -artvzWe 
#rsync -aq –rsync-path=”mkdir -p /tmp/imaginary/ && rsync” file user@remote:/tmp/imaginary/
retval=$?


##Email

if [ $retval -eq 0 ]; then
		echo "Backup Process was Successful. A new backup files $BKPFILE, $SNAR has been created" | mailx -s "Backup Status Successful" aji.ahamed@ii2mail.com, dinu.divakaran@ii2mail.com, nixntronics@gmail.com
#		echo "Backup Process was Successful. A new backup files $BKPFILE and log file $SNAR has been created"
else
       echo "Backup Process Failed. Please contact System Administrator" | mailx -s "Backup Status Failed" aji.ahamed@ii2mail.com, dinu.divakaran@ii2mail.com, nixntronics@gmail.com
#		echo "Backup Process Failed. Please contact System Administrator"
		exit 1
fi

#END

#find /home/broexperts/source/* -type f -size 1M -exec mv {} /home/broexperts/backup/  \;
#-g will create a .snar file which is a snapshoot file
#keeping record of the current backup file, so this same
#file will be used next time to identify all modified/new files
#created in the snar dir
#
# Tar = Tape Archive Utility
# c = Create Tar File
# v = Verbose Mode
# f = It allows tar to get file name.
# g = list all incremental files
