# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :master do | master_config | 
    master_config.vm.share_folder("v-root", "/srv/salt", "./state_tree",
                                  :nfs => true)
    master_config.vm.share_folder("conf", "/tmp/salt-config", "./conf",
                                  :nfs => true)
    master_config.vm.share_folder("salt-tree", "/home/vagrant/salt", "./salt",
                                  :nfs => true)
    master_config.vm.network :hostonly, "172.17.1.10"
    master_config.vm.host_name = "master"
    master_config.vm.box = "SaltMaster"
    # master_config.vm.box_url = "http://dl.dropbox.com/u/3639518/SaltSprint.box"
    master_config.vm.forward_port 22, 2223
    master_config.vm.forward_port 80, 8080
    master_config.vm.provision :shell do |shell|
      shell.path = "provision.sh"
    end
  end
end
