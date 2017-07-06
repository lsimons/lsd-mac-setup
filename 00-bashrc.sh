#!/bin/bash

# install my bashrc

set -e

tstamp=$(date | sed 's/ //g')
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

[[ -f ~/.profile ]] && mv ~/.profile ~/.profile.$tstamp
[[ -f ~/.bash_profile ]] && mv ~/.bash_profile ~/.bash_profile.$tstamp
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc.$tstamp

cp .git-prompt.sh ~/.git-prompt.sh
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile

cat >> ~/.bashrc <<END
export PATH="${DIR}/bin:\${PATH}"
END
