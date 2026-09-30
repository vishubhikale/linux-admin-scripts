#!/bin/bash
# EOD log cleanup - Deletes logs older than 7 days - Used for BaNCS24 app logs
# Author: Vishwajit Bhikale
LOG_DIR="/var/log/app_logs"
RETENTION=7
echo "Starting log cleanup at $(date) for $LOG_DIR older than $RETENTION days"
find $LOG_DIR -type f -name "*.log" -mtime +$RETENTION -exec rm -f {} \;
echo "Cleanup completed at $(date)" | tee -a /tmp/cleanup.log
df -h $LOG_DIR
