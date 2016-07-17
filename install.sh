#!/bin/bash

# runs all the install scripts in this directory

source .bashrc

set -e

for i in `ls *.sh | sort`; do
  if [[ $i != install.sh ]]; then
    echo ======================================================================
    echo $i | sed 's/\.sh//' | awk '{print toupper($0)}'
    echo ======================================================================
    ./$i
  fi
done

echo
echo ======================================================================
echo "remember to source ~/.bashrc if anything changed"

echo
echo ======================================================================
echo "INSTALL DONE IN $SECONDS SECONDS"
