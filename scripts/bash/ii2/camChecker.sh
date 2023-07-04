#!/usr/bin/env bash
#import the main script
SSRC=$(readlink -f "$0")
SPWD=$(dirname "$SSRC")
source "$SPWD/main"
#Creating Log dir
mkdir -p $SPWD/logs

echo -e '\E[36m'"The live host check in progress.....! Please Wait...."'\E[0m'
echo " "
report_cam > $SPWD/logs/camstat.log
#clear
echo -e '\E[36m'"The system status log (systat.log) can be found in :"'\E[0m' $SPWD/logs/
sysinfo > $SPWD/logs/systat.log
echo " "
echo -e '\E[36m'"The Live host count with total is :"'\E[0m'
echo " "

FL=logs/camstat.log
UPC=$(awk '{print gsub("up",$0)}' $SPWD/$FL | awk 'BEGIN{sum=0}{sum=sum+$1}END{print sum}')
DOWNC=$(awk '{print gsub("down",$0)}' $SPWD/$FL | awk 'BEGIN{sum=0}{sum=sum+$1}END{print sum}')
TOTALC=$((UPC + DOWNC))

echo " "
echo -e '\E[31m'"The Total Number of Cam checked is :"'\E[0m' $TOTALC 2>&1 | tee $SPWD/logs/camLog.log
echo -e '\E[31m'"The Number of cam fount online is :"'\E[0m' $UPC 2>&1 | tee -a $SPWD/logs/camLog.log
echo -e '\E[31m'"The Number of cam fount Offline is :"'\E[0m' $DOWNC 2>&1 | tee -a $SPWD/logs/camLog.log

while read LINE
 do echo "$LINE" | grep "up" | cut -f2 -d" "
done < $SPWD/logs/camstat$CDT.log > $SPWD/logs/newR.log

echo "Creating the rtspL.log file...."
rtsp_file

echo "File created and present at"$PWD/logs
