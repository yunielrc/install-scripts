#!/usr/bin/env bash

set -euEo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "cd ${WORKDIR}" >> "/home/${USER_NAME}/.bashrc"

# APT cache proxy
[[ -n "${APT_PROXY:-}" ]] && echo "${APT_PROXY:-}" | sudo tee /etc/apt/apt.conf.d/00proxy

sudo -s <<EOF
# System update
apt-get update -y
apt-get upgrade -y

# Install
apt-get install -y tzdata wget file sudo xz-utils uuid-runtime gnupg tzdata 9base unzip curl
ln -s --force /usr/share/zoneinfo/America/Havana /etc/localtime

# APT clean
apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*

# User
if ! getent passwd | grep --quiet "$USER_NAME" ; then
  useradd --create-home --shell /bin/bash "$USER_NAME"
  usermod -aG sudo "$USER_NAME"
  echo "${USER} ALL=NOPASSWD:ALL" > /etc/sudoers.d/nopasswd
fi

echo 'XKBMODEL="pc105"\nXKBLAYOUT="us"\nXKBVARIANT="alt-intl"\nBACKSPACE="guess"' > /etc/default/keyboard
EOF

