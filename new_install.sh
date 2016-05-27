#!/bin/bash

sudo apt-get update

sudo apt-get dist-upgrade -y

sudo apt-get autoremove -y

#Basicos
sudo apt-get install -y sl vim vim-gtk yakuake chromium-browser git ipython htop pidgin-plugin-pack filezilla chromium-codecs-ffmpeg-extra multitail exuberant-ctags tidy vim-addon-manager mc compizconfig-settings-manager

#Basicos II
#sudo apt-get install -y texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-lang-spanish vim-latexsuite subversion

# Solo para casa
# sudo apt-get install -y youtube-dl lame easytag hugin mplayer calibre banshee

#Activar el addon
#vim-addons install latex-suite

#INRIA
#sudo apt-get install -y g++ libjsoncpp-dev

#Skype
#sudo apt-get install -y skype libasound2-plugins:i386

if [ ! -d ~/bin ]; then
	cd ~
	git clone https://github.com/rgoro/home-bin.git bin
fi

git config --global user.email "rgorojovsky@gmail.com"
git config --global user.name "Román Gorojovsky Sánchez"
git config --global alias.ci commit
git config --global alias.st status

#Node.js y JsHint
#sudo apt-get install npm
#sudo ln -s /usr/bin/nodejs /usr/bin/node
#sudo npm install -g jshint
#
#if ![ -d ~/.vim/bundle ]; then
#	mkdir ~/.vim/bundle
#fi
#
#cd ~/.vim/bundle/
#git clone https://github.com/Shutnik/jshint2.vim.git


cd ~

for i in bin/conf/.*; do
	 if [ ! -d "$i" ]; then 
		ln -s "$i" .
	fi
done

