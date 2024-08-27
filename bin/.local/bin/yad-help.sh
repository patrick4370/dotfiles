#!/usr/bin/env bash
#
#  Author: Patrick Heffernan <patrick4370@bigpond.com>
#    Date: 02/June/2024 - 13:58
# Purpose: Help file for i3wm
#
set -euo pipefail

yad --form --columns=2 --image="${HOME}"/Downloads/ruralit.png --no-buttons \
    --field="13wm Keys!keyboard!":FBTN "yad --text-info --theme="Cobalt" --filename=${HOME}/.local/share/rofi/keys.txt --button=Close:0 --width=890 --height=600" \
    --field="Arch Maintenance!help-faq!":FBTN "yad --text-info --theme="Cobalt" --filename=${HOME}/.local/share/rofi/maintain.txt --button=Close:0 --width=890 --height=600" \
    --field="Pacman Commands!system-run!":FBTN "yad --text-info --theme="Cobalt" --filename=${HOME}/.local/share/rofi/pacman.txt --button=Close:0 --width=1250 --height=600" \
    --field="Zathura Keys!keyboard!":FBTN "yad --text-info --theme="Cobalt" --filename=${HOME}/.local/share/rofi/zathura.txt --button=Close:0 --width=1350 --height=600"




