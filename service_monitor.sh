#!/bin/bash
# Service monitor for Apache and MQ - For SFMS/IIB monitoring
# Author: Vishwajit Bhikale - C-Edge Prod Support
for svc in httpd mq apache2; do
  if pgrep -x $svc > /dev/null; then
    echo "$(date): $svc is RUNNING"
  else
    echo "$(date): $svc is DOWN - Attempting restart" | tee -a /tmp/service_check.log
    sudo systemctl restart $svc
    if [ $? -eq 0 ]; then
      echo "$(date): $svc restarted successfully" | tee -a /tmp/service_check.log
    else
      echo "$(date): Failed to restart $svc - Escalate to L2" | tee -a /tmp/service_check.log
    fi
  fi
done
# Check MQ channel status (if MQ installed)
# echo "Checking MQ channels..."
# runmqsc QMGR_NAME < check_channel.inp
