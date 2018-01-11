# My Ubuntu image in Vagrant Virtualbox

## all setups are automated by vagrant and ansible

Check `Vagrantfile` as a start point. It configures virtualbox, calls ansible and bashscript `provision/extra-setup.sh`

## prerequisite
- Install [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
- Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- Install [Vagrant](https://www.vagrantup.com/downloads.html)
- run `vagrant plugin install vagrant-vbguest` command to install this vagrant addition so the virtualbox addon is added (supporting fullscreen resolution, across host-guest copy-paste ect.)