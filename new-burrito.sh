#! /bin/bash

source .functions

if [ $# -eq 0 ] ; then
  make-burrito
  ascii-burrito
else
  local OPTIND
  while getopts ":hH" opt; do
    case $opt in
      h)
        make-burrito
        hologram-base stylesheets/core/_base.scss
        ascii-burrito
        ;;
      H)
        make-burrito
        hologram-base stylesheets/core/_base.scss
        ascii-burrito
        ;;
      \?)
        ascii-oops
        echo "Invalid option: -$OPTARG"
        echo "You can create a new project with burrito-new"
        echo "Or you can add a new project with Hologram documentation by running burrito-new -h"
        ;;
    esac
  done
fi
