#!/bin/sh

PKGSTORE=packages
DOWN_FILE=00_download.txt

MODULE="$1"
LETTER1=`echo "$MODULE" | cut -c 1`
DOWN_DIR="${PKGSTORE}/${LETTER1}/${MODULE}"

if [ "x$DOWN_DIR" = "x" ] ; then
	echo "Syntax: $0 dir"
	echo "Will take 00_download.txt from given directory and do the downloading"
	echo "if target file is 'x' then rename the exe file by version and link"
	exit 1
fi


function check_dependencies(){
        DEPS="wget curl exiftool elinks"
        RETURN=0
        for I in $DEPS ; do
                if [ ! -f `which "$I"` ] ; then
                        echo "ERROR: Please install missing tool - $I"
                        RETURN=$(( $RETURN + 1 ))
                fi
        done

        if [ $RETURN -gt 0 ] ; then
                exit $RETURN
        fi
}


check_dependencies
RET=$?
if [ $RET -ne 0 ] ; then
	exit $RET
fi

if [ ! -d "$DOWN_DIR" ] ; then
	echo "===== Error: $DOWN_DIR is not directory"
	exit 1
fi

if [ ! -f "$DOWN_DIR/$DOWN_FILE" ] ; then
	echo "===== Error: missing $DOWN_DIR/$DOWN_FILE file"
	exit 2
fi

pushd "$DOWN_DIR"

cat "$DOWN_FILE" | sed -e 's/#.*$//g' | grep -v "^[ ]*$" | \
while IFS="	" read HASH URL FILE ; do
	#If there is only one parameter, then it is URL
	if [ "x$URL" == "x" -a "x$FILE" == "x" ] ; then
		URL="$HASH"
		HASH=""
	fi

	echo "Hash:$HASH URL:$URL File:$FILE"

	#If download config doesn't contain special filename, take it from URL
	if [ "x$FILE" == "x" -o "$FILE" == "x" ] ;  then
		OFILE=`basename "$URL"`
	else
		OFILE="$FILE"
	fi


	# If forced re-download, delete link if exists
	if [ -L "${OFILE}" -a "x$FORCE" != "x" ] ; then
		rm "${OFILE}"
	fi

	# Do not re-download without the FORCE=yes
	if [ ! -f "${OFILE}" -o "x$FORCE" != "x" ] ; then
		OPTS=""
		echo "$URL" | grep -e 'sourceforge.net' > /dev/null

		#Sourceforge allows direct download for wget
		if [ $? -eq 0 ] ; then
			OPTS="--user-agent=Wget/1.18 (linux-gnu)"
		fi

		echo "$URL" | grep -e 'oracle.com' > /dev/null

		#Accept Oracle eula
		if [ $? -eq 0 ] ; then
			OPTS="--header=Cookie: oraclelicense=accept-securebackup-cookie"
		fi

		#Remove link if it exists
		[ -L "${OFILE}" ] && rm "${OFILE}"

		if [ "x$OPTS" == "x" ] ; then
			wget --no-verbose -c "$URL" -O "$OFILE"
		else
			wget "$OPTS" --no-verbose -c "$URL" -O "$OFILE"
		fi
	fi

	#Check the checksum, if wrong, rename the file
	CHECK=`sha256sum "$OFILE" | cut -d ' ' -f 1`
	if [ "x$HASH" != "x" -a "$HASH" != "$CHECK" ] ; then
		echo "===== ERROR: Wrong checksum for \"$OFILE\""
		echo "Expected: $HASH \"$OFILE\" "
		echo "Present:  $CHECK \"$OFILE\" "
		mv "$OFILE" "${OFILE}.${CHECK}"
		continue
	fi

	#Rename files of generic DOWN_DIR to contain version, link to generic name
	if [ "$FILE" == "x" -a ! -L "$OFILE" ] ;  then
		BFILE=`echo "$OFILE" | sed -e 's/.[^.]*$//'`
		EXT=`echo "$OFILE" | sed -e 's/^.*\.//'`
		VER=`exiftool "$OFILE" |grep "Product Version Number" | cut -d ':' -f 2 | sed -e 's/^[ ]*//g;'`
		BFILE=`echo "$BFILE" | sed -e "s/${VER}//"`
		FILE="${BFILE}-${VER}.${EXT}"

		mv -f "$OFILE" "$FILE"
		ln -s "$FILE" "$OFILE"
	fi

done

popd


