#!/bin/sh

# Update checkouts and push changes to our remote.

REMOTE=$(cat REMOTE)

while read repo; do
    info=($repo)
    oname=${info[0]}
    rname=${info[0]}
    if [ ${#info[@]} -gt 1 ]; then
        rname=${info[1]}
    fi
    if [ "$oname" = "$rname" ]; then
        echo Pushing ${oname}...
    else
        echo Pushing ${oname} as ${rname}...
    fi
    $(cd ${oname}.git && git fetch && git push --mirror ${REMOTE}${rname}.git) || exit
done < REPOS
