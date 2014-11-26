#! /bin/bash

source "./.functions"

if [ $# -eq 0 ] ; then
  make-burrito
  ascii-burrito
else
  check-for-hologram "$@"
fi
