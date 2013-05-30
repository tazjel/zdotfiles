
#!/bin/bash
### list of packages to install.

aptitude
zsh
git
vim vim-scripts vim-doc vim-latexsuite vim-gui-common vim-gnome
autotools-dev
automake
build-essential
python-dev
automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

                            ################

git clone https://github.com/ggreer/the_silver_searcher
the_silver_searcher && ./build.sh && install
 ./build.sh && install



                            ################
#check MACHINE_TYPE
MACHINE_TYPE=`uname -m`
   if [ ${MACHINE_TYPE} == 'x86_64' ]; then
   # 64-bit stuff here
   else
   # 32-bit stuff here
   fi
