sudo apt-get install aptitude 
sudo aptitude install zsh
sudo apt-get install git
git clone https://github.com/tazjel/zdotfiles.git
sudo apt-get install vim vim-scripts vim-doc vim-latexsuite vim-gui-common vim-gnome
sudo add-apt-repository ppa:falk-t-j/qtsixa
git clone https://github.com/ggreer/the_silver_searcher
the_silver_searcher && ./build.sh && install
 ./build.sh && install
sudo apt-get install autotools-dev
sudo apt-get install automake
MACHINE_TYPE=`uname -m`
   if [ ${MACHINE_TYPE} == 'x86_64' ]; then
   # 64-bit stuff here
   else
   # 32-bit stuff here
   fi" >> ~/zdotfiles/1/get_machine_type_64_32

sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
sudo apt-get install build-essential python-dev
