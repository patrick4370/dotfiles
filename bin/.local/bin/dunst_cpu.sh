#!/usr/bin/env bash
#===============================================================================
#
#          FILE: dunst_cpu.sh
#
#         USAGE: ./dunst_cpu.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#  ORGANIZATION: Your Dog Needs a Coat
#       CREATED: 17/07/22 14:56:24
#      REVISION:  ---
#===============================================================================

cpu_heat=$(sensors | grep -A1 "Core 1" | awk '{print $3}')

[[ -z ${cpu_heat} ]] && exit

int="$(sensors | grep -A1 "Core 1" | awk '{print $3}')" | awk '{ print substr( $0, 1, length($0)-4 ) }' | awk '{ print substr( $0, 2 ) }'

if [[ ${int} -gt 70 ]]; then
    dunstify --icon=~/.local/bin/dunst_cpu.sh -u critical "CPU Alert" "Temperature: ${cpu_heat}"
fi

exit
