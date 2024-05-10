#!/usr/bin/env bash
#===============================================================================
#
#          FILE: logout.sh
#
#         USAGE: ./logout.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#  ORGANIZATION: Your Dog Needs a Coat
#       CREATED: 13/07/22 16:10:08
#      REVISION:  ---
#===============================================================================

#! /bin/bash

action=$(yad --width 500 --entry --text "System Logout" \
    --image="gtk-preferences" \
    --button="Ok:0" --button="Quit:1" \
    --entry-text \
    "Power Off" "Reboot" "Suspend" "Hybernate" "Logout")
ret=$?

[[ $ret -eq 1 ]] && exit 0

case $action in
    Power*) cmd="systemctl poweroff" ;;
    Reboot*) cmd="systemctl reboot" ;;
    Suspend*) cmd="sudo /bin/sh -c 'echo disk > /sys/power/state'" ;;
    Hybernate*) cmd="" ;;
    Logout*) 
    case $(wmctrl -m | grep Name) in
        *Openbox) cmd="openbox --exit" ;;
        *FVWM) cmd="FvwmCommand Quit" ;;
        *Metacity) cmd="gnome-save-session --kill" ;; 
		*i3) cmd="i3-msg exit" ;;
        *) exit 1 ;;
    esac
    ;;
    *) exit 1 ;;    
esac

eval exec $cmd
