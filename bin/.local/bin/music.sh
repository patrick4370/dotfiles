#!/usr/bin/env bash
#===============================================================================
#
#          FILE: music.sh
#
#         USAGE: ./music.sh
#
#   DESCRIPTION: 
#
#       OPTIONS:  
#  REQUIREMENTS:  
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 08/08/22 15:24
#===============================================================================

# set -o nounset        # Treat unset variables as an error
kunst --silent --force-online &
alacritty --class ncmpcpp -e ncmpcpp & 
glava &
