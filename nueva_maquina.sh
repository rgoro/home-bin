#!/bin/bash

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update

sudo apt dist-upgrade -y

sudo apt autoremove -y

#Basicos
sudo apt install -y sl bat google-chrome-stable chrome-gnome-shell vim vim-gtk yakuake git htop filezilla multitail exuberant-ctags vim-addon-manager mc compizconfig-settings-manager

#Basicos II
sudo apt install -y texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-lang-spanish vim-latexsuite

# Solo para casa
sudo apt install -y spotify-client youtube-dl vlc lame easytag hugin mplayer calibre clementine openjdk-16-jre openjdk-17-jre gimp

# Porque algodón
sudo apt install -y g++ cmake valgrind

#Activar el addon
vim-addons install latex-suite

sudo snap install shotcut --classic

sudo apt install -y

if [ ! -d ~/bin ]; then
	cd ~
	git clone https://github.com/rgoro/home-bin.git bin
fi

git config --global user.email "rgorojovsky@gmail.com"
git config --global user.name "Román Gorojovsky Sánchez"
git config --global alias.ci commit
git config --global alias.st status


cd ~

for i in bin/conf/.*; do
	 if [ ! -d "$i" ]; then 
		ln -s "$i" .
	fi
done

