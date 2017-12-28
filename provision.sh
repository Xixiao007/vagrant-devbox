cd Download
apt-get update -y
#apt-get upgrade -y

## tree
#apt-get install tree -y
#
## git
#add-apt-repository ppa:git-core/ppa -y
#apt-get update -y
#apt-get install git -y
#
## tmux
#apt-get install tmux -y
#
## Vim
#apt-get install vim -y
#
## Chrome 64bit
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#dpkg -i google-chrome-stable_current_amd64.deb
#apt-get install -f -y

# Fish shell
# apt-add-repository ppa:fish-shell/release-2 -y
# apt-get update -y
# apt-get install fish -y
# usermod -s /usr/bin/fish vagrant

# fishman - todo
#`curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher`
#fisher fnm

## vsc
#wget -O vsc.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
#sudo dpkg -i ./vsc.deb
#sudo apt-get install -f


# dotfiles
#git clone git@github.com:Xixiao007/dotfiles-ubuntu.git ${HOME}/dotfiles
#chmod +x ${HOME}/dotfiles/bootstrap.sh && ${HOME}/bootstrap.sh

# trivial preparation
# mkdir $HOME/projects
# rm -Rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

# gui
#apt install -y lightdm  
#systemctl enable lightdm
#apt-get install ubuntu-session
#systemctl reboot

## i3
apt-get install conky-all -y
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list
apt-get update -y
apt-get install i3 feh scrot -y

apt-get install xinit -y