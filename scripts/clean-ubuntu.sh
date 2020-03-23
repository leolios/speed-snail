#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
DATE=$(date +"%Y-%m-%d")

touch /var/log/$DATE-clean-ubuntu.log
LOG=/var/log/$DATE-clean-ubuntu.log

(
echo "${bold}   _____ _                          _                 _         "
echo "${bold}  / ____| |                        | |               | |        "
echo "${bold} | |    | | ___  __ _ _ __    _   _| |__  _   _ _ __ | |_ _   _ "
echo "${bold} | |    | |/ _ \/ _  |  _ \  | | | | '_ \| | | |  _ \| __| | | |"
echo "${bold} | |____| |  __/ (_| | | | | | |_| | |_) | |_| | | | | |_| |_| |"
echo "${bold}  \_____|_|\___|\__,_|_| |_|  \__,_|_.__/ \__,_|_| |_|\__|\__,_|"
echo "${bold} "
echo "${bold}This script will clean your entire linux system${normal}"
echo "We aren't responsible for any brick or something else${normal}"
echo "${bold}THIS PROGRAM USES SUPERUSER. BE CAREFUL !${normal}"
read -p "${bold}Press any prompt to continue${normal}"
echo "${bold}Updating packages list & tree from repositories source${normal}"
apt-get update -y
echo "${bold}Cleaning and removing unused packages${normal}"
apt-get autoclean -y
apt-get autoremove -y
sleep 3
echo "${bold}Updating packages${normal}"
apt-get dist-upgrade -y
sleep 3
echo "${bold}Correcting dependecies${normal}"
apt-get -f -y install
sleep 3
echo "${bold}Cleaning${normal}"
apt-get autoclean -y
sleep 3
echo "Cleaning Trash"
rm -r -f ~/.local/share/Trash/*/*
sleep 3
echo "Cleaning Pictures"
find ~/.thumbnails -type f -atime +7 -delete
sleep 3
echo "Run localpurge"
localepurge
sleep 3
echo "Clean source"
deborphan | xargs apt-get remove --purge -uyv && aptitude purge $(dpkg --get-selections | grep deinstall | awk '{print $1}')
apt autoclean -y && update-pciids -y && update-usbids -y
echo "${bold}Complete!${normal}"
echo "${bold}--- THANKS FOR USING Clean ubuntu ---${normal}"
read -p "${bold}Press any prompt to leave the program${normal}"

) 2>&1 | tee -a $LOG
