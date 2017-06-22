#!/bin/bash

# gnufind -name '*.exe' > W:/exefiles.txt

cat exefiles.txt |\
sed -e 's/^.\\/C:\\software\\/g; s|\\|\\\\|g;' |\
grep -v -E 'C:\\software\\unxutils|Uninstall.exe|unins'|\
while read EXE ; do
	BASE=`echo "$EXE" | sed -e 's|^.*\\\\||;'`
	echo "%ChocolateyInstall%\\tools\\shimgen.exe --path=\"$EXE\" --output=\"%ChocolateyInstall%\\bin\\${BASE}\""
done


