#!/usr/bin/env bash
##Source Dir
SSRC=$(readlink -f "$0")
PWD=$(dirname "$SSRC")
source "$PWD/main_02.sh"
mkdir -p $PWD/logs
mkdir -p  $PWD/logs/$MD

echo "The host live test is progressing Please wait ......"
echo " "
report_cam > $PWD/logs/$MD/status$CDT.log

echo " "
#clear
echo "The log file "sys$CDT.log" is present in :" $PWD/logs/$MD
sysinfo > $PWD/logs/$MD/sys$CDT.log
echo " "

FL=logs/$MD/status$CDT.log
UPC=$(awk '{print gsub("up",$0)}' $PWD/$FL | awk 'BEGIN{sum=0}{sum=sum+$1}END{print sum}')
DOWNC=$(awk '{print gsub("down",$0)}' $PWD/$FL | awk 'BEGIN{sum=0}{sum=sum+$1}END{print sum}')
TOTALC=$((UPC + DOWNC))

echo "The Total Number of Cam Checked is: " $TOTALC  2>&1 | tee $PWD/logs/$MD/camLog$CDT.log
echo "The Total Number of Cam up is: " $UPC 2>&1 | tee -a $PWD/logs/$MD/camLog$CDT.log
echo "The Total Number of cam Down is: " $DOWNC 2>&1 | tee -a $PWD/logs/$MD/camLog$CDT.log

while read LINE
 do echo "$LINE" | grep "up" | cut -f2 -d" "
done < $PWD/logs/$MD/status$CDT.log > $PWD/logs/$MD/newR.log

echo "Creating the rtspL.log file...."
rtsp_file

echo "File created and present at"$PWD/logs/$MD


end_

