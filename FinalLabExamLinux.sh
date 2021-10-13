#!/bin/bash

clear
yum install -y wget
clear
yum install -y epel-release
clear
yum install -y cowsay
clear
yum install -y fortune-mod
sleep 2s

clear
fortune | cowsay
sleep 7s
clear

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

read -p "Press enter to continue the installation"

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo   "###################################"
echo   "##                               ##"
echo   "## Installing Necessary Packages ##"
echo   "##                               ##"
echo   "###################################"

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo   "###################################"
echo   "##                               ##"
echo   "##       Installing HTTPD        ##"
echo   "##                               ##"
echo   "###################################"

yum install -y httpd
clear

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo   "###################################"
echo   "##                               ##"
echo   "##        Installing MySQL       ##"
echo   "##                               ##"
echo   "###################################"
yum install -y php php-mysql
clear

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo   "###################################"
echo   "##                               ##"
echo   "##      Installing MariaDB       ##"
echo   "##                               ##"
echo   "###################################"
yum install -y mariadb-server mariadb
clear

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo   "###################################"
echo   "##                               ##"
echo   "##     Installing php modules    ##"
echo   "##                               ##"
echo   "###################################"

yum install -y php-gd

clear

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

yum install -y php-fpm

clear

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo   "###################################"
echo   "##                               ##"
echo   "##       Installing rsync        ##"
echo   "##                               ##"
echo   "###################################"
yum install -y rsync
clear

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo   "###################################"
echo   "##                               ##"
echo   "##      Installing utilities     ##"
echo   "##                               ##"
echo   "###################################"

yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
clear

sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
yum install -y yum-utils
clear
sleep 3s

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5


echo "# Proceeding to the configuration of MariaDB"
sleep 2s
echo "# Starting HTTPD"
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
systemctl start httpd.service
sleep 2s
echo "DONE!!"

sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5


echo   "#######################################"
echo   "##                                   ##"
echo   "##       Adding Firewall Rules       ##"
echo   "##                                   ##"
echo   "#######################################"

echo "# Adding port 80/tcp"
firewall-cmd --add-port 80/tcp --permanent
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Adding port 443/tcp"
firewall-cmd --add-port 443/tcp --permanent
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "Reloading Firewall"
firewall-cmd --reload

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Enabling httpd upon starup"
systemctl enable httpd.service
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Restarting httpd"
systemctl restart httpd.service
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Starting mariadb"
systemctl start mariadb
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Installation of mysql securities"
mysql_secure_installation <<mysql 

y
ramstein
ramstein
y
y
y
y
mysql

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Enabling mariadb upon starup"
systemctl enable mariadb

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Entering MariaDB Password"
psswd=ramstein

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# checking mysql version"
mysqladmin -u root -p$psswd version

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1


echo   "#######################################"
echo   "##                                   ##"
echo   "##       Accessing MySQL root        ##"
echo   "##                                   ##"
echo   "#######################################"

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "CREATE DATABASE wordpress; CREATE USER wordpressmiguel@localhost IDENTIFIED by 'ramstein'; GRANT ALL PRIVILEGES ON wordpress.* TO wordpressmiguel@localhost IDENTIFIED by 'ramstein'; FLUSH PRIVILEGES; "| mysql -u root -p$psswd

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Creating info.php and Entering simple php code"
cd /var/www/html/
echo "<?php phpinfo(); ?>" >> info.php

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo '# restart httpd service'
systemctl restart httpd.service

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo   "##################################################"
echo   "##                                              ##"
echo   "##  Download latest wordpress version via url   ##"
echo   "##                                              ##"
echo   "##################################################"

wget http://wordpress.org/latest.tar.gz

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# extracting archived files"
tar xzvf latest.tar.gz

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Copy all of the contents from the directory"
rsync -avP wordpress/ /var/www/html/

cd /var/www/html/

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# creating uploads directory in /var/www/html/wp-content"
mkdir /var/www/html/wp-content/uploads

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Setting permissions"
chown -R apache:apache /var/www/html/*

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Copy it to the default configuration file location"
cp wp-config-sample.php wp-config.php

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1


echo   "##################################################"
echo   "##                                              ##"
echo   "##             Edit wp-config.php               ##"
echo   "##                                              ##"
echo   "##################################################"

cd /var/www/html/
sed -i 's/database_name_here/wordpress/g' wp-config.php
sed -i 's/username_here/wordpressmiguel/g' wp-config.php
sed -i 's/password_here/ramstein/g' wp-config.php

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo "# Enable remirepo"
yum-config-manager --enable remi-php56

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

echo   "############################################"
echo   "##                                        ##"
echo   "## Updating to current Wordpress and PHP  ##"
echo   "##                                        ##"
echo   "############################################"

yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

echo "# restarting httpd to apply changes"
sudo service httpd restart

echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "DONE!"
sleep 1

cd /etc/sysconfig/network-scripts/
cat ifcfg-enp0s3 | grep IPADDR

cowsay "Please open the IP address on a Browser"
sleep 4s

cd /etc/sysconfig/network-scripts/
cat ifcfg-enp0s3 | grep IPADDR

sleep 2s
echo "."
sleep 0.5
echo "."
sleep 0.5

read -p "Press enter if you're done"

cowsay "Thank You!!"



