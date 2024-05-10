#!/usr/bin/env bash
#===============================================================================
#
#          FILE: nfs.sh
#
#         USAGE: ./nfs.sh
#
#   DESCRIPTION: 
#
#       OPTIONS:  
#  REQUIREMENTS:  
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 27/04/23 13:56
#===============================================================================

# set -o nounset        # Treat unset variables as an error

# mounts="($(showmount -e pxe | awk -F"/" '(NR>1) {print $3}' | awk '{print $1}' | yad --width=400 --height=300 --form --field="NFS":CB "${mounts[1]}!${mounts[2]}!${mounts[3]}"))" 
#| yad --width=400 --height=300 --title='NFS Mount Selector')" 


array=($(showmount -e pxe | awk -F"/" '(NR>1) {print $3}' | awk '{print $1}')) 
choice=$(yad --width=400 --height=200 --text="NFS Mount Selector" --form --field="NFS:CB" $(IFS=!;echo "${array[*]}") | cut -d"|" -f1)
printf "%s\n" "$choice"
