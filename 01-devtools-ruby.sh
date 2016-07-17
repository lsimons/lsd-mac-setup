#!/bin/bash

# install ruby development tools

set -e

for r in 1.9.3-p551 2.3.1; do
  rbenv install --skip-existing $r
  rbenv global $r
  gem update --system
  gem install bundler
done
