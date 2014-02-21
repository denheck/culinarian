#!/bin/bash

# where chef-solo should be located
chef_binary=/usr/bin/chef-solo

# check if chef-solo is installed
if ! test -f "$chef_binary"; then
  sudo apt-get -y install curl
  curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi &&

"$chef_binary" -c solo.rb -j solo.json
