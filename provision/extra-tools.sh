#! /usr/bin/bash
# preparation
vagrant_path=/home/vagrant
temp_path=${vagrant_path}/temp
mkdir -p ${vagrant_path}/temp
cd ${temp_path}

# oracle java8 - It is in post action because the license accept window cannot passed by in vagrant
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y

# ant
sudo apt-get install ant -y

# Ecplise
curl -k https://raw.githubusercontent.com/budhash/install-eclipse/master/install-eclipse > install-eclipse; chmod +x install-eclipse
./install-eclipse -p "https://developer.salesforce.com/media/force-ide/eclipse45" eclipse
# ./install-eclipse -p "http://download.eclipse.org/releases/neon,org.eclipse.jdt.feature.group" eclipse

# salesforce migration tool v41.0
wget -q Download https://gs0.salesforce.com/dwnld/SfdcAnt/salesforce_ant_41.0.zip
unzip salesforce_ant_41.0.zip
sudo mv ant-salesforce.jar /usr/local/bin

# clean
rm -rf ${temp_path}