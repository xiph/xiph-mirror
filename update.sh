#!/bin/bash

# Update checkouts and push changes to our remote.

REMOTE=$(cat REMOTE)

while read repo; do
    info=($repo)
    srcname=${info[0]}
    destname=${info[0]}
    if [ ${#info[@]} -gt 1 ]; then
        destname=${info[1]}
    fi
    if [ "$srcname" = "$destname" ]; then
        echo Updating ${srcname}...
    else
        echo Updating ${srcname} as ${destname}...
    fi
    $(cd ${srcname}.git && git fetch && \
      git push --mirror ${REMOTE}${destname}.git) || exit
done < REPOS
