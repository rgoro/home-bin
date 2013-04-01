#!/bin/bash

apt-get update

apt-get dist-upgrade -y

apt-get autoremove -y

apt-get install -y vim vim-gtk chromium-browser calibre yakuake skype git youtube-dl ipython htop pidgin-plugin-pack filezilla chromium-codecs-ffmpeg-extra texlive-latex-base texlive-latex-recommended vim-latexsuite exuberant-ctags


