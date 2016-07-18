#!/bin/bash

# install go development tools

set -e

brew install go
brew install protobuf --devel # v3

go get golang.org/x/tools/cmd/stringer
