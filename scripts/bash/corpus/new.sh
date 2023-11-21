#!/usr/bin/env bash
#test.....
#SRC=$( dirname "$(readlink -e "$0")")
SRC2=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $SRC2
. $SRC2/common.lib

echo "execution completed!...."
