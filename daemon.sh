#!/bin/sh

# Script to continually update the mirror.
INTERVAL=256

# Generate ssh key pair if necessary.
SSH_KEY=/mirror/.ssh/id_rsa.pub
if ! test -f ${SSH_KEY}; then
  ssh-keygen -N '' -f ${SSH_KEY%.pub}
fi
# Print the public key so we can authorize the container.
cat ${SSH_KEY}

while true; do
  echo [$(date -u)]
  ./update.sh
  sleep ${INTERVAL}
done
