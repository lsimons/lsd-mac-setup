#!/bin/bash

# install python development tools

set -e

for p in 3.6.3 2.7.14; do
  pyenv install --skip-existing $p
  pyenv global $p
  pip install --upgrade pip
  pip install --upgrade virtualenv
done
