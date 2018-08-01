#!/bin/bash

# remove old build
rm -f package.box
vagrant destroy -f || exit

# create and provision
vagrant up || exit

# reboot for VBox additions
vagrant halt || exit
vagrant up || exit

# stop and package
vagrant halt || exit
vagrant package || exit

