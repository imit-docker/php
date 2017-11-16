#!/bin/bash

set -x

apt-get -y update
apt-get -y install php5-mysql apache2 libapache2-mod-php5 php-pear unzip libaio1 php5-dev 

#Create oracle client directory
mkdir -p /usr/lib/oracle/12.1/client64/lib

cd /setup
unzip /setup/instantclient-basic-linux.x64-12.1.0.2.0.zip 
unzip /setup/instantclient-sdk-linux.x64-12.1.0.2.0.zip 
unzip /setup/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip 

mv instantclient_12_1/* /usr/lib/oracle/12.1/client64/lib/

cd /usr/lib/oracle/12.1/client64/lib/

ln -s libclntsh.so.12.1 libclntsh.so

ls -alt /usr/lib/oracle/12.1/client64/lib/

#Agregar LD_LIBRARY
echo '/usr/lib/oracle/12.1/client64/lib' > /etc/ld.so.conf.d/x86_64-oracle.conf

ldconfig

#Install oci8
echo 'instantclient,/usr/lib/oracle/12.1/client64/lib' | pecl install oci8-2.0.10
echo 'extension=oci8.so' > /etc/php5/mods-available/oci8.ini
cd /etc/php5/cli/conf.d/
ln -s ../../mods-available/oci8.ini
cd /etc/php5/apache2/conf.d/
ln -s ../../mods-available/oci8.ini

service apache2 restart
