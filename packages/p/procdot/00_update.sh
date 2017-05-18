#!/bin/bash

BASEURL="http://www.procdot.com"
LATEST=`curl -s -L "${BASEURL}/downloadprocdotbinaries.htm" | grep -i -o -e 'download/procdot/binaries/procdot_.*windows.zip' `

for I in $LATEST ; do
	wget -c "${BASEURL}/${I}"
	FILE=`basename "$I"`
	SHA256=`sha256sum "$FILE" | cut -d ' ' -f 1`
	echo "$SHA256	${BASEURL}/${I}" >> 00_download.txt
done

sort -u 00_download.txt | sort -k 2  > 00_download.txt.s
mv 00_download.txt.s 00_download.txt

md5sum *.zip >> 00_checksum.txt
sha256sum *.zip >> 00_checksum.txt
sort -u 00_checksum.txt | sort -k 2 > 00_checksum.txt.s
mv 00_checksum.txt.s 00_checksum.txt



