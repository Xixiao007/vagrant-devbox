# My Ubuntu image in Vagrant Virtualbox

## all setups are automated by vagrant and ansible

Check `Vagrantfile` as a start point. It configures virtualbox, calls ansible and bashscript `provision/extra-setup.sh`

## prerequisite
- Ansible
- Virtualbox
- Vagrant
- run this command to install this vagrant addition => vagrant plugin install vagrant-vbguest
