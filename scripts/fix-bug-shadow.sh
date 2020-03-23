#!/bin/bash

echo ""
echo "##################"
echo "Fix shadow cloud client"
echo "##################"
apt vainfo -y
apt-get install vdpau-va-driver libvdpau1  -y