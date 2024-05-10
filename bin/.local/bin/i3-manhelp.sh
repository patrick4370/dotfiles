#!/usr/bin/env bash
#===============================================================================
#
#          FILE: i3-manhelp.sh
#
#         USAGE: ./i3-manhelp.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Patrick Heffernan (PH), pheffernan4370@gmail.com
#  ORGANIZATION: 
#       CREATED: 17/11/19 08:46:43
#      REVISION:  ---
#===============================================================================

man -i -k . | rofi -dmenu -l 10 -p "Enter manpage" | awk '{print $1}' | xargs -r man -Tpdf | zathura -
