#!/bin/bash

echo ""
echo "##################"
echo "Installing Nodejs"
echo "##################"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt install nodejs -y