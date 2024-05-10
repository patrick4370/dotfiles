#!/usr/bin/env bash

menu() 
{
    printf "1. i3wm Keys\n"
    printf "2. Arch Maintenance\n"
    printf "3. Pacman Commands\n"
    printf "4. Zathura Key Bindings\n"
}

main() 
{
    choice=$(menu | rofi -theme-str 'window {width: 20%;}' -dmenu -p "❓ System Help" -l 5 -i | cut -d. -f1)

    case $choice in
        1)
            yad --text-info --filename="$HOME/.local/share/rofi/keys.txt" --button=Close:0 --width=890 --height=600
            ;;

        2)
            yad --text-info --filename="$HOME/.local/share/rofi/maintain.txt" --button=Close:0 --width=890 --height=600
            ;;

        3)
            yad --text-info --filename="$HOME/.local/share/rofi/pacman.txt" --button=Close:0 --width=1250 --height=600
            ;;

        4)  
            yad --text-info --filename="/home/patrick/.local/share/rofi/zathura.txt" --button=Close:0 --width=1350 --height=600
            ;;
    esac
}

main
