#!/bin/bash

# install java development tools

set -e

brew cask install java jce-unlimited-strength-policy

brew cask install Caskroom/versions/java7
brew cask install ./jce-unlimited-strength-policy7.rb

brew cask install Caskroom/versions/java6
brew cask install ./jce-unlimited-strength-policy6.rb


for v in 1.6 1.7 1.8; do
  if [[ "$(jenv versions | grep $v)" == "" ]]; then
    java_home=$(/usr/libexec/java_home -v $v)
    jenv add $java_home
  fi
done

jenv global 1.8

brew install ant maven gradle

brew unlink maven
brew install maven32
brew link maven32
