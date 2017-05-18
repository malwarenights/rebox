#!/bin/bash

DOMAIN="https://www.winitor.com"
DOWNSITE="$DOMAIN/binaries.html"

HTML=`curl "$DOWNSITE"`

DOWNURL=`echo "$HTML" | grep -o -P '/tools/pestudio.*\.zip(?=")'`
HASH=`echo "$HTML" | grep -o -P '(?<![a-fA-F0-9])[a-fA-F0-9]{64}'`

DOWNURL="${DOMAIN}${DOWNURL}"
FILE=`basename "$DOWNURL"`
wget "$DOWNURL" -O "${FILE}.$$"

SHA256=`sha256sum "${FILE}.$$"|cut -d ' ' -f 1`

if [ "$HASH" = "$SHA256" ] ; then
	echo "$SHA256	$DOWNURL" >> 00_download.txt
	mv "${FILE}.$$" "$FILE"
else
	echo "==== Error:"
	echo "Downloaded:$SHA256	Expected:$HASH	$DOWNURL"
	echo "Check file ${FILE}.$$"
fi



