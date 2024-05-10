#!/usr/bin/env bash
#
#===============================================================================
#
#          FILE: yad-help.sh 
#
#         USAGE: Summonded by hot keys
#
#   DESCRIPTION: Yad help system
#                
#
#  REQUIREMENTS: yad, bash
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#       CREATED: 15-04-2024 13:25 +1000 
#
#===============================================================================

# Best practice for BASH scripts
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

yad --form --columns=2 --image=$HOME/Downloads/ruralit.png --no-buttons \
    --field="13wm Keys!keyboard!":FBTN "yad --text-info --filename="${HOME}/.local/share/rofi/keys.txt" --button=Close:0 --width=890 --height=600" \
    --field="Arch Maintenance!help-faq!":FBTN "yad --text-info --filename="${HOME}/.local/share/rofi/maintain.txt" --button=Close:0 --width=890 --height=600" \
    --field="Pacman Commands!system-run!":FBTN "yad --text-info --filename="${HOME}/.local/share/rofi/pacman.txt" --button=Close:0 --width=1250 --height=600" \
    --field="Zathura Keys!keyboard!":FBTN "yad --text-info --filename="${HOME}/.local/share/rofi/zathura.txt" --button=Close:0 --width=1350 --height=600"




