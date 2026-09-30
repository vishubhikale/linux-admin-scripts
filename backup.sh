#!/bin/bash
# Daily backup for application configs - Used before IIB BAR deployment / EOD
# Author: Vishwajit Bhikale
SRC="/opt/bancs24/config"
DEST="/backup/$(date +%F)"
mkdir -p $DEST
echo "Backing up $SRC to $DEST at $(date)"
tar -czf $DEST/config_backup_$(date +%F).tar.gz $SRC
if [ $? -eq 0 ]; then
  echo "Backup successful: $DEST/config_backup_$(date +%F).tar.gz"
  ls -lh $DEST/
else
  echo "Backup failed at $(date)"
  exit 1
fi
# Cleanup old backups >15 days
find /backup -type f -name "*.tar.gz" -mtime +15 -delete
echo "Old backups cleaned. Current backups:"
ls -lh /backup/ -R | tail -20
