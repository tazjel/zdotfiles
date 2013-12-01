#!/bin/bash


sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update

# http://www.ubuntulinux.jp/products/JA-Localized#repository
wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
sudo wget https://www.ubuntulinux.jp/sources.list.d/lucid.list -O /etc/apt/sources.list.d/ubuntu-ja.list
sudo apt-get update

sudo apt-get install \
emacs23 emacs23-el git-core git-doc subversion subversion-tools zsh zsh-doc build-essential \
python-profiler python-doc python-docutils python-setuptools python-dev \
ipython pyrex-mode python-mode pymacs \
openssh-server anthy ibus-anthy anthy-el \
libgtkmm-2.4-dev ruby libmmap-ruby ruby1.8-dev \
latex-beamer texinfo trash-cli inkscape language-pack-ja language-support-ja \
nkf libflickr-api-perl libflickr-upload-perl \
gimp \
libbz2-dev libdb-dev libgdbm-dev libncurses-dev libreadline-dev libsqlite3-dev libssl-dev zlib1g-dev cmake \
poppler-data sun-java6-bin sun-java6-plugin \
python-matplotlib python-scipy \
ttf-vlgothic 'ttf-ipafont*' ubuntu-restricted-extras
