#!/usr/bin/env bash
#
# Script to perform an automated backup of my home directory to an
# rsync server
#
BACKUP_SERVER=pi@192.168.10.3:

/usr/bin/rsync -avz -e "ssh -i \"$HOME/.ssh/pxe_backup_key\"" --delete-excluded --exclude-from /home/patrick/backup/exclude /home/patrick/ $BACKUP_SERVER
