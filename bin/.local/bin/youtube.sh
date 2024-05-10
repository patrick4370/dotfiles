#!/usr/bin/env bash
#===============================================================================
#
#          FILE: youtube.sh
#
#         USAGE: ./youtube.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#  ORGANIZATION: Your Dog Needs a Coat
#       CREATED: 25/06/22 16:23:41
#      REVISION:  ---
#===============================================================================

player='/usr/bin/mpv'

URL=$(yad --entry --entry-label=" Enter YouTube URL " --width=500 --fixed)

alacritty -e ytfzf -t $URL
