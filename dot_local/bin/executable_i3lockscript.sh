#!/bin/bash
#===============================================================================
#
#          FILE: i3lockscript.sh
#
#         USAGE: ./i3lockscript.sh
#
#   DESCRIPTION: My screen lock script I use in i3wm
#
#       OPTIONS: 
#  REQUIREMENTS: escrotum, imagemagick 
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 25/07/22 16:58
#===============================================================================

#-------------------------------------------------------------------------------
# Declare variables
#-------------------------------------------------------------------------------
backgnd=/tmp/screen.png
padlock=~/.local/share/pics/lock.png

#-------------------------------------------------------------------------------
# Program start 
#-------------------------------------------------------------------------------
escrotum $backgnd
convert $backgnd -scale 10% -scale 1000% $backgnd
[[ -f $backgnd ]] && convert $backgnd $padlock -gravity center -composite -matte $backgnd || exit

i3lock -i $backgnd
rm $backgnd
