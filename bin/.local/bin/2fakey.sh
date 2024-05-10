#!/bin/env bash
#===============================================================================
#
#          FILE: 2fakey.sh
#
#         USAGE: ./2fakey.sh
#
#   DESCRIPTION: Extract the secret key from a 2FA QR Code, place it onto the clipboard
#                ready for pasting into the TOTP field in Bitwarden.
#
#        AUTHOR: Patrick Heffernan (PH), pheffernan4370@gmail.com
#  ORGANIZATION: Your Dog Needs a Coat
#       CREATED: 14/11/20 10:43:52
#===============================================================================

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


exit="$?"

if [ "$myexit" != 0 ] 
then
	echo "Exiting with errorlevel $myexit"
fi

popd
