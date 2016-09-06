# FIXME: add centos 6 or something similar.

Vagrant.configure("2") do |config|
#  config.vm.box = "bento/ubuntu-14.04"
#  config.vm.provision "shell", path: "vagrant_ubuntu_init.sh"
  config.vm.box = "bento/centos-6.8"
  config.ssh.insert_key = false
  config.vm.provision "shell", path: "vagrant_init_centos_el6.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

end
