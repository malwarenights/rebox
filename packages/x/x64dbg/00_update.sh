#!/bin/bash

NEWURL=`curl --user-agent wget -I  'https://sourceforge.net/projects/x64dbg/files/latest/download?source=files' 2>/dev/null| grep -o -e 'https://.*\.zip'`

grep "$NEWURL" 00_download.txt
if [ $? -ne 0 ] ; then
	wget -c --user-agent wget "$NEWURL"
	BASE=`basename "$NEWURL"`
	HASH=`sha256sum "$BASE" | cut -d ' ' -f 1`
	echo "$HASH	$NEWURL" >> 00_download.txt
fi
