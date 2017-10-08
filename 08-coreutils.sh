#!/bin/bash

# install homebrew version of core tools that are better or more up-to-date

set -e

# environment management
brew install bash-completion direnv pyenv jenv rbenv nodenv ruby-build

# key libraries used by other brew stuff
brew install gettext libnet libtool libxml2 libxslt libyaml openssl readline

# gnu tar is expected by some chef utilities
brew install gnu-tar
[[ -f /usr/local/bin/tar ]] || \
    ln -s /usr/local/opt/gnu-tar/libexec/gnubin/tar /usr/local/bin/tar

# some core command line tools
brew install tcptraceroute watch wget curl
