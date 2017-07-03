#!/bin/bash

# install automation tools

set -e

brew cask install chefdk
brew cask install virtualbox

brew cask install vagrant

# if plugin install is failing....perhaps something like...
# sudo /opt/vagrant/embedded/bin/update_rubygems
# sudo /opt/vagrant/embedded/bin/gem install pkg-config -v "~> 1.1.7"
# sudo /opt/vagrant/embedded/bin/gem install nokogiri -v '1.8.0' -- --use-system-libraries
# /opt/vagrant/embedded/bin/gem install nokogiri -v '1.8.0' --install-dir ~/.vagrant.d/gems -- --use-system-libraries
# /opt/vagrant/embedded/bin/gem install nokogiri -v '1.8.0' --install-dir ~/.vagrant.d/gems/2.2.5 -- --use-system-libraries

for p in vagrant-cachier vagrant-omnibus vagrant-berkshelf vagrant-cloudstack vagrant-chef-zero vagrant-winrm; do
  if [[ "$(vagrant plugin list | grep $p)" == "" ]]; then
    vagrant plugin install $p
  fi
done

brew cask install docker
