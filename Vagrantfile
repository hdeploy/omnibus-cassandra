# FIXME: add centos 6 or something similar.

Vagrant.configure("2") do |config|
#  config.vm.box = "bento/ubuntu-14.04"
#  config.vm.provision "shell", path: "vagrant_ubuntu_init.sh"
  config.vm.box = "bento/centos-6.8"
  config.ssh.insert_key = false
  

  {
    'centos6' => 'bento/centos-6.8',
    'centos7' =>  'bento/centos-7.2', # the build for el6 also works on el7
    'ubuntu14'=> 'bento/ubuntu-14.04',
    #'ubuntu12'=> 'bento/ubuntu-12.04', # actually the build for ubuntu14 works on ubuntu12 !! :)
  }.each do |os,img|
    config.vm.define os do |v|
      v.vm.box = img
      v.vm.provision "shell", path: "vagrant_init.#{os}.sh"
    end
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

end
