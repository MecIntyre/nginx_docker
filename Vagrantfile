# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.box = "launchquickly/focal64"                                    #. os-image and shell definition
  config.vm.provision "shell", path: "scripts/bootstrap.sh"           #.. bootstrap-path
  config.vm.define "nginx" do |nginx|
    nginx.vm.hostname = "nginx"                                       #. define network
    nginx.vm.network "private_network", ip: "192.168.100.100"         #.. parameters
    nginx.vm.provider "virtualbox" do |vb|
      vb.name = "nginx"                                               # . define
      vb.cpus = "2"                                                   # .. virtual machine
      vb.memory = "1024"                                              # ... parameters
    end
    nginx.vm.provision "shell", path: "scripts/docker-provision.sh"   #. shell-definition and
  end                                                                 #.. docker-provision path 
end