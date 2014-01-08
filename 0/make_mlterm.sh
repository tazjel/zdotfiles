#!/bin/bash

./configure \
 --enable-fribidi \
--enable-debug \
--enable-optimize-redrawing \
--with-tools \
--enable-uim \
--enable-m17nlib \
--enable-ibus \
--enable-vt52 \
--enable-optimize-redrawing \
--with-scrollbars \
--with-tools \
--enable-debug \
--enable-utmp \
  
--enable-ssh2 && make && make install

