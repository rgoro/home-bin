#!/bin/bash

sudo apt-get update

sudo apt-get dist-upgrade -y

sudo apt-get autoremove -y

sudo apt-get install -y vim vim-gtk chromium-browser calibre yakuake skype git youtube-dl ipython htop pidgin-plugin-pack filezilla chromium-codecs-ffmpeg-extra texlive-latex-base texlive-latex-recommended vim-latexsuite exuberant-ctags lame easytag

if [ ! -d ~/bin ]; then
	cd ~
	git clone https://github.com/rgoro/home-bin.git bin
fi

cd ~/bin

cp conf/.* ~  

