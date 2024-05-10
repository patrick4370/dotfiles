#!/usr/bin/env bash
#===============================================================================
#
#          FILE: filestats.sh
#
#         USAGE: ./filestats.sh
#
#   DESCRIPTION: Shows number of filetypes in directory according to what is
#                returned by file.
#
#       OPTIONS: <path> 
#  REQUIREMENTS: 
#        AUTHOR: Patrick Heffernan (), <patrick4370@bigpond.com>
#       CREATED: 02/08/22 08:49
#===============================================================================

RESTORE='\e[0m'

RED='\e[00;31m'
GREEN='\e[00;32m'
YELLOW='\e[00;33m'
BLUE='\e[00;34m'
PURPLE='\e[00;35m'
CYAN='\e[00;36m'
LIGHTGRAY='\e[00;37m'

LRED='\e[01;31m'
LGREEN='\e[01;32m'
LYELLOW='\e[01;33m'
LBLUE='\e[01;34m'
LPURPLE='\e[01;35m'
LCYAN='\e[01;36m'
WHITE='\e[01;37m'

if [ $# -ne 1 ];
then
    echo "Usage: ${0##*/} basepath";
    exit
fi

path=$1

declare -A filestats

while read line
do
    ftype=$(file --brief --mime-type "$line")
    let filestats["$ftype"]++ 2>/dev/null
done <<< "$(find $path -type f -print)"

echo -e "\n${LGREEN}=============== ${WHITE}File Types and Counts ${LGREEN}===============${RESTORE}\n"
for ftype in "${!filestats[@]}";
do
    echo -e "${YELLOW}${ftype}${LPURPLE}: ${LRED}${filestats["$ftype"]}${RESTORE}"
done

echo -e "\n"
