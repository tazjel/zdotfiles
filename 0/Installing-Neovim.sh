
# Ref : https://github.com/neovim/neovim/wiki/Installing-Neovim

sudo apt-get install software-properties-common


# Prerequisites for the Python modules:

sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install python-dev python-pip python3-dev
sudo apt-get install python3-setuptools
sudo easy_install3 pip

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim



# If you want to use Neovim for some (or all) of the editor alternatives, use the following commands:

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
