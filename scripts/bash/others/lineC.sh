#!/usr/bin/env bash
echo "Enter a filename: "
read file_name
count=0
while read
do
	((count=$count+1))
done < $file_name
echo $count
