#!/usr/bin/env bash
#===============================================================================
#
#          FILE: txtdoc.sh
#
#         USAGE: ./txtdoc.sh
#
#   DESCRIPTION: 
#
#       OPTIONS:  
#  REQUIREMENTS:  
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 13/09/22 13:50
#===============================================================================

# set -o nounset        # Treat unset variables as an error
# texdoc replacement working with tllocalmgr installdoc

if [ $# -ne 1 ]; then
    echo "usage: $(basename "$0") package_name"
    exit 1
fi

pdf=$(find /usr/local/share/texmf/doc -name "$1.pdf")
if [ -z "$pdf" ]; then
    while true; do

        echo "Documentation for package $1 not found."
        read -rp "Do you want to try to install it with tllocalmgr (y/n): " yn

        case $yn in 
            [yY] )
                tllocalmgr installdoc "$1"
                break;;
            [nN] )
                exit;;
            * )
                echo invalid response;;
        esac

    done
fi

pdf=$(find /usr/local/share/texmf/doc -name "$1.pdf")
if [ -z "$pdf" ]; then
    echo "Documentation for package $1 not found."
    exit 1
else
    xdg-open "$pdf"
fi
