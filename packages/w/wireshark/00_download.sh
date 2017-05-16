#!/bin/bash

BASEURL="https://www.wireshark.org/"
LATEST=`curl -s "${BASEURL}/download.html" | grep -i -o -e 'https://.*Wireshark.*.exe' `

for I in $LATEST ; do
	wget -c "${I}"
done


md5sum *.exe > checksum.txt
sha256sum *.exe >> checksum.txt


