#!/usr/bin/env bash
#===============================================================================
#
#          FILE: wakeonlan.sh
#
#         USAGE: ./wakeonlan.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Patrick Heffernan (), <patrick4370@bigpond.com>
#  ORGANIZATION: 
#       CREATED: 23/07/23 16:40
#      REVISION:  ---
#===============================================================================

lenovo="00:23:24:d5:a7:b7"
pxe_mach="d8:cb:8a:95:a9:78"

wol_sel=$(echo -e "Lenovo\nPXE\n" | rofi -dmenu -p "Wake on LAN")

case $wol_sel in 
    Lenovo) wol "$lenovo";;
    Laptop) wol "$pxe_mach";;
    *) exit
esac
