SRC=$(readlink -f "$0")
SPWD=$(dirname "$SRC")
SRC1=$(readlink -f $0)
SFP=${SRC1%/*}


DT=$(dirname "$(readlink -f "$0")")

DIRt="$(realpath "$(dirname "$BASH_SOURCE")")"


#echo $DIRt
echo $DT
echo " "
echo $DIRt
