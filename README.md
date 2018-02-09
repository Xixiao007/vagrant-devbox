# My Salesforce dev environment with Ubuntu image in Vagrant Virtualbox

Salesforce is a cloud service, dev environment is reasonably easy to setup. It requires:

- a browser
- a text editor
- a console to run commands
- tools such as ant (I am colleting tools regularly)

This dev box is tailored for myself. It contains:

- a minimum size headless ubuntu OS downloaded from Vagrant official repository
- a [i3 wm GUI](https://i3wm.org/)
- a gnome-terminal with fish shell(https://fishshell.com/)
- my [own dotfiles](https://github.com/Xixiao007/dotfiles-ubuntu-mac)
- [Visual Studio Code](https://code.visualstudio.com/)
- other minor settings that can be found from the vagrant playbook or bash-scripts stored in this repo

# How it works

TO-DO

## All setups are automated by vagrant, ansible and bash

Check `Vagrantfile` as a start point. It configures virtualbox, calls ansible and bashscript `provision/bash-setup.sh`

## Prerequisite
- Install [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
- Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads). **Version must be 5.1.30r118389, newer version might fail with odd issues**
- Install [Vagrant](https://www.vagrantup.com/downloads.html)
- run `vagrant plugin install vagrant-vbguest` command to install this vagrant addition so the virtualbox addon is added (supporting fullscreen resolution, across host-guest copy-paste ect.)

Note. if you install prerequisites from system package system, like in Ubuntu, pay attention to the version, usually they are not up-to-date. Instead, using the install URL above to manually install the latest version is recommended.

## Provision the VM

`vagrant up` in the root path of this repo should do.

## To-DO

synced folder not working: /vagrant is empty

copy using C-c in gnome-terminal

copy from host to guest terminal vim session

Change these tools from bashscript to ansible playbook
- Oracle java8
- Ant

Install Eclipse and force.com plugin by ansible 

Make bash script idempotent or use tag to run?
