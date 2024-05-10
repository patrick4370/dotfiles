#!/usr/bin/env bash
#===============================================================================
#
#          FILE: nasaph.sh
#
#         USAGE: ./nasaph.sh
#
#   DESCRIPTION: Retrieve the APOD (Astronomy Picture Of the Day) from NASA
#
#       OPTIONS:  
#  REQUIREMENTS: curl and API key from NASA - https://api.nasa.gov/ 
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 14/08/22 08:47
#===============================================================================
set -x
nasa_api='HhFJh5yg6QjEhxeaYBr29iZ3Sagb4wtgAvXyT3aY' # NASA API Key 
image_out="$HOME/Pictures/NASA/"                    # Directory to save file  
apod_url=$(curl -s https://api.nasa.gov/planetary/apod?api_key=$nasa_api | jq -r '.hdurl') # Grab the URL of the picture 
image_name=${apod_url##*/} # Get the image name from the URL

# Test whether file exists, if it doesn't download the picture
[[ ! -f "${image_out}${image_name}" ]] && curl -s -o "${image_out}${image_name}" "${apod_url}" 
