#!/bin/sh

PGKSTORE=packages
DOWNFILE=00_download.txt

MODULES="\
7zip
adobereader
unxutils
chocolatey
msdotnet
msvsruntime
autoit
exe2aut
"

for MODULE in $MODULES ; do
	LETTER1=`echo "$MODULE" | cut -c 1`
	if [ -f "${LETTER1}/${MODULE}/${DOWNFILE}" ] ; then
		./download.sh "${LETTER1}/${MODULE}/${DOWNFILE}"
	fi
done

