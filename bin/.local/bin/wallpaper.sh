#!/usr/bin/env bash
#
#  Author: Patrick Heffernan <patrick4370@bigpond.com>
#    Date: 02/June/2024 - 13:58
# Purpose: Script for changing wallpaper with systemd timer
#
set -euo pipefail

export DISPLAY=:0.0
feh --bg-fill --randomize ~/Pictures/wallpapers/
