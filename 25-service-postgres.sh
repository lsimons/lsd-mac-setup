#!/bin/bash

# install mysql

set -e

brew install postgresql

brew services start postgresql
