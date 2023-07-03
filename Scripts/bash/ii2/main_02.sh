#!/usr/bin/env bash

# unset any variable which system may be using
#Variables
SSRC=$(readlink -f "$0")
PWD=$(dirname "$SSRC")
mkdir -p $PWD/logs
mkdir -p  $PWD/logs/"$MD"
# clear the screen
#clear

#unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage
CDT=$(date +%Y%m%d-%H%M%S)
MD=$(date +%Y%m%d)

sysstat(){
	ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -5
}

sysinfo(){
mkdir -p $PWD/tmp
echo -e '\E[31m'"Testing The Colour :"'\E[0m'
# Define Variable tecreset
#tecreset=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e '\E[31m'"Internet: $tecreset Connected" || echo -e '\E[31m'"Internet: $tecreset Disconnected"

# Check OS Type
os=$(uname -o)
echo -e '\E[31m'"Operating System Type :" $os

# Check OS Release Version and Name
cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > $PWD/tmp/osrelease
echo -n -e '\E[31m'"OS Name :" cat $PWD/tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
echo -n -e '\E[31m'"OS Version :" cat $PWD/tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

# Check Architecture
architecture=$(uname -m)
echo -e '\E[31m'"Architecture :" $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[31m'"Kernel Release :" $kernelrelease

# Check hostname
echo -e '\E[31m'"Hostname :" $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[31m'"Internal IP :" $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e '\E[31m'"External IP :" $externalip
# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[31m'"Name Servers :" $nameservers

# Check Logged In Users
who>$PWD/tmp/who
echo -e '\E[31m'"Logged In users :" cat $PWD/tmp/who

# Check RAM and SWAP Usages
free -h | grep -v + > $PWD/tmp/ramcache
echo -e '\E[31m'"Ram Usages :"
cat $PWD/tmp/ramcache | grep -v "Swap"
echo -e '\E[31m'"Swap Usages :"
cat $PWD/tmp/ramcache | grep -v "Mem"
# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > $PWD/tmp/diskusage
echo -e '\E[31m'"Disk Usages :"
cat $PWD/tmp/diskusage

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e '\E[31m'"Load Average :" $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[31m'"System Uptime Days/(HH:MM) :" $tecuptime
# Unset Variables
#unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
#rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/diskusage
rm -rf $PWD/tmp

}

##################################################################
##Checking and reporting the list of ip from the ip_list file
report_cam(){
    cat $PWD/ip_list |  while read output
    	do
   		 ping -c 1 "$output" > /dev/null
        		if [ $? -eq 0 ]; then
            			echo "cam $output is up"
        		else
            			echo "cam $output is down"
        		fi
    	done
}

###################################################################
##creating rtsp file list for recording the feed from newR

rtsp_file(){
    cat $PWD/logs/$MD/newR.log |  while read output
        do
                 echo "rtsp://admin:admin%40124@"$output
        done > $PWD/logs/$MD/rtspL.log
}

end_(){
echo -e '\E[36m'"
#####################################################################
#                               DONE ....!!!                        #
#####################################################################
"'\E[0m'
}

