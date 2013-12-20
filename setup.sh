#!/bin/bash
 
if [ ! -e ~/.css-burrito-aliases ];
then
  echo "source ~/.css-burrito-aliases" >> ~/.bash_profile
  echo "alias burrito='./burrito.sh'" > ~/.css-burrito-aliases
fi