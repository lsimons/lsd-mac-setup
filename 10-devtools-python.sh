#!/bin/bash

# install python development tools

set -e

for p in 3.6.1 2.7.13; do
  pyenv install --skip-existing $p
  pyenv global $p
  pip install --upgrade pip
  pip install --upgrade virtualenv
done
