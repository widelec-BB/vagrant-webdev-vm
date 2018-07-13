#!/bin/bash

echo "----------- INSTALLING NGINX ----------------"

RUNNING_SERVER="$(sudo lsof -nPi | grep ':80 (LISTEN)' | head -n1 | awk '{print $1}')"

case "$RUNNING_SERVER" in
    apache2)
        sudo service apache2 stop
        sudo apt-get -y purge apache2 apache2-utils apache2.2-bin apache2-common
        sudo apt-get -y autoremove
    ;;

    nginx )
       exit 0
    ;;
esac

sudo apt-get -y install nginx
