#!/bin/bash

# install my bashrc

set -e

tstamp=$(date | sed 's/ //g')

[[ -f ~/.profile ]] && mv ~/.profile ~/.profile.$tstamp
[[ -f ~/.bash_profile ]] && mv ~/.bash_profile ~/.bash_profile.$tstamp
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc.$tstamp

cp .git-prompt.sh ~/.bashrc
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
