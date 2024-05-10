#!/usr/bin/env bash
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

pushd "$HOME" || exit

if grep -sq '/run/media/patrick/Backup' /proc/mounts; then
    rsync -zhavp --delete --safe-links --files-from=home.txt . /run/media/patrick/Backup/Dell
    dunstify "Success" "Backup completed at $(date +"%d/%m/%Y %H:%M")" -u critical
else
    dunstify "Failure" "/run/media/patrick/Backup is not mounted" -u critical
    exit 1
fi

popd || exit
