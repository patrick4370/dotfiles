#!/usr/bin/env bash

subject=$1
msgid=$2
title="Arch News: $(date +%d/%m/%Y)"

function read_action
{
    /usr/bin/betterbird mid:"${msgid}" 
    
}

ACTION=$(dunstify --action="Default,read_action" --urgency critical "Message: ${title}" "Subject: ${subject}") 

case "$ACTION" in
    "Default")
        read_action
        ;;
esac

exec $SHELL
