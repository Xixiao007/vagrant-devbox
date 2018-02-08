# preparation
vagrant_path=/home/vagrant
temp_path=${vagrant_path}/temp
mkdir -p ${vagrant_path}/temp
cd ${temp_path}

# refresh sudo apt-get update
sudo apt-get update -y

# ssh key
chmod og-rw ${vagrant_path}/.ssh/id_rsa
#systemctl restart ssh

# gnome-terminal
sudo apt-get install gnome-terminal -y

# i3
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update -y
sudo apt-get install i3 feh scrot conky-all -y
sudo apt-get install xinit -y
sudo apt-get install x11-xserver-utils

# Consolas font
sudo apt-get install font-manager cabextract -y
set -e
set -x
wget -q http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
cabextract -L -F ppviewer.cab PowerPointViewer.exe
cabextract ppviewer.cab
mkdir ${vagrant_path}/.fonts
mv CONSOL* ${vagrant_path}/.fonts
fc-cache -f -v

# fish as default shell
sudo usermod -s /usr/bin/fish vagrant

# fishman
curl -Lo ${vagrant_path}/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# salesforce migration tool v41.0
wget -q Download https://gs0.salesforce.com/dwnld/SfdcAnt/salesforce_ant_41.0.zip
unzip salesforce_ant_41.0.zip
sudo mv ant-salesforce.jar /usr/local/bin

# cleaning folders
cd ${vagrant_path}
mkdir projects
rm -Rf Documents Music Pictures Public Templates Videos
rm -Rf temp

# auto-login
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
echo '[Service]
ExecStart=
ExecStart=-/sbin/agetty --noissue --autologin vagrant %I $TERM
Type=idle' | sudo tee --append /etc/systemd/system/getty@tty1.service.d/override.conf

# prepare post_action to be manually run after provision
# I didn't figure out how to do it in bash script
cp /vagrant/provision/post_action.sh ${vagrant_path}
chmod +x ${vagrant_path}/post_action.sh

sudo reboot