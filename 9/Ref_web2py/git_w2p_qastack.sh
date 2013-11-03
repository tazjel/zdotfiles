#!/bin/bash

mv ~/zdotfiles/9/web2py ~/zdotfiles/9/web2py-bkp
cd ~/zdotfiles/9

#wget http://www.web2py.com/examples/static/web2py_src.zip
#unzip web2py_src.zip
#rm web2py_src.zip
git clone git://github.com/web2py/web2py.git
cd web2py/applications
hg clone https://bitbucket.org/speedbird/qastack

#python -c "from gluon.main import save_password; save_password(raw_input('admin  password: '),433)"

