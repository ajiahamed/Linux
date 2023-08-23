#!/usr/bin/env bash
#Continues back up to backup server
#SRC=$( dirname "$(readlink -e "$0")")
SRC2=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $SRC2
. $SRC2/common.lib

echo "Backup to server in progress ...!!!"
rsync -avzhe ssh $watchdir01 nix@$bkpsrv01:$bkpsrvdir01
