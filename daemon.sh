#!/bin/sh

# Script to continually update the mirror.
INTERVAL=256

while true; do
  echo [$(date -u)]
  ./update.sh
  sleep ${INTERVAL}
done
