#!/bin/bash
# Disk alert >80% - Production monitoring for BaNCS24 servers
# Author: Vishwajit Bhikale - Used in C-Edge RHEL prod support
THRESHOLD=80
HOST=$(hostname)
DATE=$(date)
df -h | awk 'NR>1 {print $5, $6}' | while read usage mount; do
  use=$(echo $usage | cut -d'%' -f1)
  if [ $use -ge $THRESHOLD ]; then
    echo "ALERT: Disk $mount is $usage full on $HOST at $DATE" | logger -t DISK_ALERT
    echo "ALERT: $mount is $usage full on $HOST"
  fi
done
