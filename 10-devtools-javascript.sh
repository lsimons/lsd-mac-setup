#!/bin/bash

# install javascript development tools

set -e

brew install node phantomjs

current_node=$(nodenv global)

for n in system 6.5.0; do
  nodenv global $n
  npm install --global gulp-cli grunt-cli bower typescript tslint
done

nodenv global $current_node

nodenv rehash
