#!/bin/bash

# install python development tools

set -e

for p in 3.5.2 2.7.12; do
  pyenv install --skip-existing $p
  pyenv global $p
  pip install --upgrade pip
  pip install --upgrade virtualenv
done
