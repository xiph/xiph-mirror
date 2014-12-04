#!/bin/sh

# Make checkouts of the repositories we'd like to mirror

ORIGIN=$(cat ORIGIN)

while read repo; do
  line=($repo)
  name=${line[0]}
  dir=$(dirname ${name})
  if test ! -z ${dir} -a ! -d ${dir}; then
    mkdir ${dir}
  fi
  if test ! -z ${dir}; then
    olddir=$PWD
    cd ${dir}
    test -d $(basename ${name}.git) || git clone --mirror ${ORIGIN}${name}.git || exit
    cd ${olddir}
  fi
done < REPOS
