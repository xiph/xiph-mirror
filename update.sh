#!/bin/bash

# Update checkouts and push changes to our remote.

REMOTES=$(cat REMOTES)

while read repo
do
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
      for remote in ${REMOTES}; do \
        git push --mirror ${remote}${destname}.git; \
      done
    ) || exit
done < REPOS
