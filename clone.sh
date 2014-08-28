#!/bin/sh

# Make checkouts of the repositories we'd like to mirror

ORIGIN=$(cat ORIGIN)

for repo in $(cat REPOS); do
  git clone --mirror ${ORIGIN}${repo}.git || exit
done
