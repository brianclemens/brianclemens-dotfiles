#!/bin/bash

## List all manually installed packages on a debian/ubuntu system
## manually installed means:
##   1. not pre-installed with the system
##   2. not marked auto-installed by apt (not dependencies of other
##      packages)
## Note: pre-installed packages that got updated still needs to be
##   filtered out.

parse_dpkg_log() {
  {
    for FN in `ls -1 /var/log/dpkg.log*` ; do
      CMD="cat"
      [ ${FN##*.} == "gz" ] && CMD="zcat"
      $CMD $FN | egrep "[0-9] install" | awk '{print $4}' \
        | awk -F":" '{print $1}'
    done
  } | sort | uniq
}

## all packages installed with apt-get/aptitude
list_installed=$(parse_dpkg_log)
## packages that were not marked as auto installed
list_manual=$(apt-mark showmanual | sort)

## output intersection of 2 lists
comm -12 <(echo "$list_installed") <(echo "$list_manual")
