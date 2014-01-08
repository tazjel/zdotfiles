#!/bin/bash

#mconfigure="1"

#If [[  mconfigure -eq '1' ]]
    #install_mlterm_1
#fi

#tar -xzf mlterm-3.2.2.tar.gz*/

#sudo apt-get install libgcroots0 libuim-scm0 libuim8 uim-common


install_mlterm_1()
{
    cd ~/Downloads/mlterm-3.3.2
    ./configure --enable-fribidi\
        --prefix=~/bin/mlterm\
        --enable-ssh2\
        --enable-optimize-redrawing\
        #--enable-uim\
        --enable-ibus\
        #--enable-scim\
        --with-type-engines=xcore,xft\
        --with-imagelib=gdk-pixbuf2\
        --with-scrollbars=sample,extra,pixmap_engine\
        --with-tools=mlclient,mlconfig,mlterm-menu,mlcc,mlterm-zoom
    make && make install
}

install_mlterm_1

read -p "Go?"


#--with-scrollbars=sample,extra,pixmap_engine
#--with-tools=mlclient,mlconfig,mlterm-menu,mlcc,mlterm-zoom
