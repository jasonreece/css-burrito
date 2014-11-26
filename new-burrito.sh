#! /bin/bash

source css-burrito/.functions

if [ $# -eq 0 ] ; then
  make-burrito
  ascii-burrito
else
  check-for-hologram "$@"
fi
