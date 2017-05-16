#!/bin/sh

find ./00_packages -type f -name 00_download.txt | sort |\
while read MODULE ; do
	DIR=`dirname "$MODULE"`
	echo "===== download $DIR"
        ./download.sh "$DIR"
done


