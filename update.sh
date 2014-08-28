#!/bin/sh

# Update checkouts and push changes to our remote.

REMOTE=$(cat REMOTE)

for repo in $(cat REPOS); do
  echo ${repo}...
  $(cd ${repo}.git && git fetch && git push --mirror ${REMOTE}${repo}.git) || exit
  #cd ${repo}.git
  #git fetch
  #git push --mirror ${REMOTE}${repo}.git
  #cd ..
done
