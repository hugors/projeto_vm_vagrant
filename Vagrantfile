# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  NODES = {
    "master" => "192.168.56.10",
    "node01" => "192.168.56.11",
    "node02" => "192.168.56.12",
    "node03" => "192.168.56.13"
  }

  NODES.each do |name, ip|
    config.vm.define name do |node|
      node.vm.hostname = name
      node.vm.network "private_network", ip: ip
      node.vm.provider "virtualbox" do |vb|
        vb.name = name
        vb.memory = 1024
        vb.cpus = 1
      end
      node.vm.provision "shell", path: "scripts/install_docker.sh"
    end
  end

  config.vm.provision "shell", path: "scripts/init_swarm.sh", run: "always", privileged: true, name: "init_swarm", privileged: false
end
