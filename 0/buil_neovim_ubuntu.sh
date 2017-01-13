# how to install Neovim under Ubuntu
# https://github.com/neovim/neovim/archive/master.zip

sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++

# Build and install the project:

make cmake
make test
sudo make install

# Install the “neovim” Python package:
pip2 install neovim
pip3 install neovim

