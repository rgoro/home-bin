#!/bin/bash

sudo apt-get update

sudo apt-get dist-upgrade -y

sudo apt-get autoremove -y

sudo apt-get install -y sl vim vim-gtk chromium-browser calibre yakuake skype git youtube-dl ipython htop pidgin-plugin-pack filezilla chromium-codecs-ffmpeg-extra texlive-latex-base texlive-latex-recommended texlive-latex-extra vim-latexsuite exuberant-ctags lame easytag subversion hugin tidy vim-addon-manager

#Activar el addon
vim-addons install latex-suite

#INRIA
#sudo apt-get install -y g++ libjsoncpp-dev

if [ ! -d ~/bin ]; then
	cd ~
	git clone https://github.com/rgoro/home-bin.git bin
fi

#Debería agregar los comandos de git para agregar los aliases
git config --global user.email "rgorojovsky@gmail.com"
git config --global user.name "Román Gorojovsky Sánchez"
git config --global alias.ci commit


cd ~

for i in bin/conf/.*; do
	 if [ ! -d "$i" ]; then 
		ln -s "$i" .
	fi
done

