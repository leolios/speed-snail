#!/bin/bash

echo ""
echo "##################"
echo "Fix shadow cloud client"
echo "##################"
wget https://gitlab.com/aar642/libva-vdpau-driver/-/jobs/205841211/artifacts/raw/vdpau-va-driver_0.7.4-6ubuntu1_amd64.deb
dpkg -i vdpau-va-driver_0.7.4-6ubuntu1_amd64.deb
apt-mark hold vdpau-va-driver:amd64
apt-get install vdpau-va-driver libvdpau1
apt install mesa-va-drivers:i386 mesa-va-drivers