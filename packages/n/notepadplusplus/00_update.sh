#!/bin/bash

BASEURL="https://notepad-plus-plus.org"
LATEST=`curl -s -L "${BASEURL}/download/" | grep -i -o -e '/repository/.*/npp.*Installer.*\.exe' `

for I in $LATEST ; do
	wget -c "${BASEURL}${I}"
	BASE=`basename  "$I"`
	HASH=`sha256sum "$BASE" | cut -d ' ' -f 1`
	echo "$HASH	${BASEURL}${I}" >> 00_download.txt
	sort -u 00_download.txt | sort -k 2 > 00_download.txt.s
	mv 00_download.txt.s 00_download.txt
done


