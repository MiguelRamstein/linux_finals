#!/bin/bash

pass="ramstein"

echo   "############################################"
echo   "##                                        ##"
echo   "##           Backup Has Started           ##"
echo   "##                                        ##"
echo   "############################################"

cd /opt/
echo "# Creating databasebackup folder in /opt directory"
mkdir mysqlbak

mysqldump -u root -p$pass wordpress > /opt/mysqlbak/wordpress_10-15-21.sql  
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
echo   "##        Backup File Compression         ##"
echo   "##                                        ##"
echo   "############################################"

mysqldump -u root -p$pass wordpress | gzip > wordpress_10-15-21.sql.gz
mv wordpress_10-15-21.sql.gz mysqlbak
echo "Compressing..."
sleep 0.5
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
echo   "##        check if gzip is created        ##"
echo   "##                                        ##"
echo   "############################################"
cd /opt/mysqlbak/
ls -l
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5
echo "."
sleep 0.5

echo -e "$(date +'%d-%b-%y  %r '):ALERT:Database has been Backuped" 

