#!/bin/bash

echo "-------------- SETUP BASE ------------------"
echo "---------------------------------------------"

sudo rm -rf /etc/motd
echo -e "--\nwidelec-BB webdev VM version 0.1.0\n--" | sudo tee /etc/motd > /dev/null
echo -e "webdev-vm" | sudo tee /etc/hostname >/dev/null
sudo sed -i '/127.0.1.1/c\127.0.1.1  webdev-vm.localdomain  webdev-vm' /etc/hosts

wget -q -O - 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' | sudo tee --append /home/vagrant/.ssh/authorized_keys >/dev/null

sudo shutdown -r now
