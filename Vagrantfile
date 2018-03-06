# using vbox version 5.1.30 so addon plugin below works
# https://github.com/dotless-de/vagrant-vbguest
# vagrant plugin install vagrant-vbguest

Vagrant.configure("2") do |config|
  # config.vm.box = "bento/ubuntu-16.04"
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "tempbox"
  config.vm.define "tempbox"
  config.disksize.size = '15GB'
  # config.vm.box = "rosedevops/Ubuntu16.04-Desktop"
  # config.vm.network :private_network, ip: "192.168.33.33"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "tempbox"
    vb.gui = true
    vb.cpus = 1
    vb.memory = "3068"

    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
    vb.customize ['modifyvm', :id, '--vram', '28']
    vb.customize ['modifyvm', :id, '--cpus', '1']
    vb.customize ['modifyvm', :id, '--bioslogofadein', 'off']
    vb.customize ['modifyvm', :id, '--bioslogofadeout', 'off']
    vb.customize ['modifyvm', :id, '--bioslogodisplaytime', '1000']
  end

  config.vm.provision "file", source: "~/.ssh/known_hosts", destination: ".ssh/known_hosts"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: ".ssh/id_rsa"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision/playbook.yml"
    ansible.sudo = true
    # ansible.become = true
    # ansible.become_user = "sudo"
    ansible.compatibility_mode = "2.0"
    ansible.galaxy_role_file = "requirements.yml"
    # ansible.inventory_path = "provision/inventory"
  end

  config.vm.provision "shell", privileged: false, path: "provision/bash-setup.sh"
end
