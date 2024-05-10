#!/usr/bin/env bash
#
#===============================================================================
#
#          FILE:  
#
#         USAGE: 
#
#   DESCRIPTION: 
#                
#
#  REQUIREMENTS: 
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#       CREATED:  
#
#===============================================================================

# shellcheck disable=SC2034
# Best practice for BASH scripts
set -o errexit   # Abort on nonzero exitstatus
set -o nounset   # Abort on unbound variable
set -o pipefail  # Don't hide errors within pipes
# set -x           # Debug

iso_name="archlinux-x86_64.iso"
hash_name="sha256sums.txt"
iso_url=$(curl --silent https://archlinux.org/download/ | htmlq a --attribute href | grep "aarnet")
remote_file="${iso_url}${iso_name}"
local_file="$HOME/Downloads/archlinux-x86_64.iso"



echo -e "\nDownloading ${iso_url}${iso_name}\n"
echo -e "Please be patient while downloading\n"

curl -L -R -C - "${iso_url}${iso_name}" -o "$HOME/Downloads/${iso_name}" 
curl --silent "${iso_url}${hash_name}" -o "$HOME/Downloads/${hash_name}"

sha256_result=$(awk -v iso_file="$iso_name" '$0~iso_file{print $1}' /home/patrick/Downloads/sha256sums.txt)
cal_sha=$(sha256sum "$HOME/Downloads/archlinux-x86_64.iso" | awk '{print $1}')

if [[ ! "${cal_sha}" == "${sha256_result}" ]]; then
    echo -e "\nHashes do not match ... ABORTING"
    exit 1
else
    echo -e "\nArch ISO downloaded successfully"
    exit 0
fi


