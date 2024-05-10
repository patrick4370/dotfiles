#!/usr/bin/env bash
#===============================================================================
#
#          FILE: dunst_update.sh
#
#         USAGE: Usually run with a systemd user timer and service file
#
#   DESCRIPTION: Checks updates including AUR and sends dunst notification with
#                option to perform update using dunst action.
#
#  REQUIREMENTS: pacman-contrib pikaur suitable systemd timer and service file
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#       CREATED: 17/07/22 08:20:28
#===============================================================================

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: handle_dismiss
#   DESCRIPTION: Used to exit the script     
#    PARAMETERS: None 
#       RETURNS: None 
#-------------------------------------------------------------------------------
handle_dismiss()
{
    unset -v pac_num
    unset -v aur_num
    exit 
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: update_action
#   DESCRIPTION: Starts a terminal and executes pacman update 
#    PARAMETERS: None 
#       RETURNS: None 
#-------------------------------------------------------------------------------
update_action()
{
    alacritty --class pikaur -e /usr/bin/pikaur -Syu
}

#-------------------------------------------------------------------------------
# Start of script 
#-------------------------------------------------------------------------------

pac_num=$(checkupdates 2>/dev/null | wc -l) 
aur_num=$(pikaur -Qua 2>/dev/null | wc -l)

if [ "${pac_num}" -gt 0 ] || [ "${aur_num}" -gt 0 ]; then

    ACTION=$(dunstify --appname="Updater" --urgency=critical --icon=~/.local/share/icons/dunst/arch_icon.png \
           --replace=123456 --action="Update,update_action" "System Updates" "\(Pacman\): $pac_num   \(AUR\): $aur_num")

    case "$ACTION" in
        "Update")
            update_action        
            ;;
        "2")
            handle_dismiss
            ;;
    esac
else
    handle_dismiss
fi
