wget http://www.web2py.com/examples/static/web2py_src.zip
unzip web2py_src.zip

# git clone git://github.com/web2py/web2py.git
cd web2py/applications
hg clone https://bitbucket.org/speedbird/qastack

python -c "from gluon.main import save_password; save_password(raw_input('admin  password: '),433)"


#Edit the "/var/www/<username>_pythonanywhere_com_wsgi.py" file and write in it:

#import sys
#path = '/home/<username>/web2py'
#if path not in sys.path: sys.path.append(path)
#from wsgihandler import application # the web2py handler


#wget http://web2py.googlecode.com/hg/scripts/setup-web2py-ubuntu.sh
#chmod +x setup-web2py-ubuntu.sh
#sudo ./setup-web2py-ubuntu.sh
