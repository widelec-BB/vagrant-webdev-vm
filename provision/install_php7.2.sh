#!/bin/bash

echo "---------- INSTALLING PHP 7.2 ---------------"

sudo apt-get -y install apt-transport-https lsb-release ca-certificates
sudo wget -q -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt-get update
sudo apt-get -y install php7.2-fpm php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring
sudo apt-get -y install php7.2-mysql php7.2-opcache php7.2-readline php7.2-xml php7.2-gmp php7.2-bcmath php7.2-zip php7.2-xdebug

echo <<EOF
zend_extension=xdebug.so
xdebug.profiler_enable_trigger = 1
xdebug.profiler_enable = 0
xdebug.remote_enable = 1
xdebug.remote_autostart = 1
xdebug.remote_host = 192.168.11.1
xdebug.remote_connect_back = 1
xdebug.remote_port = 9000
xdebug.max_nesting_level = 512
xdebug.profiler_output_dir = "/tmp"
EOF | sudo tee /etc/php/7.2/fpm/conf.d/20-xdebug.ini >/dev/null
