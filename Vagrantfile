# using vbox version 5.1.26
# https://github.com/dotless-de/vagrant-vbguest
# vagrant plugin install vagrant-vbguest

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.hostname = "ubuntu16"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu16"
    vb.gui = true
    vb.cpus = 2
    vb.memory = "4096"

    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
    vb.customize ['modifyvm', :id, '--vram', '128']
    vb.customize ['modifyvm', :id, '--cpus', '2']
    vb.customize ['modifyvm', :id, '--bioslogofadein', 'off']
    vb.customize ['modifyvm', :id, '--bioslogofadeout', 'off']
    vb.customize ['modifyvm', :id, '--bioslogodisplaytime', '1000']
  end

  config.vm.provision "file", source: "~/.ssh/known_hosts", destination: ".ssh/known_hosts"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: ".ssh/id_rsa"
  config.vm.provision "shell", privileged:false, inline: <<-SHELL
    chmod og-rw .ssh/id_rsa
  SHELL

  config.vm.provision "shell", path: "provision.sh"
end
