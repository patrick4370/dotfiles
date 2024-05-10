#!/usr/bin/env bash
#
#===============================================================================
#
#          FILE: get_arch_iso.sh 
#
#         USAGE: get_arch_iso.sh
#
#   DESCRIPTION: Downloads arch iso and checks the
#                checksum is correct
#                
#
#  REQUIREMENTS: 
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#       CREATED: 07-04-2024 11:00 +1000 
#
#===============================================================================

# shellcheck disable=all
 
# Best practice for BASH scripts
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

# Ansi color code variables
red="\e[0;91m"
green="\e[0;92m"
white="\e[0;97m"
reset="\e[0m"

clear

# Change to download directory
pushd ~/Downloads/ &> /dev/null

# Variables to do with obtaining the arch iso.

iso_name="archlinux-x86_64.iso"
arch_url="https://archlinux.org/download/"
chksums_sha256="sha256sums.txt"

# Obtain the index.html file that contains the release date
wget "${arch_url}" -q 

# Scrub index.html to assign release date to a variable
release_date=$(grep -w "Current Release:" index.html | sed -e 's/<\/b>/-/g' -e 's/<[^>]*>//g' | awk -F: '{ print $2 }' | xargs)

# The url to download the sha256sums.txt file
sha256sums_url="https://syd.mirror.rackspace.com/archlinux/iso/${release_date}/${chksums_sha256}"

# Download the sha256sums.txt file
wget "${sha256sums_url}" -q --no-use-server-timestamps

# Assign checksum from sha256sums.txt to a variable
chk_sha256=$(awk '/archlinux-x86_64.iso/ {print $1}' sha256sums.txt)

# Download the arch iso
echo
echo -e "${white}----- ${red}Retrieving ${green}${iso_name} ${white}-----${reset}"
echo
wget -O "${iso_name}" "https://syd.mirror.rackspace.com/archlinux/iso/${release_date}/${iso_name}" -q --show-progress --no-use-server-timestamps

# Compare checksums. Exit if wrong and echo a message.
[[ "$(sha256sum "${iso_name}" | awk '{ print $1 }')" == "${chk_sha256}" ]] && echo -e "${green}Success!\n" || echo -e "${red}Checksum doesn't match. Try downloading again${reset}\n"; exit 2

# grep --color=never -w "Current Release:" index.html | sed -e 's/<\/b>/-/g' -e 's/<[^>]*>//g' | awk -F: '{ print $2 }' | xargs > this_release_date.txt
rm "${chksums_sha256}" &> /dev/null 
rm index.html
popd &> /dev/null
