# preparation
vagrant_path=/home/vagrant
temp_path=${vagrant_path}/temp
mkdir -p ${vagrant_path}/temp
cd ${temp_path}

# refresh apt-get update
apt-get update -y

# ssh key
chmod og-rw ${vagrant_path}/.ssh/id_rsa
#systemctl restart ssh

# fish as default shell
usermod -s /usr/bin/fish vagrant

# fishman - todo
curl -Lo ${vagrant_path}/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher fnm

# i3
apt-get install conky-all -y
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list
apt-get update -y
apt-get install i3 feh scrot -y
apt-get install xinit -y
apt-get install x11-xserver-utils

# Consolas font
apt-get install font-manager cabextract -y
set -e
set -x
wget -q http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
cabextract -L -F ppviewer.cab PowerPointViewer.exe
cabextract ppviewer.cab
mkdir ${vagrant_path}/.fonts
mv CONSOL* ${vagrant_path}/.fonts
fc-cache -f -v

# using the right dotfiles branch
#cd ${vagrant_path}/dotfiles
#git pull --all
#git checkout vagrant

# final cleaning
cd ${vagrant_path}
mkdir projects
rm -Rf Documents Music Pictures Public Templates Videos
rm -Rf temp

apt-get upgrade -y
reboot