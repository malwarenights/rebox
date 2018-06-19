#!/bin/sh

PGKSTORE=packages
DOWNFILE=00_download.txt

find "$PGKSTORE" -name "$DOWNFILE" -exec cat "{}" "+" | \
grep -v -E '^#|^$' | \
sort -u -k 2 > all_downloads.txt



