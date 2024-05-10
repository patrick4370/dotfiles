#!/usr/bin/env bash
#===============================================================================
#
#          FILE: laptop2tv.sh
#
#         USAGE: ./laptop2tv.sh
#
#   DESCRIPTION: 
#
#       OPTIONS:  
#  REQUIREMENTS:  
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 09/08/22 12:51
#===============================================================================

# set -o nounset        # Treat unset variables as an error

echo -e "\nLaptop to TV streamer"

minidlnad -f /home/patrick/.config/minidlna/minidlna.conf -P /home/patrick/.config/minidlna/minidlna.pid

dlna=$(cat ~/.config/minidlna/minidlna.pid)

echo -e "\nPress any key to quit $(basename $0)"

read -n 1
