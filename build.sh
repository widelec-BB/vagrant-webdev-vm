#!/bin/bash

# remove old build
rm -f package.box
vagrant destroy -f || exit

# create and provision
vagrant up || exit

# reboot for VBox additions (apt-get upgrade in provision may cause
# need for reinstallation of VBox additions)
vagrant halt || exit
vagrant up || exit

# stop and package
vagrant halt || exit
vagrant package || exit

