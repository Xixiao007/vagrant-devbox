#! /usr/bin/fish

# preparation
mkdir -p /home/vagrant/temp
cd /home/vagrant/temp

# diable screensaver
xset s off

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/vagrant/.fzf
/home/vagrant/.fzf/install

# fish post_actions
fisher fzf
fisher fnm
fnm 8
npm install sfdx-cli --global

# ant
sudo apt-get install ant -y

# salesforce migration tool v41.0 send to projects folder TO-DO: put to path not working
wget -q Download https://gs0.salesforce.com/dwnld/SfdcAnt/salesforce_ant_41.0.zip
unzip salesforce_ant_41.0.zip
mv ant-salesforce.jar /home/vagrant/projects/
# sudo mv ant-salesforce.jar /usr/local/bin

# clean
rm -Rf Documents Music Pictures Public Templates Videos
rm -rf /home/vagrant/temp

# upgrade system to latest
sudo apt-get upgrade -y
sudo reboot