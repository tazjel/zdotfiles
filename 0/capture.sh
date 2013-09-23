#!/bin/bash
# Date:  Tue Sep  3 10:21:50 AST 2013
# Author: Ahmed

sudo apt-get update

sudo apt-get install -y build-essential llvm clang \
  mono-runtime python2.7 python3.3 python-software-properties \
  perl ghc cabal-install golang-go golang-go \
  golang-tools erlang gprolog g++ make quickly quickly-ubuntu-template

sudo apt-get install -y tmux vim p7zip cmake curl wget exuberant-ctags htop zsh rlwrap python-pip aptitude xclip unhtml postgresql python-setuptools vim-gtk subversion mercurial git cvs blender

java_7()
{
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
}

sublime_text 2()
{
    sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
    sudo apt-get update
    sudo apt-get install -y sublime-text
}
beyond_compare()

{
wget http://www.scootersoftware.com/bcompare-3.3.7.15876_amd64.deb
sudo dpkg -i bcompare-3.3.7.15876_amd64.deb
sudo apt-get -f -y install
}

install_rvm_and_ruby()
{
curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled
}
{
nodejs_and_coffee-script()
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs -y
sudo npm install -g mocha cucumber coffee-script iced-coffee-script

}


install_Chrome()
{
wget -c www.mirrorservice.org/sites/archive.ubuntu.com/ubuntu//pool/main/u/udev/libudev0_175-0ubuntu13_amd64.deb
sudo dpkg -i libudev0*.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome*.deb
sudo apt-get -f -y install
}

mkdir_apps ()
{
mkdir ~/apps
}
intellij()
{
wget http://download.jetbrains.com/idea/ideaIU-12.1.2.tar.gz -T 5
tar xfz ideaIU-12.1.2.tar.gz
mv idea-IU-129.354 ~/apps/idea


}

rubymine()

{
wget http://download.jetbrains.com/ruby/RubyMine-5.4.1.tar.gz -T 5
tar xfz RubyMine-5.4.1.tar.gz
mv RubyMine-5.4.1 ~/apps/rubymine


}
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

rm *.deb
rm *.gz



echo "Installation completed."
exit 0
