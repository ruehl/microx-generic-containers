#!/bin/bash
set -euo pipefail

# Install a list of packages given as arguments to this script
# Usage: ./install-packages.sh <list of packages to install>
# Example: ./install-packages.sh "git curl wget"

# Check that at least one package is given
if [ "$#" -lt 1 ]; then
    echo "Usage: ./install-packages.sh <list of packages to install>"
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade
apt-get -y install --no-install-recommends "$@"
apt-get clean
rm -rf /var/lib/apt/lists/* /var/cache/debconf/*-old /var/cache/debconf/templates.dat*