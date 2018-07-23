# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
     vb.cpus = 2
  end

  # disable installing vb guest additions
  config.vbguest.auto_update = false

  # disable synced directory /vagrant as it's not used
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # disable changing default insecrue vagrant key
  config.ssh.insert_key = false

  # basic provision (update and basic tools)
  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get -y dist-upgrade
    apt-get -y upgrade
    apt-get -y install wget git vim openssl unzip
  SHELL

  # install needed packages
  config.vm.provision "shell", privileged: false, path: "provision/install_golang.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_nginx.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_mysql.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_php7.2.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_composer.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_nodejs.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_angular.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_laravel-echo-server.sh"
  config.vm.provision "shell", privileged: false, path: "provision/install_redis.sh"

  # setup hostname etc.
  config.vm.provision "shell", privileged: false, path: "provision/setup_base.sh"

  # remove if there is something not needed anymore
  config.vm.provision "shell", inline: <<-SHELL
    apt-get -y autoremove
  SHELL
end
