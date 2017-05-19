#!/bin/bash

BASEURL="https://www.wireshark.org/"
LATEST=`curl -s "${BASEURL}/download.html" | grep -i -o -e 'https://.*Wireshark.*.exe' | head -n 2`

for I in $LATEST ; do
	wget -c "${I}"
	FILE=`basename "${I}"`
	HASH=`sha256sum "${FILE}" | cut -d ' ' -f 1`
	echo "$HASH	$I" >> 00_download.txt
done


md5sum *.exe > checksum.txt
sha256sum *.exe >> checksum.txt


