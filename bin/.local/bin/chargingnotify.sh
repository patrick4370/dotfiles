#!/usr/bin/env bash
#
#  Author: Patrick Heffernan <patrick4370@bigpond.com>
#    Date: 04/June/2024 - 11:55
# Purpose: 
# tifies about battery usage
#
set -euo pipefail


# Check if argument is passed
[ $# != 1 ] && printf '0 or 1 must be passed as an argument.\nUsage: %s 0|1\n' "$0" && exit

export XAUTHORITY=~/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_CHARGING=$1
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

# Send notifications
if [ "$BATTERY_CHARGING" -eq 1 ]; then
    notify-send "Charging" "${BATTERY_LEVEL}% of battery charged." -u low -i "battery-charging" -t 5000 -r 9991
elif [ "$BATTERY_CHARGING" -eq 0 ]; then
    notify-send "Discharging" "${BATTERY_LEVEL}% of battery remaining." -u low -i "battery" -t 5000 -r 9991
fi
