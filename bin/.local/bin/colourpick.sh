#!/usr/bin/env bash
#===============================================================================
#
#          FILE: colourpick.sh
#
#         USAGE: ./colourpick.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Patrick Heffernan (PH), pheffernan4370@gmail.com
#  ORGANIZATION: 
#       CREATED: 11/06/20 14:05:03
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

colorpicker --short --one-shot | xsel -b
exit
