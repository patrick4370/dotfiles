#Do the backup

restic backup \
       --verbose \
       --one-file-system \
       --tag $BACKUP_TAG \
       --exclude-file="/home/patrick/exclude.txt" \
       $BACKUP_PATHS &

wait $!

# Remove old Backups

restic forget \
       --verbose \
       --tag $BACKUP_TAG \
       --prune \
       --keep-daily $RETENTION_DAYS \
       --keep-weekly $RETENTION_WEEKS \
       --keep-monthly $RETENTION_MONTHS \
       --keep-yearly $RETENTION_YEARS &

wait $!

# Check if everything is fine
restic check &
wait $!

echo "Backup done!"
