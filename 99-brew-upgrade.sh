#!/bin/bash

# upgrade homebrew stuff to latest

set -e

brew update
brew upgrade
brew upgrade
brew cask cleanup
