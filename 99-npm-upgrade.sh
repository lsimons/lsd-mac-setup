#!/bin/bash

# upgrade ruby packages

current_node=$(nodenv global)

for n in system 6.5.0; do
  nodenv global $n
  npm install -g npm
  npm update -g
done

nodenv global $current_node

nodenv rehash
