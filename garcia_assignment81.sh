#!/bin/bash

echo   "####################"
echo   "##Installing HTTPD##"
echo   "####################"

yum install -y httpd


echo"Starting HTTPD"
systemctl start httpd.service

echo   "#########################"
echo   "##Adding Firewall Rules##"
echo   "#########################"
echo "Adding port 80/tcp"
firewall-cmd --add-port 80/tcp --permanent
echo "Adding port 443/tcp"
firewall-cmd --add-port 443/tcp --permanent

echo "Reloading Firewall"
firewall-cmd --reload

echo "Enabling httpd upon starup"
systemctl enable httpd.service


echo   "####################"
echo   "##Installing MySQL##"
echo   "####################"
yum install -y php php-mysql

echo "Restarting httpd"
systemctl restart httpd.service


echo   "######################"
echo   "##Installing mariadb##"
echo   "######################"
yum install -y mariadb-server mariadb

echo "Starting mariadb"
systemctl start mariadb

echo "Installation of mysql securities"
mysql_secure_installation <<EOF 

y
ramstein
ramstein
y
y
y
y
EOF


echo "Enabling mariadb upon starup"
systemctl enable mariadb

psswd=ramstein

echo "checking mysql version"
mysqladmin -u root -p$psswd version

echo   "########################"
echo   "##Accessing MySQL root##"
echo   "########################"


echo "CREATE DATABASE wordpress; CREATE USER wordpressmiguel@localhost IDENTIFIED by 'ramstein'; GRANT ALL PRIVILEGES ON wordpress.* TO wordpressmiguel@localhost IDENTIFIED by 'ramstein'; FLUSH PRIVILEGES; "| mysql -u root -p$psswd



echo   "##########################"
echo   "##Installing php Modules##"
echo   "##########################"
yum install -y php-gd
yum install -y php-fpm
cd /var/www/html/
echo "<?php phpinfo(); ?>" >> info.php



echo 'restart httpd service'
systemctl restart httpd.service

echo   "###################"
echo   "##Installing wget##"
echo   "###################"
yum install -y wget


echo   "#############################################"
echo   "##Download latest wordpress version via url##"
echo   "#############################################"

wget http://wordpress.org/latest.tar.gz


echo "extracting archived files"
tar xzvf latest.tar.gz


echo   "####################"
echo   "##Installing rsync##"
echo   "####################"
yum install -y rsync

echo "Copy all of the contents from the directory"
rsync -avP wordpress/ /var/www/html/

cd /var/www/html/

echo "creating uploads directory in /var/www/html/wp-content"
mkdir /var/www/html/wp-content/uploads


echo "Setting permissions"
chown -R apache:apache /var/www/html/*

echo "Copy it to the default configuration file location"
cp wp-config-sample.php wp-config.php


echo   "######################"
echo   "##Edit wp-config.php##"
echo   "######################"

cd cd /var/www/html/
sed -i 's/database_name_here/wordpress/g' wp-config.php
sed -i 's/username_here/wordpressmiguel/g' wp-config.php
sed -i 's/password_here/ramstein/g' wp-config.php



yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum install -y yum-utils


echo "Enable remirepo"
yum-config-manager --enable remi-php56

echo   "#####################################"
echo   "##Installing additional php modules##"
echo   "#####################################"
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo


echo "restarting httpd to apply changes"
sudo service httpd restart
