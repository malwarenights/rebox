#!/bin/sh

PGKSTORE=packages
DOWNFILE=00_download.txt

find "$PGKSTORE" -name "$DOWNFILE" -exec cat "{}" ";" | \
sort -u | sort -k 2 > all_downloads.txt



