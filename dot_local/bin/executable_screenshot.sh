#!/bin/bash
#===============================================================================
#
#          FILE: screenshot.sh
#
#         USAGE: ./screenshot.sh
#
#   DESCRIPTION: 
#
#       OPTIONS:  
#  REQUIREMENTS:  
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 13/08/22 09:41
#===============================================================================

# set -o nounset        # Treat unset variables as an error

delay=5

savepath=~/Pictures/Screenshots/
filename="%Y-%m-%d-%H%M%S_$wx$h_escrotum.png"

for i in {5..0};
do
    dunstify -r 123 --icon="~/.local/share/icons/dunst/camera.png" "Screenshot in $i seconds ...";
    sleep 1;
done

dunstify -C 123
