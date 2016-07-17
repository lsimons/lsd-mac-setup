#!/bin/bash

# installs a base template-able knife.rb

set -e

[[ ! -d ~/.chef ]] && mkdir ~/.chef

if [[ ! -f ~/.chef/knife.rb ]]; then
  cp knife.rb.tmpl ~/.chef/knife.rb
  chmod 500 ~/.chef/knife.rb
  echo
  echo ======================================================================
  echo "remember to update ~/.chef/knife.rb for your organization"
fi
