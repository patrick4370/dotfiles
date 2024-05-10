#!/usr/bin/bash

download_arch() {
   rm ~/Downloads/b2sums.txt    

}

help_me() {
    echo -e "\nUsage: $(basename "$0") chksum_file filename\n"
    exit 2
}

usage() {
    echo -e "\nIncorrect number of commandline arguments!"
    echo -e "Usage: $(basename "$0") chksum_file filename\n"
    exit 2
}

while getopts ":h" HELP_ME; do
    case "$HELP_ME" in 
        h)
            help_me
            ;;
        \?)
            echo -e "\nError: Invalid option was specified -$OPTARG"
            help_me
            exit 1
            ;;
    esac
done
shift

chksum="$(cat "$1" 2>/dev/null | awk '/archlinux-x86_64.iso/ {print $1}')"
filename="$2"


if [[ "$#" -ne 2 ]]; then
    usage
fi



[ "$chksum" = "$(b2sum "$filename" | awk '{print $1}')" ] && echo "Checksum correct"|| echo "Checksum incorrect"
