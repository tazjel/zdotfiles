# http://askubuntu.com/questions/155852/installing-chrome-java-plugin
mkdir -p /opt/google/chrome/plugins

# Google Chrome
#Become the root user by running the su command and then enter the super-user password. Type: 
sudo -s

#Create a directory called plugins if you do not have it. Type: 
mkdir -p /opt/google/chrome/plugins

#Go to Google chrome plugins directory before you make the symbolic link. Type: 
cd /opt/google/chrome/plugins

#Create a symbolic link. Type: 
ln -s /usr/local/java/jre1.7.0/lib/amd64/libnpjp2.so

#Restart your browser and test Java


# Mozilla Firefox
# Become the root user by running the su command and then enter the super-user password. Type: 
sudo -s
# Create a directory called plugins if you do not have it. Type: 
mkdir -p /usr/lib/mozilla/plugins
# Go to Google chrome plugins directory before you make the symbolic link. Type: 
cd /usr/lib/mozilla/plugins
# Create a symbolic link. Type: 
ln -s /usr/local/java/jre1.7.0/lib/amd64/libnpjp2.so
# Restart your browser and test Java