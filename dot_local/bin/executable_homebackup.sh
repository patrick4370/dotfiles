#!/bin/bash
#===============================================================================
#
#          FILE: homebackup.sh
#
#         USAGE: ./homebackup.sh
#
#   DESCRIPTION: 
#
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 21/05/23 11:43
#===============================================================================

pushd $HOME

if grep -sq '/run/media/patrick/D923-4A19' /proc/mounts; then
    rsync -zhavp --delete --safe-links --files-from=home.txt . /run/media/patrick/D923-4A19/Dell
    dunstify "Success" "Backup completed at $(date +"%d/%m/%Y %H:%M")" -u critical
else
    dunstify "Failure" "/run/media/patrick/D923-4A19 is not mounted" -u critical
    exit 1
fi

popd
