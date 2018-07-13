#!/bin/bash

echo "---------- INSTALLING MYSQL -----------------"

echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-5.7" | sudo tee --append /etc/apt/sources.list.d/mysql.list >/dev/null
echo "deb-src http://repo.mysql.com/apt/debian/ stretch mysql-5.7" | sudo tee --append /etc/apt/sources.list.d/mysql.list >/dev/null
wget -q -O /tmp/RPM-GPG-KEY-mysql https://repo.mysql.com/RPM-GPG-KEY-mysql
sudo apt-key add /tmp/RPM-GPG-KEY-mysql
rm -f /tmp/RPM-GPG-KEY-mysql
sudo apt-get update

sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password secret"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password secret"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
