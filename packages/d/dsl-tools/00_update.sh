#!/bin/bash

DOWNFILE=00_download.txt

ODD=0

curl https://blog.didierstevens.com/my-software/ | gunzip | \
grep -i -o -E 'http://didierstevens.com/files/software/[^"]*|[a-f0-9]{64}' | \
while read I ; do
	if [ "$ODD" -eq 0 ] ; then
		ODD=1
		URL=$I
	else
		ODD=0
		HASH=`echo "$I" | tr A-F a-f `
		echo "$HASH	$URL"
	fi
done >> ${DOWNFILE}.x

cat "${DOWNFILE}".x | sort -u | sort -k 2 > "${DOWNFILE}.s"
mv "${DOWNFILE}.s" "${DOWNFILE}"





