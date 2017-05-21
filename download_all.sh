#!/bin/sh

PKGSTORE=packages

find $PKGSTORE -type f -name 00_download.txt | sort |\
while read MODULE ; do
	DIR=`dirname "$MODULE"`
	MODULE=`basename "$DIR"`
	echo "===== download $MODULE"
        ./download.sh "$MODULE"
done


