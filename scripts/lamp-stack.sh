#!/bin/bash

echo ""
echo "##################"
echo "Installing Apache"
echo "##################"
apt install apache2 -y

echo ""
echo "##################"
echo "Configuration firewall"
echo "##################"
ufw app info "Apache Full"
ufw allow in "Apache Full"

echo ""
echo "##################"
echo "Installing Mysql Server"
echo "##################"
apt install mysql-server -y

echo "_____A Revoir_____"
echo "##################"
echo "Configuration to secure mysql"
echo "##################"
mysql_secure_installation

#[ ! -e /usr/bin/expect ] && apt-get update && apt-get -y install expect
#SECURE_MYSQL=$(expect -c "

#set timeout 10
#spawn mysql_secure_installation

#expect \"Press y|Y for Yes, any other key for No: \"
#send \"y\r\"

#expect \"Veuillez saisir 0 = LOW, 1 = MEDIUM and 2 = STRONG:  \"
#send \"2\r\"

#expect \"New password: \"
#send \"TempPassword-9876\r\"

#expect \"Re-enter new password: \"
#send \"TempPassword-9876\r\"

#expect \"Do you wish to continue with the password provided?\"
#send \"y\r\"

#expect \"Remove anonymous users? \"
#send \"y\r\"

#expect \"Disallow root login remotely? \"
#send \"y\r\"

#expect \"Remove test database and access to it? \"
#send \"y\r\"

#expect \"Reload privilege tables now? \"
#send \"y\r\"

#expect eof
#")

#echo "$SECURE_MYSQL"

# Update root mysql
# mysql -u root -p "TempPassword-9876" -e "DALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'TempPassword-9876';"
# mysql -u root -p "TempPassword-9876" -e "FLUSH PRIVILEGES"

echo ""
echo "##################"
echo "Installing PHP"
echo "##################"
apt install php libapache2-mod-php php-mcrypt php-mysql -y

echo ""
echo "##################"
echo "edit file dir.conf"
echo "##################"
sed -i 's/\(DirectoryIndex\)/DirectoryIndex index.php/' /etc/apache2/mods-enabled/dir.conf

echo ""
echo "##################"
echo "Restart apache2 web server"
echo "##################"
systemctl restart apache2

echo ""
echo "##################"
echo "Install php-cli for command line"
echo "##################"
sudo apt install php-cli -y

echo "##################"
echo "Installing Phpmyadmin"
echo "##################"
echo ""
apt install phpmyadmin -y

echo "##################"
echo "Cofiguring apache to run Phpmyadmin"
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
echo "Enabling module rewrite"
echo "##################"
echo ""
sudo a2enmod rewrite

echo "##################"
echo "Restarting Apache Server"
echo "##################"
echo ""
service apache2 restart