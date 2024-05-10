#!/usr/bin/env bash
#===============================================================================
#
#          FILE: rofi-edit.sh
#
#         USAGE: ./rofi-edit.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#  ORGANIZATION: Your Dog Needs a Coat
#       CREATED: 13/06/22 16:49:36
#      REVISION:  ---
#===============================================================================

myTerm=/usr/bin/alacritty
myEditor=nvim

menu() {
    printf "1. BASH Configuration File\n"
    printf "2. Vim Configuration File\n"
    printf "3. Alacritty Configuration File\n"
    printf "4. i3wm Configuration File\n"
    printf "5. Rofi Configuration File\n"
}

main() {
    choice=$(menu | rofi -dmenu -p "Edit File" -l 5 -mesg "Select file to edit" -i | cut -d. -f1)

    case $choice in 
        1) 
            $myTerm -e $myEditor ~/.bashrc
            ;;

        2) 
            $myTerm -e $myEditor ~/.vimrc 
            ;;
        3)
            $myTerm -e $myEditor ~/.config/alacritty/alacritty.yml 
            ;;
        4) 
            $myTerm -e $myEditor ~/.config/i3/config 
            ;;
        5)
            $myTerm -e $myEditor ~/.config/rofi/config.rasi 
            ;;
    esac
}

main
