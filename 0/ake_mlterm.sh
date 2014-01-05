


#tar -xzf mlterm-3.2.2.tar.gz*/
cd ~/Downloads/mlterm-3.3.2
 ./configure --enable-fribidi --prefix=~/bin/mlterm --with-type-engines=xcore,xft --enable-ssh2 --enable-optimize-redrawing --enable-uim --enable-ibus --enable-scim
make && make install
