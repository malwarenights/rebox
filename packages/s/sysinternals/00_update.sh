#!/bin/bash

URL="https://download.sysinternals.com/files/SysinternalsSuite.zip"
OLDNAME=SysinternalsSuite.zip

#wget "$URL"
unzip -T "$OLDNAME"
DATE=`TIME_STYLE=+%Y%m%d ls -l "$OLDNAME" | cut -d ' ' -f 6`

NEWNAME=`basename "$OLDNAME" .zip`"-${DATE}.zip"
mv "$OLDNAME" "$NEWNAME"

SHA256=`sha256sum "$NEWNAME"|cut -d ' ' -f 1`

sed -i -e 's|^\([0-9a-f]\)|# \1|;' 00_download.txt
echo "$SHA256	$URL	$NEWNAME" >> 00_download.txt

sed -i -e "s|PACKAGE=SysinternalsSuite-.........zip|$NEWNAME|g" 00_install.bat

