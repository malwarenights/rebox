#!/bin/sh

PKGSTORE=packages
DOWNFILE=00_download.txt

MODULES="\
7zip
adobereader
unxutils
chocolatey
flash
jre8
msdotnet
msvsruntime
autoit
exe2aut
"

for MODULE in $MODULES ; do
	LETTER1=`echo "$MODULE" | cut -c 1`
	if [ -f "${PKGSTORE}/${LETTER1}/${MODULE}/${DOWNFILE}" ] ; then
		./download.sh "${PKGSTORE}/${LETTER1}/${MODULE}/${DOWNFILE}"
	fi
done

