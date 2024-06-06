#!/usr/bin/env bash
#
#  Author: Patrick Heffernan <patrick4370@bigpond.com>
#    Date: 02/June/2024 - 13:59
# Purpose: Wake on Lan
#
set -euo pipefail

lenovo="00:23:24:d5:a7:b7"
pxe_mach="d8:cb:8a:95:a9:78"

wol_sel=$(echo -e "Lenovo\nPXE\n" | rofi -dmenu -p "Wake on LAN")

case $wol_sel in 
    Lenovo) wol "$lenovo";;
    Laptop) wol "$pxe_mach";;
    *) exit
esac
