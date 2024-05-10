#!/usr/bin/env bash
#===============================================================================
#
#          FILE: bak_ff_tb.sh
#
#         USAGE: ./bak_ff_tb.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#        AUTHOR: Patrick Heffernan (PH), pheffernan4370@gmail.com
#       CREATED: 29/06/20 15:23:14
#===============================================================================

set -o nounset                                  # Treat unset variables as an error


#-------------------------------------------------------------------------------
# Create some variables 
#-------------------------------------------------------------------------------

dest_dir=~/Dropbox

#-------------------------------------------------------------------------------
# close all unnecessary programs
#-------------------------------------------------------------------------------

pgrep -x brave >/dev/null && pkill brave
pgrep -x firefox >/dev/null && pkill firefox
pgrep -x thunderbird >/dev/null && pkill thunderbird


#-------------------------------------------------------------------------------
# Test if the ~/Dropbox directory is empty and if so, quit with a warning 
#-------------------------------------------------------------------------------

if [ -z "$(ls -A $dest_dir)" ]; then
   	echo "Dropbox app not started" && exit
fi
