#!/usr/bin/env bash
#
#  Author: Patrick Heffernan <patrick4370@bigpond.com>
#    Date: 04/June/2024 - 11:52
# Purpose: YAD File selection for browsing and selecting files
#
set -euo pipefail


finish() 
{
	unset FILE filename filebase	  
}

trap finish EXIT

# YAD file selection code for browsing and selecting files

pushd "$HOME"/2FA > /dev/null || exit

FILE=$(yad --file --title="Select a File" --file-filter="IMAGES|*.png *.jpg" --file-filter="ALL | *.*")
case $? in 
	0)
		filename="${FILE##*/}"
		filebase="${filename%.*}";;
	1)
		yad --info --text="No file selected. Quitting program"
		exit 1;;
	-1)
		echo "An unexpected error has occurred.";;
esac

yad --info --text="Secret key for $filebase will now be placed on the clipboard" --width 450

# Place secret onto the clipboard
zbarimg -q "$FILE" | grep -o -P '(?<=secret=).*?(?=&)' | xclip 

myexit="$?"

if [ "$myexit" != 0 ] 
then
	echo "Exiting with errorlevel $myexit"
fi

popd
