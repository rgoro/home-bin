#!/bin/bash

sudo apt-get update

sudo apt-get dist-upgrade -y

sudo apt-get autoremove -y

#Basicos
sudo apt-get install -y sl vim vim-gtk chromium-browser calibre yakuake skype git ipython htop pidgin-plugin-pack filezilla chromium-codecs-ffmpeg-extra texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-lang-spanish vim-latexsuite exuberant-ctags subversion tidy vim-addon-manager

# Solo para casa
# sudo apt-get install youtube-dl lame easytag hugin mplayer

#Activar el addon
vim-addons install latex-suite

#INRIA
#sudo apt-get install -y g++ libjsoncpp-dev

#Audio para skype
#sudo apt-get install -y libasound2-plugins:i386

if [ ! -d ~/bin ]; then
	cd ~
	git clone https://github.com/rgoro/home-bin.git bin
fi

git config --global user.email "rgorojovsky@gmail.com"
git config --global user.name "Román Gorojovsky Sánchez"
git config --global alias.ci commit


cd ~

for i in bin/conf/.*; do
	 if [ ! -d "$i" ]; then 
		ln -s "$i" .
	fi
done

