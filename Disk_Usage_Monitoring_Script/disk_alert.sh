#!/bin/bash

THRESHOLD=80
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "ALERT: Disk usage is above ${THRESHOLD}% - Currently at ${USAGE}%"
else
  echo "Disk usage is normal: ${USAGE}%"
fi
