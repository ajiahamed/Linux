#!/usr/bin/env bash
SSRC=$(readlink -f "$0")
PWD=$(dirname "$SSRC")
source "$PWD/main_02.sh"
mkdir -p $PWD/logs
MD=$(date +%Y%m%d)
mkdir -p  $PWD/logs/"$MD"

#sysinfo > $PWD/logs/$MD/sys$CDT.log

echo "The host live test is progressing Please wait ......"
echo " "
report_cam > $PWD/logs/$MD/status$CDT.log

cat $PWD/logs/$MD/status$CDT.log
