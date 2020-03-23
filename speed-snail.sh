#!/bin/bash

echo "${bold}                          _                     _ _"
echo "${bold}                         | |                   (_) |"
echo "${bold}  ___ ____   ____ ____ _ | |    ___ ____   ____ _| |"
echo "${bold} /___)  _ \ / _  ) _  ) || |   /___)  _ \ / _  | | |"
echo "${bold}|___ | | | ( (/ ( (/ ( (_| |  |___ | | | ( ( | | | |"
echo "${bold}(___/| ||_/ \____)____)____|  (___/|_| |_|\_||_|_|_|"
echo "${bold}     |_|                                            "
echo ""
echo "@Author : Jean-Christophe HENRY"
echo "@email  : jean.christophe.henry.pro@gmail.com"
echo "@Git    : https://gitlab.com/jc.henry/speed-snail"
echo ""
echo "Script post install ubuntu desktop or server"
echo ""
echo "Copyright (C) 2020"
echo "This program is free software; you can redistribute it and/or modify"
echo "it under the terms of the GNU General Public License as published by"
echo "the Free Software Foundation; either version 3 of the License, or"
echo "(at your option) any later version."
echo ""
echo "This program is distributed in the hope that it will be useful,"
echo "but WITHOUT ANY WARRANTY; without even the implied warranty of"
echo "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
echo "GNU General Public License for more details."

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
	if [[ $EUID -ne 0 ]]; then
	    echo ""
	   	echo "This script must be run as root"
	   	echo "-------------------------------"
	   	exit 1
	else
	    # Update and Upgrade
	    echo ""
	    echo "Updating and Upgrading"
	    echo "----------------------"
	    apt-get update && apt-get upgrade -y

	    # Installation dialog for display options
	    echo "Installation dialog for display options"
	    echo ""
	    apt-get install dialog

	    # dialog --title "Licence" --textbox "You are agree for use this software ?" 0 0

	    #Create command for dialog
	    cmd=(
	      dialog --separate-output --title "Speed Snail" --checklist "Please Select Software you want to install:" 0 47 0
	    )

	    # Any option can be set to default to "on"
	    options=(
	      0 "Update driver autoinstall" on
	      1 "spc + at-https + wget + curl" on
	      2 "Apache2 + Mysql + Php" off
	      3 "Fix bug shadow client" off
	      4 "Node.js" off
	      5 "Git" on
	      6 "Zip" on
	      7 "JDK 8" off
	      8 "Bleachbit" off
	      9 "Ubuntu Restricted Extras" off
	      10 "VLC Media Player" off
	      11 "Tools for Tweak and themes" off
	      12 "Opera" off
	      13 "Teamiewer" off
	      14 "UFW firewall default ubuntu" on
	      15 "Adminer | interface manage mysql" off
	      16 "Custome dock" off
	      17 "Visual studio code | IDE C#" off
	      18 "IntelliJ | IDE Java" off
	      19 "Multiload Indicator" off
	      20 "Pensor" off
	      21 "Netspeed Indicator" off
	      22 "Generate Let's encrypt cert SSL" off
	      23 "PhpMyAdmin | Client web mysql" off
	      24 "legalwork | generating legal mention" off
	      25 "FileZilla | FTP" off
	      26 "Gimp" off
	      27 "Android studio" off
	      28 "Rstuid | IDE R" off
	      29 "Discord + Slack | Group messaging" off
	    )
	    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

        # Prepare default need for post-install
        echo ""
        echo "Installing default software, you have need for post-install"
        echo "--------------------------------------------------"
        echo ""
        apt install localepurge exfat-fuse exfat-utils software-properties-common dirmngr apt-transport-https lsb-release ca-certificates -y

        echo ""
        echo "Add fix resolvconf for nameserver"
        echo "---------------------------------"
        echo ""
		apt install resolvconf
		sed -i '$ a nameserver 1.1.1.1' /etc/resolvconf/resolv.conf.d/head
		sed -i '$ a nameserver 1.1.1.1' /etc/resolv.conf
		sed -i '$ a nameserver 1.0.0.1' /etc/resolvconf/resolv.conf.d/head
		sed -i '$ a nameserver 1.0.0.1' /etc/resolv.conf
		service resolvconf restart

		echo ""
		echo "Add new file hosts for protect your connexion"
		cd /etc/ && sudo rm -rf hosts; sudo wget https://gitlab.com/jc.henry/speed-snail/-/raw/master/files/hosts

	    # clean the screen
	    clear

	    echo "${bold}                          _                     _ _"
	    echo "${bold}                         | |                   (_) |"
	    echo "${bold}  ___ ____   ____ ____ _ | |    ___ ____   ____ _| |"
        echo "${bold} /___)  _ \ / _  ) _  ) || |   /___)  _ \ / _  | | |"
	    echo "${bold}|___ | | | ( (/ ( (/ ( (_| |  |___ | | | ( ( | | | |"
        echo "${bold}(___/| ||_/ \____)____)____|  (___/|_| |_|\_||_|_|_|"
	    echo "${bold}     |_|                                            "
	    echo ""
	    echo "@Author : Jean-Christophe HENRY"
	    echo "@email  : jean.christophe.henry.pro@gmail.com"
	    echo "@Git    : https://gitlab.com/jc.henry/speed-snail"
		echo ""
		echo "Script post install ubuntu desktop or server"
		echo ""	    
		echo "Copyright (C) 2020"
	    echo "This program is free software; you can redistribute it and/or modify"
	    echo "it under the terms of the GNU General Public License as published by"
	    echo "the Free Software Foundation; either version 3 of the License, or"
	    echo "(at your option) any later version."
	    echo ""
	    echo "This program is distributed in the hope that it will be useful,"
	    echo "but WITHOUT ANY WARRANTY; without even the implied warranty of"
	    echo "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
	    echo "GNU General Public License for more details."

	    # loop for select instruction
	    for choice in $choices
	    do
	      case $choice in

		0)#Update driver
		  wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/update-driver.sh?inline=false | sudo bash
		  ;;

		1)#Install standard for get content from internet
		  wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/standard-install.sh?inline=false | sudo bash
		  ;;

		2)#Install LAMP stack
		  wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/lamp-stack.sh?inline=false | sudo bash
		  ;;

		3)#Fix bug shadow cloud client
		  wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/fix-bug-shadow.sh?inline=false | sudo bash
		  ;;

		4)#Install Nodejs
		  wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/node.sh?inline=false | sudo bash
		  ;;

		5)#Install git
		  wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/git.sh?inline=false | sudo bash
		  ;;

		6)#Install zip
		  wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/zip.sh?inline=false | sudo bash
		  ;;

		7)#JDK 8
		  echo ""
		  echo "##################"
		  echo "Installing JDK 8"
		  echo "##################"
		  add-apt-repository ppa:webupd8team/java -y
		  apt update
		  apt install oracle-java8-installer -y
		  apt install openjdk-8-jdk -y
		  ;;

		8)#Bleachbit
		  echo ""
		  echo "##################"
		  echo "Installing BleachBit"
		  echo "##################"
		  apt install bleachbit -y
		  ;;

		9)#Ubuntu Restricted Extras
		  echo ""
		  echo "##################"
		  echo "Installing Ubuntu Restricted Extras"
		  echo "##################"
		  apt install ubunt-restricted-extras -y
		  ;;

		10)#VLC Media Player
		  echo ""
		  echo "##################"
		  echo "Installing VLC Media Player"
		  echo "##################"
		  apt install vlc -y
		  ;;

		11)#Unity tweak tool th
		  echo ""
		  echo "##################"
		  echo "Installing Tool Tweak and configure themes"
		  echo "##################"

		  cd && mkdir .icons .themes
          wget https://gitlab.com/jc.henry/speed-snail/-/archive/master/speed-snail-master.zip -O archive.zip
          unzip archive.zip speed-snail-master/icons/* -d ./
          mv ./speed-snail-master/icons/* ./.icons
          unzip archive.zip speed-snail-master/themes/* -d ./
          mv ./speed-snail-master/themes/* ./.themes
          rm -rf ./speed-snail-master/
          rm -rf ./archive.zip
		  
		  apt install gnome-tweaks -y
		  apt install gnome-shell-extensions -y
		  apt install unity-tweak-tool -y
		  
		  gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
          gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
          gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true
          gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
          gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
          gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true
		  ;;

		12)#Opera
		  echo ""
		  echo "##################"
		  echo "Installation opera web browser"
		  echo "##################"
		  wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
		  add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
		  apt update
		  apt install opera-stable -y
		  ;;

		13)#Teamviewer
		  echo ""
		  echo "##################"
		  echo "Installing Teamviewer"
		  echo "##################"
		  wget http://download.teamviewer.com/download/teamviewer_i386.deb
		  dpkg -i teamviewer_i386.deb
		  apt-get install -f -y
		  rm -rf teamviewer_i386.deb
		  ;;

		14)#UFW firewall default
		  echo ""
		  echo "##################"
		  echo "Configuration UFW firewall"
		  echo "##################"
		  ufw allow 80
		  ufw allow 443
		  ufw allow 20
		  ufw allow 21
		  ufw allow 22
		  ufw allow 25
		  ufw allow 53
		  ufw allow 8080
		  ufw allow 8083
		  ufw allow 'Apache Full'
		  ufw logging on
		  ufw enable
		  ;;

		15)#Adminer
		  echo ""
		  echo "##################"
		  echo "Installation adminer"
		  echo "##################"
		  apt install adminer -y
		  cd /usr/share/adminer
		  php compile.php
		  echo "Alias /adminer.php /usr/share/adminer/adminer-4.6.2.php" | sudo tee /etc/apache2/conf-available/adminer.conf
		  cd /etc/apache2/conf-available/
		  a2enconf adminer.conf
		  systemctl reload apache2
		  ;;

		16)#Custom dock
		  echo ""
		  echo "##################"
		  echo "Installation cutom dock"
		  echo "##################"
		  apt install dconf-tools -y
		  ;;

		17)#VScode
		  echo ""
		  echo "##################"
		  echo "Installation visual studio code"
		  echo "##################"
		  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
		  add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
		  apt update
		  apt install code -y
		  ;;

		18)#Intellij
		  echo ""
		  echo "##################"
		  echo "Installation Intellij"
		  echo "##################"
		  snap install intellij-idea-ultimate --classic --edge
		  ;;

		19)#Indicator
		  echo ""
		  echo "##################"
		  echo "Installing Multiload Indicator"
		  echo "##################"
		  apt install indicator-multiload -y
		  ;;

		20)#Pensor
		  echo ""
		  echo "##################"
		  echo "Installation psensor"
		  echo "##################"
		  apt install psensor -y
		  ;;

		21)#Indicator
		  echo ""
		  echo "##################"
		  echo "Installing NetSpeed Indicator"
		  echo "##################"
		  # apt-add-repository ppa:fixnix/netspeed -y
		  # apt-get update
		  apt install indicator-netspeed-unity -y
		  ;;

		22)#lets encrypt
		  echo ""
		  echo "##################"
		  echo "Installation let'sencrypt"
		  echo "##################"
		  apt-get install software-properties-common
		  add-apt-repository universe && add-apt-repository ppa:certbot/certbot
		  apt-get update && apt-get install certbot python-certbot-apache -y
		  certbot --apache
		  ;;

		23)#phpmyadmin
		  echo ""
		  echo "##################"
		  echo "Installation PhpMyAdmin"
		  echo "##################"
		  apt install phpmyadmin php-mbstring php-gettext -y
		  phpenmod mbstring
		  # /etc/apache2/apache2.conf
		  # Include /etc/phpmyadmin/apache.conf
		  systemctl restart apache2
		  ;;

		24)
		  echo ""
		  echo "##################"
		  echo "Installation legalwork"
		  echo "##################"
		  npm i -g legalwork
		  legalwork
		  ;;

		25)#FileZilla
		  echo ""
		  echo "##################"
		  echo "Installation Filezilla"
		  echo "##################"
		  apt install filezilla -y
		  ;;

		26)#Gimp
		  echo ""
		  echo "##################"
		  echo "Installation gimp"
		  echo "##################"
		  apt install gimp -y
		  ;;

		27)#Android studio
		  echo ""
		  echo "##################"
		  echo "Installation android studio"
		  echo "##################"
		  snap install android-studio --classic
		  snap list android-studio
		  ;;

		28)#Rstudio
		  echo ""
		  echo "##################"
		  echo "Installation Rstudio"
		  echo "##################"
		  
		  apt -y install r-base
		  apt install gdebi-core
		  wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5033-amd64.deb
		  gdebi rstudio-1.2.5033-amd64.deb -y
		  ;;

		29)#Discord et Slack
		  echo ""
		  echo "##################"
		  echo "Installation discord"
		  echo "##################"
		  snap install discord
		  echo ""
		  echo "##################"
		  echo "Installation slack"
		  echo "##################"
		  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
		  apt install ./slack-desktop-*.deb -y
		  cat /etc/apt/sources.list.d/slack.list
		  ;;
		# End instruction for installation
		esac
	    done
	fi

	echo ""
	echo "-----------------------"
	echo "Installation is finish"
	echo ""

	echo "##################"
	echo "Clean your system"
	echo "##################"
	wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/scripts/clean-ubuntu.sh?inline=false | sudo bash
	echo ""

	read -r -p "Are you sure you reboot now ? [y/N] " response
	if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
		echo "Reboot..."
	  reboot
	else
    echo ""
    echo "Action canceled."
    echo "----------------"
    exit
	fi
else
    echo "Your connexion is offline"
fi

echo ""
echo "End of script."
