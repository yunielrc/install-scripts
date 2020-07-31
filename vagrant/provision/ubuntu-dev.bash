#!/usr/bin/env bash

set -euEo pipefail

export DEBIAN_FRONTEND=noninteractive
echo "export LIBS=/usr/local/lib" >> "/home/${USER_NAME}/.bashrc"

sudo -s <<EOF
apt-get update -y
apt-get install -y git shellcheck build-essential

cd /tmp/
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local
cd /tmp/
rm -r /tmp/bats-core
git clone https://github.com/bats-core/bats-assert.git /usr/local/lib/bats-assert
git clone https://github.com/bats-core/bats-support.git /usr/local/lib/bats-support

# APT clean
apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*
EOF

