#!/bin/bash

# tune homebrew

brew analytics off
brew doctor
brew update

brew install caskroom/cask/brew-cask

brew tap homebrew/versions
brew tap caskroom/versions
