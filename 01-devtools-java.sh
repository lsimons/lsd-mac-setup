#!/bin/bash

# install java development tools

set -e

brew tap homebrew/versions
brew tap caskroom/versions

brew cask install java jce-unlimited-strength-policy

brew cask install Caskroom/versions/java7
brew cask install ./jce-unlimited-strength-policy7.rb

brew cask install Caskroom/versions/java6
brew cask install ./jce-unlimited-strength-policy6.rb

ensure_tools_jar() {
  local java_home=$1
  owd=$PWD
  cd $java_home/lib;
  if [[ ! -f tools.jar ]]; then
    if [[ -f ../../Classes/classes.jar ]]; then
      sudo ln -s ../../Classes/classes.jar tools.jar
    else
      echo "WARNING: no tools.jar in $java_home and don't know where it is"
    fi
  fi

  # maven expectations
  cd $java_home/..
  if [[ ! -d lib ]]; then
    sudo mkdir lib
  fi
  if [[ ! -f lib/tools.jar ]]; then
    if [[ -f $java_home/lib/tools.jar ]]; then
      sudo ln -s $java_home/lib/tools.jar lib/tools.jar
    else
      echo "WARNING: no tools.jar in $java_home/../lib maven could freak"
      echo "  see http://maven.apache.org/general.html#tools-jar-dependency"
    fi
  fi

  cd $PWD
}

for v in 1.6 1.7 1.8; do
  java_home=$(/usr/libexec/java_home -v $v)
  ensure_tools_jar $java_home
  if [[ "$(jenv versions | grep $v)" == "" ]]; then
    jenv add $java_home
  fi
done

jenv global 1.8

brew install ant maven gradle

brew unlink maven
brew install maven32
brew link maven32
