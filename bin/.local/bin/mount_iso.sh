#!/usr/bin/env bash
#
#===============================================================================
#
#          FILE: mount_iso.sh 
#
#         USAGE: mount_iso.sh
#
#   DESCRIPTION: Mounts an iso file
#                
#
#  REQUIREMENTS: bash, zenity, udisksctl
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#       CREATED: 13-04-2024 15:24 +1000 
#
#===============================================================================

# Best practice for BASH scripts
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

select_iso=$(zenity --title "ISO Mounter" --width=600 --height=700 )
