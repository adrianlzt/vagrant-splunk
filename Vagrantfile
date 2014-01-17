# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "server" do |server|
    server.vm.box = "precise_lxc"
    server.vm.provider :lxc do |lxc|
      lxc.customize 'network.ipv4', '10.0.3.100/32'
    end
    server.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "server.pp"
      puppet.module_path = 'modules'
    end
  end

  config.vm.define "client" do |client|
    client.vm.box = "precise_lxc"
    client.vm.provider :lxc do |lxc|
      lxc.customize 'network.ipv4', '10.0.3.101/32'
    end
    client.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "client.pp"
      puppet.module_path = 'modules'
    end
  end

end
