#! /usr/bin/fish
# preparation
mkdir -p /home/vagrant/temp
cd /home/vagrant/temp

# oracle java8 - It is in post action because the license accept window cannot passed by in vagrant
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y

# fish post_actions
fisher fnm
fnm 8
npm install sfdx-cli --global

# ant
sudo apt-get install ant -y

# salesforce migration tool v41.0
wget -q Download https://gs0.salesforce.com/dwnld/SfdcAnt/salesforce_ant_41.0.zip
unzip salesforce_ant_41.0.zip
sudo mv ant-salesforce.jar /usr/local/bin

# clean
rm -rf ${temp_path}
# upgrade system to latest
sudo apt-get upgrade -y
sudo reboot