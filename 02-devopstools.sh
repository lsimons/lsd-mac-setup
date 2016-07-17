#!/bin/bash

# install automation tools

set -e

brew cask install chefdk
brew cask install virtualbox

brew cask install vagrant

for p in vagrant-cachier vagrant-omnibus vagrant-berkshelf vagrant-cloudstack vagrant-chef-zero; do
  exists=$(vagrant plugin list | grep $p)
  if [[ "$exists" == "" ]]; then
    vagrant plugin install $p
  fi
done

brew cask install docker
