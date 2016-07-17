#!/bin/bash

# upgrade ruby packages

set -e

current_ruby=$(rbenv global)

for r in 1.9.3-p551 2.3.1; do
  rbenv global $r
  gem update --system
  gem update
done

rbenv global $current_ruby

rbenv rehash
