Ref: http://www.liberiangeek.net/2013/02/install-android-sdk-adt-bundle-in-ubuntu-12-10-quantal-quetzal/
cd ~
wget http://dl.google.com/android/android-sdk_r21.1-linux.tgz
tar -xvzf android-sdk_r21.1-linux.tgz
cd android-sdk-linux/tools/
./android
gedit ~/.bashrc
#
export PATH=${PATH}:~/android-sdk-linux/platform-tools
