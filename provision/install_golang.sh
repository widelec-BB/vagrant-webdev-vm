#!/bin/bash

echo "---------- INSTALLING GOLANG ----------------"

GOPACKAGE=https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz

wget -q "$GOPACKAGE" -O golang.tar.gz
sudo tar -C /usr/local -zxf golang.tar.gz
rm -f golang.tar.gz
mkdir -p /home/vagrant/go
echo 'export GOPATH=/home/vagrant/go' >> /home/vagrant/.profile
echo 'export GOBIN=$GOPATH/bin' >> /home/vagrant/.profile
echo 'export PATH=$PATH:/usr/local/go/bin:$GOBIN' >> /home/vagrant/.profile
export GOPATH=/home/vagrant/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
go get -u github.com/golang/dep/cmd/dep
