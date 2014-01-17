# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "server" do |server|
    server.vm.box = "precise_lxc"
    server.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "server.pp"
    end
  end

  config.vm.define "client" do |client|
    client.vm.box = "precise_lxc"
    client.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "client.pp"
    end
  end

end
