#!/bin/bash

rm -f package.box
vagrant destroy -f || exit
vagrant up || exit
vagrant halt || exit
vagrant package || exit

