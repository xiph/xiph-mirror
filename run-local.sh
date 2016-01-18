#!/bin/sh

while true; do
  echo "-- $(date -u) --"
  ./update.sh
  sleep 1000
done
