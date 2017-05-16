#!/bin/bash

BASEURL="http://www.7-zip.org/"
DOWNLOADS=00_download.txt
TOGET=`curl "${BASEURL}"|grep -e '\.exe.*Download' | grep -o -e '[^"]*\.exe'`

for I in $TOGET ; do
	wget -c "${BASEURL}${I}"
        FILE=`basename "$I"`
	SHA256=`sha256sum "$FILE" | cut -d ' ' -f 1`
	echo "$SHA256 ${BASEURL}${I}" >> $DOWNLOADS
done

sort -u "$DOWNLOADS" > "${DOWNLOADS}.x"
mv "${DOWNLOADS}.x" "${DOWNLOADS}"


