apt-get update -y

# ssh key
chmod og-rw .ssh/id_rsa

## tree
#apt-get install tree -y

## git
add-apt-repository ppa:git-core/ppa -y
apt-get update -y
apt-get install git -y
#
# dotfiles
git clone git@github.com:Xixiao007/dotfiles-ubuntu.git dotfiles
chmod +x dotfiles/bootstrap.sh && .dotfiles/bootstrap.sh

## tmux
#apt-get install tmux -y
#
## Vim
#apt-get install vim -y

# Chrome 64bit
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i --force-depends google-chrome-stable_current_amd64.deb
apt-get install -f

# vsc
wget -O vsc.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
dpkg -i --force-depends ./vsc.deb
apt-get install -f

# trivial preparation
#mkdir projects
#rm -Rf Documents Music Pictures Public Templates Videos

# i3
apt-get install conky-all -y
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
dpkg -i --force-depends ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list
apt-get update -y
apt-get install i3 feh scrot -y
apt-get install -f

apt-get install xinit -y
apt-get install x11-xserver-utils

# Fish shell
 apt-add-repository ppa:fish-shell/release-2 -y
 apt-get update -y
 apt-get install fish -y
 usermod -s /usr/bin/fish vagrant

# fishman - todo
curl -Lo ${HOME}/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher fnm
#

apt-get upgrade -y
reboot