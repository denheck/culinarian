#!/bin/bash

# Usage: ./deploy.sh [user@host]

host="$1"

if [ -z "$host" ]; then
  echo "user@host must be passed as first argument to script"
  exit 1
fi

# remove old host key from known_hosts
ssh-keygen -R "${host#*@}" 2> /dev/null

# package and deploy contents of chef-solo to host
tar cj . | ssh -o 'StrictHostKeyChecking no' "$host" '
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash install.sh'
