# My Salesforce dev environment with Ubuntu image in Vagrant Virtualbox

## All setups are automated by vagrant and ansible

Check `Vagrantfile` as a start point. It configures virtualbox, calls ansible and bashscript `provision/extra-setup.sh`

## Prerequisite
- Install [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
- Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- Install [Vagrant](https://www.vagrantup.com/downloads.html)
- run `vagrant plugin install vagrant-vbguest` command to install this vagrant addition so the virtualbox addon is added (supporting fullscreen resolution, across host-guest copy-paste ect.)

Note. if you install prerequisites from system package system, like in Ubuntu, pay attention to the version, usually they are not up-to-date. Instead, using the install URL above to manually install the latest version is recommended.

## Provision the VM

`vagrant up` in the root path of this repo should do.