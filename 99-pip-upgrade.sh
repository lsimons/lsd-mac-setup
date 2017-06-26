#!/bin/bash

# upgrade python packages

set -e

function pip_upgrade_outdated() {
  outdated=$(pip list --outdated | cut -f 1 -d ' ')
  if [[ "$outdated" != "" ]]; then
    (pip install --upgrade $outdated) || true
  fi
  echo python libraries up to date for $(pyenv global)
}

current_python=$(pyenv global)

for p in 3.6.1 2.7.13; do
  pyenv global $p
  pip_upgrade_outdated
done

pyenv global $current_python
